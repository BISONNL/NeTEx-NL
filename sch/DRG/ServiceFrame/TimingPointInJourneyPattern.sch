<sch:pattern id="DRG.ServiceFrame.TimingPointInJourneyPattern" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']//ntx:ServiceJourneyPattern/ntx:pointsInSequence/ntx:TimingPointInJourneyPattern">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->

        <!-- Other business rules -->
        <!-- A: Als dit het eerste punt in het ritpatroon is, dan moet IsWaitPoint=true -->
        <sch:assert test="preceding-sibling::*[self::ntx:StopPointInJourneyPattern or self::ntx:TimingPointInJourneyPattern] or ntx:IsWaitPoint='true'">
            Het eerste punt in het ritpatroon moet IsWaitPoint=true hebben
        </sch:assert>

        <!-- B: OnwardTimingLinkRef is verplicht, behalve voor het laatste punt -->
        <sch:assert test="ntx:OnwardTimingLinkRef or not(following-sibling::*[self::ntx:StopPointInJourneyPattern or self::ntx:TimingPointInJourneyPattern])">
            OnwardTimingLinkRef is verplicht, behalve voor het laatste punt in het ritpatroon
        </sch:assert>

        <!-- C: TimingPointRef moet verwijzen naar hetzelfde punt als FromPointRef van de OnwardTimingLink -->
        <sch:assert test="not(ntx:OnwardTimingLinkRef) or
            ntx:TimingPointRef/@ref = //ntx:TimingLink[@id=current()/ntx:OnwardTimingLinkRef/@ref]/ntx:FromPointRef/@ref">
            Het TimingPointRef moet verwijzen naar hetzelfde punt als het FromPointRef van de OnwardTimingLink
        </sch:assert>
    </sch:rule>
</sch:pattern>