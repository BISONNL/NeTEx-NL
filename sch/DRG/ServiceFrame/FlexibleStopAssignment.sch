<sch:pattern id="DRG.ServiceFrame.FlexibleStopAssignment" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:stopAssignments/ntx:FlexibleStopAssignment">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:ScheduledStopPointRef">ScheduledStopPointRef is verplicht</sch:assert>
        <sch:assert test="ntx:FlexibleStopPlaceRef">FlexibleStopPlaceRef is verplicht</sch:assert>

        <!-- Other business rules -->
    </sch:rule>
</sch:pattern>