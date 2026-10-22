<sch:pattern id="DRG.ServiceFrame.JourneyWaitTime" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:timeDemandTypes/ntx:TimeDemandType/ntx:waitTimes/ntx:JourneyWaitTime">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:ScheduledStopPointRef or ntx:TimingPointRef">Neem een ScheduledStopPointRef óf TimingPointRef op</sch:assert>
        <sch:assert test="ntx:WaitTime">WaitTime is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <sch:assert test="xs:dayTimeDuration(ntx:WaitTime) gt xs:dayTimeDuration('PT0S') and xs:dayTimeDuration(ntx:WaitTime) lt xs:dayTimeDuration('PT24H')">
            WaitTime moet groter zijn dan 0 seconden en kleiner dan 24 uur
        </sch:assert>
    </sch:rule>
</sch:pattern>