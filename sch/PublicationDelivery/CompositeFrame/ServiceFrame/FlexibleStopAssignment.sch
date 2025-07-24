<sch:pattern id="ServiceFrame-FlexibleStopAssignment" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:stopAssignments/ntx:FlexibleStopAssignment">
        <sch:assert test="ntx:ScheduledStopPointRef">ScheduledStopPointRef is verplicht</sch:assert>
        <sch:assert test="ntx:FlexibleStopPlaceRef">FlexibleStopPlaceRef is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>