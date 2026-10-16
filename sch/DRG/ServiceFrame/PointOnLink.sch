<sch:pattern id="DRG.ServiceFrame.PointOnLink" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:routeLinks/ntx:RouteLink/ntx:passingThrough/ntx:PointOnLink">
        <!-- PointOnLink.A: DistanceFromStart moet kleiner zijn dan Distance van de bijbehorende RouteLink -->
        <sch:assert test="number(ntx:DistanceFromStart) lt number(ancestor::ntx:RouteLink/ntx:Distance)">
            De DistanceFromStart van een PointOnLink moet kleiner zijn dan de Distance van de bijbehorende RouteLink
        </sch:assert>

        <!-- passingThrough.A: De coördinaten van elk PointOnLink zijn vermeld in de LineString van de RouteLink -->
        <sch:assert test="not(ntx:Location/gml:pos) or contains(normalize-space(ancestor::ntx:RouteLink/gml:LineString/gml:posList), normalize-space(ntx:Location/gml:pos))">
            De coördinaten van een PointOnLink moeten voorkomen in de LineString (posList) van de bijbehorende RouteLink
        </sch:assert>
    </sch:rule>
</sch:pattern>