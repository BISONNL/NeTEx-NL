<sch:pattern id="ServiceFrame-TimeDemandType" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:timeDemandTypes/ntx:TimeDemandType">
        <sch:assert test="ntx:runTimes">runTimes is verplicht</sch:assert>
        <sch:assert test="ntx:runTimes[count(ntx:JourneyRunTime)>0]">Er moet minimaal één JourneyRunTime opgenomen zijn</sch:assert>
        <sch:assert test="not(ntx:waitTimes) or ntx:waitTimes[count(ntx:JourneyWaitTime)>0]">Laat het layovers parent-element weg of neem hierin minimaal één JourneyWaitTime op</sch:assert>
        <sch:assert test="not(ntx:layovers) or ntx:layovers[count(ntx:JourneyLayover)>0]">Laat het layovers parent-element weg of neem hierin minimaal één JourneyLayover op</sch:assert>
    </sch:rule>
</sch:pattern>