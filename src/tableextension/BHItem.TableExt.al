tableextension 50000 "BH Item" extends Item
{
    fields
    {
        field(50000; "BH Transport Unit"; Code[20])
        {
            Caption = 'Transport Unit';
            TableRelation = "BH Transport Unit"."No.";
            DataClassification = CustomerContent;
        }
    }
}