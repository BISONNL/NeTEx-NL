<sch:pattern id="ServiceFrame-RouteLink" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:routeLinks/ntx:RouteLink">
        <sch:assert test="gml:LineString">LineString is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>