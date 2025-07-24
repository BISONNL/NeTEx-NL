<sch:pattern id="ServiceCalendarFrame-Timeband" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceCalendarFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_CALENDAR']/ntx:timebands/ntx:Timeband">
        <sch:assert test="ntx:StartTime">StartTime is verplicht</sch:assert>
        <sch:assert test="ntx:EndTime">EndTime is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>