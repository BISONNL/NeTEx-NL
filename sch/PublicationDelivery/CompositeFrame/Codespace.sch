<sch:pattern id="CompositeFrame-Codespace" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_BASELINE']/ntx:codespaces">
        <sch:assert test="ntx:Codespace/ntx:Xmlns/text()!=''">Xmlns is verplicht</sch:assert>
        <sch:assert test="ntx:Codespace/ntx:Description/text()!=''">Description is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>