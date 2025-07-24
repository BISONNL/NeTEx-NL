<sch:pattern id="TimetableFrame-AvailabilityCondition" xmlns:sch="http://purl.oclc.org/dsdl/schematron">>
    <sch:rule context="ntx:TimetableFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_TIMETABLE']/ntx:contentValidityConditions/ntx:AvailabilityCondition">
        <sch:assert test="ntx:FromDate">FromDate is verplicht</sch:assert>
        <sch:assert test="ntx:ToDate">ToDate is verplicht</sch:assert>
        <sch:assert test="ntx:ValidDayBits">ValidDayBits is verplicht</sch:assert>
        <sch:assert test="ntx:ValidDayBits[matches(text(), '^[01]+$')]">ValidDayBits is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>