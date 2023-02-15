pageextension 50100 "Company Information Ext" extends "Company Information"
{

    layout
    {
        addafter(Picture)
        {
            field("Data Transfer For Demo 1"; Rec."Data Transfer For Demo 1")
            {
                ApplicationArea = All;
                Visible = IsVisible;
            }
            field("Data Transfer For Demo 2"; Rec."Data Transfer For Demo 2")
            {
                ApplicationArea = All;
                Visible = IsVisible;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if Rec.Name = 'CRONUS International Ltd.' then
            IsVisible := true
        else
            IsVisible := false;
    end;

    var
        myInt: Integer;
        IsVisible: Boolean;
}
