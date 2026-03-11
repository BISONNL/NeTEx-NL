<sch:pattern id="DRG.ServiceFrame.JourneyWaitTime" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:timeDemandTypes/ntx:TimeDemandType/ntx:waitTimes/ntx:JourneyWaitTime">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:ScheduledStopPointRef or ntx:TimingPointRef">Neem een ScheduledStopPointRef óf TimingPointRef op</sch:assert>
        <sch:assert test="ntx:WaitTime">WaitTime is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <!-- TODO De WaitTime moet groter zijn dan 0 seconden en kleiner dan 24 uur. -->
    </sch:rule>
</sch:pattern>