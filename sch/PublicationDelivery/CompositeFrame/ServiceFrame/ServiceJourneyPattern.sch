<sch:pattern id="ServiceFrame-ServiceJourneyPattern" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:journeyPatterns/ntx:ServiceJourneyPattern">
        <sch:assert test="ntx:RouteRef">RouteRef is verplicht</sch:assert>
        <sch:assert test="ntx:DestinationDisplayRef">DestinationDisplayRef is verplicht</sch:assert>
        <sch:assert test="ntx:pointsInSequence[count(*)>1]">Er moeten minimaal twee punten opgenomen zijn in de pointsInSequence (StopPointInJourneyPattern en/of TimingPointInJourneyPattern)</sch:assert>
    </sch:rule>
</sch:pattern>