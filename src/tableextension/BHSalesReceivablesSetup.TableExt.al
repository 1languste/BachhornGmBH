tableextension 50001 "BH Sales & Receivables Setup" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50000; "BH Transp. Costs Limit"; Decimal)
        {
            Caption = 'Transp. Costs Limit';
            AutoFormatType = 1;
        }
        field(50001; "BH Transp. Costs It Charge No."; Code[20])
        {
            Caption = 'Transp. Costs Item Charge No.';
            TableRelation = "Item Charge"."No.";
        }
    }
}