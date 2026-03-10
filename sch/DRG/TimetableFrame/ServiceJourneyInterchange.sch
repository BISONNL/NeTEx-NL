<sch:pattern id="TimetableFrame-ServiceJourneyInterchange" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:TimetableFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_TIMETABLE']/ntx:journeyInterchanges/ntx:ServiceJourneyInterchange">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:FromPointRef">FromPointRef is verplicht</sch:assert>
        <sch:assert test="ntx:ToPointRef">ToPointRef is verplicht</sch:assert>
        <sch:assert test="ntx:FromJourneyRef">FromJourneyRef is verplicht</sch:assert>
        <sch:assert test="ntx:ToJourneyRef">ToJourneyRef is verplicht</sch:assert>

        <!-- Other business rules -->
    </sch:rule>
</sch:pattern>
