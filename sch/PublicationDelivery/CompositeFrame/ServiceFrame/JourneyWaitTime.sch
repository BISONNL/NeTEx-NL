<sch:pattern id="ServiceFrame-TimeDemandType-JourneyWaitTime" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:timeDemandTypes/ntx:TimeDemandType/ntx:waitTimes/ntx:JourneyWaitTime">
        <sch:assert test="ntx:ScheduledStopPointRef or ntx:TimingPointRef">Neem een ScheduledStopPointRef óf TimingPointRef op</sch:assert>
        <sch:assert test="ntx:WaitTime">WaitTime is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>