table 50001 "BH Transportation Costs"
{
    DataClassification = CustomerContent;
    Caption = 'Transportation Costs';
    LookupPageId = "BH Transportation Costs";
    DrillDownPageId = "BH Transportation Costs";

    fields
    {
        field(1; Country; Code[10])
        {
            Caption = 'Country';
            TableRelation = "Country/Region".Code;
        }
        field(2; "Transport Unit"; Code[10])
        {
            Caption = 'Transport Unit';
            TableRelation = "BH Transport Unit"."No.";
        }
        field(3; Price; Decimal)
        {
            Caption = 'Price';
            AutoFormatType = 1;
        }
    }

    keys
    {
        key(PK; Country, "Transport Unit")
        {
            Clustered = true;
        }
    }
}