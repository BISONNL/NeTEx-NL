<sch:pattern id="DRG.ServiceFrame.DeadRunJourneyPattern" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:journeyPatterns/ntx:DeadRunJourneyPattern">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:pointsInSequence[count(*)>1]">Er moeten minimaal twee punten opgenomen zijn in de pointsInSequence (StopPointInJourneyPattern en/of TimingPointInJourneyPattern)</sch:assert>

        <!-- Other business rules -->
    </sch:rule>
</sch:pattern>
