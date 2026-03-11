<sch:pattern id="DRG.ServiceFrame.TimingPointInJourneyPattern" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:TimingPointInJourneyPattern">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->

        <!-- Other business rules -->
        <!-- A -->
        <!-- Als deze TimingPointInJourneyPattern het eerste punt in het ritpatroon is, dan moet gelden: IsWaitPoint=true. -->

        <!-- B -->
        <!-- De OnwardTimingLink is verplicht, behalve als dit TimingPointInJourneyPattern het laatste punt in het ritpatroon is. -->

        <!-- C -->
        <!-- Het TimingPointRef moet verwijzen naar hetzelfde TimingPoint als het FromPointRef van de OnwardTimingLink. -->
    </sch:rule>
</sch:pattern>