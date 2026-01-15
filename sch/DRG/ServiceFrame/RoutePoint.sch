<sch:pattern id="DRG.ServiceFrame.RoutePoint" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:routePoints/ntx:RoutePoint">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:Location">Location is verplicht</sch:assert>

        <!-- Other business rules -->
    </sch:rule>
</sch:pattern>