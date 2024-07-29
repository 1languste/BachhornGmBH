codeunit 50001 "BH Events"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnCopyFromItemOnAfterCheck, '', false, false)]
    local procedure SalesLine_OnCopyFromItemOnAfterCheck(var SalesLine: Record "Sales Line"; Item: Record Item)
    begin
        SalesLine."BH Transport Unit" := Item."BH Transport Unit";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnBeforeReleaseSalesDoc, '', false, false)]
    local procedure "Release Sales Document_OnBeforeReleaseSalesDoc"(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean; var IsHandled: Boolean; var SkipCheckReleaseRestrictions: Boolean; SkipWhseRequestOperations: Boolean)
    var
        TransportationCostsMgt: Codeunit "BH Transportation Costs Mgt.";
    begin
        TransportationCostsMgt.CalcTransportationCosts(SalesHeader);
    end;
}