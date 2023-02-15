tableextension 50101 CustomerExt extends Customer
{
    trigger OnAfterInsert()
    begin
        Company.SetFilter(Name, '<>CRONUS International Ltd.');
        Company.FindSet();
        repeat
            ChangeCompanyCustomer.ChangeCompany(Company.Name);
            CompanyInformation.ChangeCompany(Company.Name);
            CompanyInformation.Get();
            if CompanyInformation."Data Transfer From Chronus" then begin
                ChangeCompanyCustomer.LockTable();
                ChangeCompanyCustomer.Init();
                ChangeCompanyCustomer.TransferFields(Rec);
                ChangeCompanyCustomer.Insert();
            end;
        until Company.Next() = 0;
        Message('Insertion is Successful');
    end;

    trigger OnAfterModify()
    begin
        Company.SetFilter(Name, '<>CRONUS International Ltd.');
        Company.FindSet();
        repeat
            ChangeCompanyCustomer.ChangeCompany(Company.Name);
            CompanyInformation.ChangeCompany(Company.Name);
            CompanyInformation.Get();
            if CompanyInformation."Data Transfer From Chronus" then begin
                ChangeCompanyCustomer.LockTable();
                ChangeCompanyCustomer.Get(Rec."No.");
                ChangeCompanyCustomer.TransferFields(Rec);
                ChangeCompanyCustomer.Modify();
            end;
        until Company.Next() = 0;
        Message('Modification is Successful');
    end;

    trigger OnAfterDelete()
    begin
        Company.SetFilter(Name, '<>CRONUS International Ltd.');
        Company.FindSet();
        repeat
            ChangeCompanyCustomer.ChangeCompany(Company.Name);
            CompanyInformation.ChangeCompany(Company.Name);
            CompanyInformation.Get();
            if CompanyInformation."Data Transfer From Chronus" then begin
                ChangeCompanyCustomer.LockTable();
                ChangeCompanyCustomer.Get(Rec."No.");
                ChangeCompanyCustomer.Delete();
            end;
        until Company.Next() = 0;
        Message('Deletion is Successful');
    end;

    // local procedure IsEnabledDataTransfer(): Boolean
    // begin
    //     if CompanyInformation.Get() then
    //         if CompanyInformation."Data Transfer From Chronus" then
    //             exit(true)
    //         else
    //             exit(false);
    // end;

    // local procedure ChooseDataTransferCompany()
    // begin
    //     Company.SetFilter(Name, '<>CRONUS International Ltd.');
    //     Company.FindSet();
    // end;
    //why this findset not working for OnAfterInsert trigger?

    var
        ChangeCompanyCustomer: Record Customer;
        Company: Record Company;
        CompanyInformation: Record "Company Information";
}
