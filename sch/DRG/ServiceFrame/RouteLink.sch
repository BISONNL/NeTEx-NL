<sch:pattern id="DRG.ServiceFrame.RouteLink" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:routeLinks/ntx:RouteLink">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="gml:LineString">LineString is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A: De Distance is minimaal de hemelsbrede afstand tussen FromPointRef en ToPointRef -->
        <!-- Niet implementeerbaar in Schematron: vereist haversine-berekening (sin/cos/atan2 niet beschikbaar in XPath 2.0) -->

        <!-- B: LineString begint op FromPointRef coördinaat en eindigt op ToPointRef coördinaat -->
        <sch:let name="posList" value="normalize-space(gml:LineString/gml:posList)"/>
        <sch:let name="fromPointCoord" value="normalize-space(//ntx:RoutePoint[@id=current()/ntx:FromPointRef/@ref]/ntx:Location/gml:pos)"/>
        <sch:let name="toPointCoord" value="normalize-space(//ntx:RoutePoint[@id=current()/ntx:ToPointRef/@ref]/ntx:Location/gml:pos)"/>
        <sch:assert test="$fromPointCoord='' or starts-with($posList, $fromPointCoord)">
            Het geografisch pad (LineString) moet beginnen op de coördinaat van de FromPointRef
        </sch:assert>
        <sch:assert test="$toPointCoord='' or (substring($posList, string-length($posList) - string-length($toPointCoord) + 1) = $toPointCoord)">
            Het geografisch pad (LineString) moet eindigen op de coördinaat van de ToPointRef
        </sch:assert>
    </sch:rule>
</sch:pattern>