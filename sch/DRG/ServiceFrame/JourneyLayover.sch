<sch:pattern id="DRG.ServiceFrame.JourneyLayover" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:timeDemandTypes/ntx:TimeDemandType/ntx:layovers/ntx:JourneyLayover">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:ScheduledStopPointRef or ntx:TimingPointRef">Neem een ScheduledStopPointRef óf TimingPointRef op</sch:assert>
        <sch:assert test="ntx:Layover">Layover is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <sch:assert test="xs:dayTimeDuration(ntx:Layover) gt xs:dayTimeDuration('PT0S') and xs:dayTimeDuration(ntx:Layover) lt xs:dayTimeDuration('PT24H')">
            Layover moet groter zijn dan 0 seconden en kleiner dan 24 uur
        </sch:assert>
    </sch:rule>
</sch:pattern>