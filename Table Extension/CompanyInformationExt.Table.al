tableextension 50100 "Company Information Ext" extends "Company Information"
{
    fields
    {
        field(50100; "Data Transfer From Chronus"; Boolean)
        {
            Caption = 'Data Transfer From Chronus';
            DataClassification = CustomerContent;
        }
    }
}
