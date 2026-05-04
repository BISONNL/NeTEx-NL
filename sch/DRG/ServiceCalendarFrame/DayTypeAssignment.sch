<sch:pattern id="DRG.ServiceCalendarFrame.DayTypeAssignment" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceCalendarFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_CALENDAR']/ntx:dayTypeAssignments/ntx:DayTypeAssignment">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:Date">Date is verplicht</sch:assert>
        <sch:assert test="ntx:DayTypeRef">DayTypeRef is verplicht</sch:assert>

        <!-- Other business rules -->
    </sch:rule>
</sch:pattern>