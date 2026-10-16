<sch:pattern id="DRG.ServiceCalendarFrame.DayTypeAssignment" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceCalendarFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_CALENDAR']/ntx:dayTypeAssignments/ntx:DayTypeAssignment">
        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:Date or ntx:DayTypeRef">Date of DayTypeRef is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>