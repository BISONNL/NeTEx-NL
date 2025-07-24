<sch:pattern id="ServiceCalendarFrame-DayType" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceCalendarFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_CALENDAR']/ntx:dayTypes/ntx:DayType">
        <sch:assert test="ntx:properties/ntx:PropertyOfDay">Er moet minimaal 1 PropertyOfDay worden gegeven</sch:assert>
    </sch:rule>
</sch:pattern>