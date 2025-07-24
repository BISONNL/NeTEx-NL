<sch:pattern id="ServiceFrame-TimingLink" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:timingLinks/ntx:TimingLink">
        <sch:assert test="ntx:Distance">Distance is verplicht</sch:assert>
        <sch:assert test="ntx:FromPointRef">FromPointRef is verplicht</sch:assert>
        <sch:assert test="ntx:ToPointRef">ToPointRef is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>