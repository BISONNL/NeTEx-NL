<sch:pattern id="ServiceFrame-RoutePoint" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:routePoints/ntx:RoutePoint">
        <sch:assert test="ntx:Location">Location is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>