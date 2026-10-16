<sch:pattern id="DRG.TimetableFrame.vehicleJourneys" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:TimetableFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_TIMETABLE']/ntx:vehicleJourneys">
        <sch:assert test="ntx:ServiceJourney">De lijst van vehicleJourneys bevat minimaal één ServiceJourney</sch:assert>
    </sch:rule>
</sch:pattern>
