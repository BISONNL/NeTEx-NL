<sch:pattern id="TimetableFrame-DeadRun" xmlns:sch="http://purl.oclc.org/dsdl/schematron">>
    <sch:rule context="ntx:TimetableFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_TIMETABLE']/ntx:vehicleJourneys/ntx:DeadRun">
        <sch:assert test="ntx:validityConditions">validityConditions is verplicht</sch:assert>
        <sch:assert test="ntx:privateCodes/ntx:PrivateCode[@type='JourneyNumber']">PrivateCode van type 'JourneyNumber' is verplicht</sch:assert>
        <sch:assert test="ntx:DepartureTime">DepartureTime is verplicht</sch:assert>
        <sch:assert test="ntx:DeadRunJourneyPatternRef">DeadRunJourneyPatternRef is verplicht</sch:assert>
        <sch:assert test="ntx:TimeDemandTypeRef">TimeDemandTypeRef is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>
