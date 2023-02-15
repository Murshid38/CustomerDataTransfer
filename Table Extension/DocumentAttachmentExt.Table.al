tableextension 50102 "Document Attachment Ext" extends "Document Attachment"
{
    trigger OnAfterInsert()
    var
        ChangeCompanyAttachment: Record "Document Attachment";
    begin
        if IsEnabledDataTransferForDemo1() then begin
            ChangeCompanyAttachment.ChangeCompany('Demo 1');
            ChangeCompanyAttachment.Init();
            ChangeCompanyAttachment.TransferFields(Rec);
            ChangeCompanyAttachment.Insert();
            Message('Attachment Insertion to Demo 1 is successful!');
        end;

        if IsEnabledDataTransferForDemo2() then begin
            ChangeCompanyAttachment.ChangeCompany('Demo 2');
            ChangeCompanyAttachment.Init();
            ChangeCompanyAttachment.TransferFields(Rec);
            ChangeCompanyAttachment.Insert();
            Message('Attachment Insertion to Demo 2 is successful!');
        end;
    end;

    trigger OnAfterDelete()
    var
        ChangeCompanyAttachment: Record "Document Attachment";
    begin
        if IsEnabledDataTransferForDemo1() then begin
            ChangeCompanyAttachment.ChangeCompany('Demo 1');
            ChangeCompanyAttachment.Get(Rec."Table ID", Rec."No.", Rec."Document Type", Rec."Line No.", Rec.ID);
            ChangeCompanyAttachment.Delete();
            Message('Deletion in Demo 1 is successfull');
        end;

        if IsEnabledDataTransferForDemo2() then begin
            ChangeCompanyAttachment.ChangeCompany('Demo 2');
            ChangeCompanyAttachment.Get("Table ID", Rec."Table ID", "No.", Rec."No.", "Document Type", Rec."Document Type", "Line No.", Rec."Line No.", ID, Rec.ID);
            ChangeCompanyAttachment.Delete();
            Message('Deletion in Demo 2 is successfull');
        end;
    end;

    local procedure IsEnabledDataTransferForDemo1(): Boolean
    begin
        if CompanyInformation.Get() then
            if CompanyInformation."Data Transfer For Demo 1" then
                exit(true)
            else
                exit(false);
    end;

    local procedure IsEnabledDataTransferForDemo2(): Boolean
    begin
        if CompanyInformation.Get() then
            if CompanyInformation."Data Transfer For Demo 2" then
                exit(true)
            else
                exit(false);
    end;

    var
        CompanyInformation: Record "Company Information";
}
