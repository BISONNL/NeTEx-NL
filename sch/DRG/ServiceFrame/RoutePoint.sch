<sch:pattern id="DRG.ServiceFrame.RoutePoint" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:routePoints/ntx:RoutePoint">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:Location">Location is verplicht</sch:assert>

        <!-- Other business rules -->
    </sch:rule>
</sch:pattern>