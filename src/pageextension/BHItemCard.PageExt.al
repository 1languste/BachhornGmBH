pageextension 50000 "BH Item Card" extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field("BH Transport Unit"; Rec."BH Transport Unit")
            {
                ApplicationArea = All;
            }
        }
    }
}