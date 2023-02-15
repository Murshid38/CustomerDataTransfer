pageextension 50100 "Company Information Ext" extends "Company Information"
{

    layout
    {
        addafter(Picture)
        {
            field("Data Transfer From Chronus"; Rec."Data Transfer From Chronus")
            {
                ApplicationArea = All;
                Visible = IsVisible;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if Rec.Name = 'CRONUS International Ltd.' then
            IsVisible := false
        else
            IsVisible := true;
    end;

    var
        myInt: Integer;
        IsVisible: Boolean;
}
