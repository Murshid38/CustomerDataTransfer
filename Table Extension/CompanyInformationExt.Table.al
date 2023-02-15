tableextension 50100 "Company Information Ext" extends "Company Information"
{
    fields
    {
        field(50100; "Data Transfer For Demo 1"; Boolean)
        {
            Caption = 'Customer Data Transfer For Demo 1';
            DataClassification = CustomerContent;
        }
        field(50101; "Data Transfer For Demo 2"; Boolean)
        {
            Caption = 'Customer Data Transfer For Demo 2';
            DataClassification = CustomerContent;
        }
    }
}
