page 50000 "BH Transport Units"
{
    Caption = 'Transport Units';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "BH Transport Unit";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Name; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(desc; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}