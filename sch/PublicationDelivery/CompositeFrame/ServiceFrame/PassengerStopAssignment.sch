<sch:pattern id="ServiceFrame-PassengerStopAssignment" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:stopAssignments/ntx:PassengerStopAssignment">
        <sch:assert test="ntx:ScheduledStopPointRef">ScheduledStopPointRef is verplicht</sch:assert>
        <sch:assert test="ntx:QuayRef">QuayRef is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>