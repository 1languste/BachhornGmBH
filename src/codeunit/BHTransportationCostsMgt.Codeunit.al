codeunit 50000 "BH Transportation Costs Mgt."
{
    procedure CalcTransportationCosts(SalesHeader: Record "Sales Header")
    var
        BHTransportationCosts: Record "BH Transportation Costs";
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        SalesLine: Record "Sales Line";
        TransportationCosts: Decimal;
        TransportUnitFilter: Text;
    begin
        SalesReceivablesSetup.Get();
        SalesReceivablesSetup.TestField("BH Transp. Costs Limit");
        SalesReceivablesSetup.TestField("BH Transp. Costs It Charge No.");
        SetSalesLineItemFilter(SalesHeader, SalesLine);
        if SalesLine.IsEmpty then
            exit;
        SalesLine.CalcSums("Unit Price");
        if SalesLine."Unit Price" > SalesReceivablesSetup."BH Transp. Costs Limit" then
            exit;
        GetTransportUnitFilter(SalesHeader, TransportUnitFilter);
        BHTransportationCosts.SetCurrentKey(Price);
        BHTransportationCosts.SetRange(Country, SalesHeader."Ship-to Country/Region Code");
        BHTransportationCosts.SetFilter("Transport Unit", TransportUnitFilter);
        BHTransportationCosts.FindLast();
        TransportationCosts := BHTransportationCosts.Price;
        CreateTransportCostSalesLine(SalesHeader, TransportationCosts, SalesReceivablesSetup."BH Transp. Costs It Charge No.")
    end;

    local procedure GetTransportUnitFilter(SalesHeader: Record "Sales Header"; var TransportUnitFilter: Text)
    var
        SalesLine: Record "Sales Line";
    begin
        TransportUnitFilter := '';
        SetSalesLineItemFilter(SalesHeader, SalesLine);
        if SalesLine.IsEmpty then
            exit;
        SalesLine.SetLoadFields("BH Transport Unit");
        SalesLine.FindSet();
        repeat
            if TransportUnitFilter = '' then
                TransportUnitFilter := SalesLine."BH Transport Unit"
            else
                TransportUnitFilter += '|' + SalesLine."BH Transport Unit";
        until SalesLine.Next() = 0;
    end;

    local procedure SetSalesLineItemFilter(SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line")
    begin
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        SalesLine.SetRange(Type, SalesLine.Type::Item);
    end;

    local procedure CreateTransportCostSalesLine(SalesHeader: Record "Sales Header"; TransportationCosts: Decimal; TranspCostsItemChargeNo: Code[20])
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.Init();
        SalesLine."Document Type" := SalesHeader."Document Type";
        SalesLine."Document No." := SalesHeader."No.";
        SalesLine."Line No." := GetNextLineNo(SalesHeader);
        SalesLine.Validate(Type, SalesLine.Type::"Charge (Item)");
        SalesLine.Validate("No.", TranspCostsItemChargeNo);
        SalesLine.Validate(Quantity, 1);
        SalesLine.Validate("Unit Price", TransportationCosts);
        SalesLine.Insert(true);
    end;

    local procedure GetNextLineNo(SalesHeader: Record "Sales Header") LineNo: Integer
    var
        SalesLine: Record "Sales Line";
    begin
        LineNo := 10000;
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        if SalesLine.FindLast() then
            LineNo += SalesLine."Line No.";
    end;
}