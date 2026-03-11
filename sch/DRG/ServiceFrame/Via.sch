<sch:pattern id="DRG.ServiceFrame.Via" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:destinationDisplays/ntx:DestinationDisplay//ntx:Via">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:Name">Name is verplicht</sch:assert>

        <!-- Other business rules -->
    </sch:rule>
</sch:pattern>