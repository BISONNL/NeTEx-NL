<sch:pattern id="DRG.ServiceFrame.JourneyRunTime" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:timeDemandTypes/ntx:TimeDemandType/ntx:runTimes/ntx:JourneyRunTime">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:TimingLinkRef">TimingLinkRef is verplicht</sch:assert>
        <sch:assert test="ntx:RunTime">RunTime is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <sch:assert test="not(preceding-sibling::ntx:JourneyRunTime[ntx:TimingLinkRef/@ref = current()/ntx:TimingLinkRef/@ref])">
            Alle TimingLinkRefs in de JourneyRunTimes van een TimeDemandType dienen uniek te zijn
        </sch:assert>

        <!-- B -->
        <sch:assert test="xs:dayTimeDuration(ntx:RunTime) gt xs:dayTimeDuration('PT0S') and xs:dayTimeDuration(ntx:RunTime) lt xs:dayTimeDuration('PT24H')">
            RunTime moet groter zijn dan 0 seconden en kleiner dan 24 uur
        </sch:assert>
    </sch:rule>
</sch:pattern>