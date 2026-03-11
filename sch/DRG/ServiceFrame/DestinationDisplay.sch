<sch:pattern id="DRG.ServiceFrame.DestinationDisplay" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:destinationDisplays/ntx:DestinationDisplay">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:Name">Name is verplicht</sch:assert>
        <sch:assert test="ntx:FrontText">FrontText is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A -->

        <!-- B -->

        <!-- C -->
    </sch:rule>
</sch:pattern>