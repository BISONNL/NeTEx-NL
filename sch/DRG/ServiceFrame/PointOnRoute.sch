<sch:pattern id="DRG.ServiceFrame.PointOnRoute" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:routes/ntx:Route/ntx:pointsInSequence/ntx:PointOnRoute">
        <!-- A: De FromPointRef van de OnwardRouteLink is gelijk aan de RoutePointRef -->
        <sch:assert test="not(ntx:OnwardRouteLinkRef) or
            ntx:RoutePointRef/@ref = //ntx:RouteLink[@id=current()/ntx:OnwardRouteLinkRef/@ref]/ntx:FromPointRef/@ref">
            De FromPointRef van de OnwardRouteLink moet gelijk zijn aan de RoutePointRef van dit PointOnRoute
        </sch:assert>
        <!-- A (vervolg): De ToPointRef van de OnwardRouteLink is gelijk aan de RoutePointRef van het volgende PointOnRoute -->
        <sch:assert test="not(ntx:OnwardRouteLinkRef) or not(following-sibling::ntx:PointOnRoute) or
            following-sibling::ntx:PointOnRoute[1]/ntx:RoutePointRef/@ref = //ntx:RouteLink[@id=current()/ntx:OnwardRouteLinkRef/@ref]/ntx:ToPointRef/@ref">
            De ToPointRef van de OnwardRouteLink moet gelijk zijn aan de RoutePointRef van het volgende PointOnRoute
        </sch:assert>
    </sch:rule>
</sch:pattern>
