tableextension 50101 CustomerExt extends Customer
{
    trigger OnAfterInsert()
    var
        CurrentCompanyCustomer: Record Customer;
        ChangeCompanyCustomer: Record Customer;
    begin
        if IsEnabledDataTransferForDemo1() then begin
            ChangeCompanyCustomer.ChangeCompany('Demo 1');
            ChangeCompanyCustomer.Init();
            ChangeCompanyCustomer.TransferFields(Rec);
            ChangeCompanyCustomer.Insert();
            Message('Insertion to Demo 1 is successful!');
        end;

        if IsEnabledDataTransferForDemo2() then begin
            ChangeCompanyCustomer.ChangeCompany('Demo 2');
            ChangeCompanyCustomer.Init();
            ChangeCompanyCustomer.TransferFields(Rec);
            ChangeCompanyCustomer.Insert();
            Message('Insertion to Demo 2 is successful!');
        end;
    end;

    trigger OnAfterModify()
    var
        CurrentCompanyCustomer: Record Customer;
        ChangeCompanyCustomer: Record Customer;
    begin
        if IsEnabledDataTransferForDemo1() then begin
            ChangeCompanyCustomer.ChangeCompany('Demo 1');
            ChangeCompanyCustomer.Get(Rec."No.");
            ChangeCompanyCustomer.TransferFields(Rec);
            ChangeCompanyCustomer.Modify();
            Message('Modification to Demo 1 is successful!');
        end;

        if IsEnabledDataTransferForDemo2() then begin
            ChangeCompanyCustomer.ChangeCompany('Demo 2');
            ChangeCompanyCustomer.Get(Rec."No.");
            ChangeCompanyCustomer.TransferFields(Rec);
            ChangeCompanyCustomer.Modify();
            Message('Modification to Demo 2 is successful!');
        end;
    end;

    trigger OnAfterDelete()
    var
        CurrentCompanyCustomer: Record Customer;
        ChangeCompanyCustomer: Record Customer;
    begin
        if IsEnabledDataTransferForDemo1() then begin
            ChangeCompanyCustomer.ChangeCompany('Demo 1');
            ChangeCompanyCustomer.Get(Rec."No.");
            ChangeCompanyCustomer.Delete();
            Message('Deletion in Demo 1 is successfull');
        end;

        if IsEnabledDataTransferForDemo2() then begin
            ChangeCompanyCustomer.ChangeCompany('Demo 2');
            ChangeCompanyCustomer.Get(Rec."No.");
            ChangeCompanyCustomer.Delete();
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
