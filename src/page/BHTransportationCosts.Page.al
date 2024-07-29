page 50001 "BH Transportation Costs"
{
    Caption = 'Transportation Costs';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "BH Transportation Costs";

    layout
    {
        area(Content)
        {
            repeater(general)
            {
                field(Country; Rec.Country)
                {
                    ApplicationArea = All;
                }
                field("Transport Unit"; Rec."Transport Unit")
                {
                    ApplicationArea = All;
                }
                field(Price; Rec.Price)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}