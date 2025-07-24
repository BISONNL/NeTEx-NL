<sch:pattern id="ServiceFrame-TimeDemandType-JourneyRunTime" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:timeDemandTypes/ntx:TimeDemandType/ntx:runtimes/ntx:JourneyRunTime">
        <sch:assert test="ntx:TimingLinkRef">TimingLinkRef is verplicht</sch:assert>
        <sch:assert test="ntx:RunTime">RunTime is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>