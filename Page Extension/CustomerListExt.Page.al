pageextension 50101 CustomerListExt extends "Customer List"
{
    actions
    {
        addafter("&Customer")
        {
            action(DeleteCustomers)
            {
                ApplicationArea = All;
                Caption = 'Delete Selected Customers';
                Image = Delete;

                trigger OnAction()
                var
                    Customer: Record Customer;
                begin
                    CurrPage.SetSelectionFilter(Customer);
                    Customer.FindSet();
                    Customer.DeleteAll();
                end;
            }
        }
    }
}