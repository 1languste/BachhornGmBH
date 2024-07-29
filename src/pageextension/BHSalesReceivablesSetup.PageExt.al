pageextension 50001 "BH Sales & Receivables Setup" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter(General)
        {
            group("BH Tranportation Costs")
            {
                field("BH Transp. Costs It Charge No."; Rec."BH Transp. Costs It Charge No.")
                {
                    ApplicationArea = All;
                }
                field("BH Transp. Costs Limit"; Rec."BH Transp. Costs Limit")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}