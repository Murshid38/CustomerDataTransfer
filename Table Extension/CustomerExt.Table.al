tableextension 50101 CustomerExt extends Customer
{
    trigger OnAfterInsert()
    begin
        GetDataTransferCompanies();
        repeat
            ChangeCompanyAndInformation();
            if CompanyInformation."Data Transfer From Chronus" then begin
                ChangeCompanyCustomer.Init();
                ChangeCompanyCustomer.TransferFields(Rec);
                ChangeCompanyCustomer.Insert();
            end;
        until Company.Next() = 0;
        Message('Insertion is Successful');
    end;

    trigger OnAfterModify()
    begin
        GetDataTransferCompanies();
        repeat
            ChangeCompanyAndInformation();
            if CompanyInformation."Data Transfer From Chronus" then begin
                ChangeCompanyCustomer.Get(Rec."No.");
                ChangeCompanyCustomer.TransferFields(Rec);
                ChangeCompanyCustomer.Modify();
            end;
        until Company.Next() = 0;
        Message('Modification is Successful');
    end;

    trigger OnAfterDelete()
    begin
        GetDataTransferCompanies();
        repeat
            ChangeCompanyAndInformation();
            if CompanyInformation."Data Transfer From Chronus" then begin
                ChangeCompanyCustomer.Get(Rec."No.");
                ChangeCompanyCustomer.Delete();
            end;
        until Company.Next() = 0;
        Message('Deletion is Successful');
    end;

    local procedure GetDataTransferCompanies()
    begin
        Company.SetFilter(Name, '<>CRONUS International Ltd.');
        Company.FindSet();
    end;

    local procedure ChangeCompanyAndInformation()
    begin
        ChangeCompanyCustomer.ChangeCompany(Company.Name);
        ChangeCompanyCustomer.LockTable();
        CompanyInformation.ChangeCompany(Company.Name);
        CompanyInformation.Get();
    end;

    var
        ChangeCompanyCustomer: Record Customer;
        Company: Record Company;
        CompanyInformation: Record "Company Information";
}
