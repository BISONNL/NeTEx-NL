<sch:pattern id="DRG.ServiceFrame.StopPointInJourneyPattern" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:StopPointInJourneyPattern">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->

        <!-- Other business rules -->
        <!-- A -->
        <!-- Als deze StopPointInJourneyPattern het eerste punt in het ritpatroon is, dan moet gelden: IsWaitPoint=true. -->

        <!-- B -->
        <!-- Er moeten meer dan 0 punten zijn met ForBoarding=trueen meer dan 0 ForAlighting=true. -->

        <!-- C -->
        <!-- Er moeten meer dan 0 punten zijn met ForBoarding=true en meer dan 0 met ForAlighting=true. -->

        <!-- D -->
        <!-- Vóór de eerste halte met ForAlighting=true moet er nog tenminste één halte zijn met ForBoarding=true zijn. -->

        <!-- E -->
        <!-- Ná de laatste halte met ForBoarding=true, moet er nog tenminste één halte met ForAlighting=true zijn. -->

        <!-- F -->
        <!-- De OnwardTimingLink is verplicht, behalve als dit StopPointInJourneyPattern het laatste punt in het ritpatroon is. -->

        <!-- G -->
        <!-- Het ScheduledStopPointRef moet verwijzen naar hetzelfde ScheduledStopPoint als het FromPointRef van de OnwardTimingLink -->
    </sch:rule>
</sch:pattern>