tableextension 50102 "Document Attachment Ext" extends "Document Attachment"
{
    trigger OnAfterInsert()
    begin
        GetDataTransferCompanies();
        repeat
            ChangeCompanyAndInformation();
            if CompanyInformation."Data Transfer From Chronus" then begin
                ChangeCompanyAttachment.Init();
                ChangeCompanyAttachment.TransferFields(Rec);
                ChangeCompanyAttachment.Insert();
            end;
        until Company.Next() = 0;
        Message('Insertion is Successful');
    end;

    trigger OnAfterDelete()
    begin
        GetDataTransferCompanies();
        repeat
            ChangeCompanyAndInformation();
            if CompanyInformation."Data Transfer From Chronus" then begin
                ChangeCompanyAttachment.Get(Rec."Table ID", Rec."No.", Rec."Document Type", Rec."Line No.", Rec.ID);
                ChangeCompanyAttachment.Delete();
            end;
        until Company.Next() = 0;
        Message('Deletion is Successful');
    end;

    local procedure IsEnabledDataTransfer(): Boolean
    begin
        if CompanyInformation.Get() then
            if CompanyInformation."Data Transfer From Chronus" then
                exit(true)
            else
                exit(false);
    end;

    local procedure GetDataTransferCompanies()
    begin
        Company.SetFilter(Name, '<>CRONUS International Ltd.');
        Company.FindSet();
    end;

    local procedure ChangeCompanyAndInformation()
    begin
        ChangeCompanyAttachment.ChangeCompany(Company.Name);
        ChangeCompanyAttachment.LockTable();
        CompanyInformation.ChangeCompany(Company.Name);
        CompanyInformation.Get();
    end;

    var
        ChangeCompanyAttachment: Record "Document Attachment";
        Company: Record Company;
        CompanyInformation: Record "Company Information";
}
