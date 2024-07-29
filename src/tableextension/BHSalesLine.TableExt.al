tableextension 50002 "BH Sales Line" extends "Sales Line"
{
    fields
    {
        field(50000; "BH Transport Unit"; Code[20])
        {
            Caption = 'Transport Unit';
            Editable = false;
            TableRelation = "BH Transport Unit"."No.";
            DataClassification = CustomerContent;
        }
    }
}