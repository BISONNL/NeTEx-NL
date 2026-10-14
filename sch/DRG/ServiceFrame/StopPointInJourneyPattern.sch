<sch:pattern id="DRG.ServiceFrame.StopPointInJourneyPattern" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']//ntx:ServiceJourneyPattern/ntx:pointsInSequence/ntx:StopPointInJourneyPattern">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->

        <!-- Other business rules -->
        <!-- A: Als dit het eerste punt in het ritpatroon is, dan moet IsWaitPoint=true -->
        <sch:assert test="preceding-sibling::*[self::ntx:StopPointInJourneyPattern or self::ntx:TimingPointInJourneyPattern] or ntx:IsWaitPoint='true'">
            Het eerste punt in het ritpatroon moet IsWaitPoint=true hebben
        </sch:assert>

        <!-- B: Er moeten meer dan 0 punten zijn met ForBoarding=true en meer dan 0 met ForAlighting=true -->
        <sch:assert test="../ntx:StopPointInJourneyPattern[not(normalize-space(ntx:ForBoarding) = ('false', '0'))]">
            Er moet minimaal één StopPointInJourneyPattern met ForBoarding=true zijn
        </sch:assert>
        <sch:assert test="../ntx:StopPointInJourneyPattern[not(normalize-space(ntx:ForAlighting) = ('false', '0'))]">
            Er moet minimaal één StopPointInJourneyPattern met ForAlighting=true zijn
        </sch:assert>

        <!-- C: Vóór de eerste halte met ForAlighting=true moet er tenminste één halte met ForBoarding=true zijn -->
        <sch:assert test="normalize-space(ntx:ForAlighting) = ('false', '0') or preceding-sibling::ntx:StopPointInJourneyPattern[not(normalize-space(ntx:ForBoarding) = ('false', '0'))] or not(normalize-space(ntx:ForBoarding) = ('false', '0'))">
            Vóór de eerste halte met ForAlighting=true moet er tenminste één halte met ForBoarding=true zijn
        </sch:assert>

        <!-- D: Ná de laatste halte met ForBoarding=true moet er tenminste één halte met ForAlighting=true zijn -->
        <sch:assert test="normalize-space(ntx:ForBoarding) = ('false', '0') or following-sibling::ntx:StopPointInJourneyPattern[not(normalize-space(ntx:ForAlighting) = ('false', '0'))] or not(normalize-space(ntx:ForAlighting) = ('false', '0'))">
            Ná de laatste halte met ForBoarding=true moet er tenminste één halte met ForAlighting=true zijn
        </sch:assert>

        <!-- E: OnwardTimingLinkRef is verplicht, behalve voor het laatste punt -->
        <sch:assert test="ntx:OnwardTimingLinkRef or not(following-sibling::*[self::ntx:StopPointInJourneyPattern or self::ntx:TimingPointInJourneyPattern])">
            OnwardTimingLinkRef is verplicht, behalve voor het laatste punt in het ritpatroon
        </sch:assert>

        <!-- F: ScheduledStopPointRef moet verwijzen naar hetzelfde punt als FromPointRef van de OnwardTimingLink -->
        <sch:assert test="not(ntx:OnwardTimingLinkRef) or
            ntx:ScheduledStopPointRef/@ref = //ntx:TimingLink[@id=current()/ntx:OnwardTimingLinkRef/@ref]/ntx:FromPointRef/@ref">
            Het ScheduledStopPointRef moet verwijzen naar hetzelfde punt als het FromPointRef van de OnwardTimingLink
        </sch:assert>
    </sch:rule>
</sch:pattern>