table 50000 "BH Transport Unit"
{
    DataClassification = CustomerContent;
    Caption = 'Transport Unit';
    LookupPageId = "BH Transport Units";
    DrillDownPageId = "BH Transport Units";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}