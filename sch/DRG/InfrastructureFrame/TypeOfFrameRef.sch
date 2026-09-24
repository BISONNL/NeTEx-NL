<sch:pattern id="DRG.InfrastructureFrame.TypeOfFrameRef" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:CompositeFrame/ntx:TypeOfFrameRef">
        <sch:assert test="normalize-space(@ref)='NL:BISON:TypeOfFrame:NL_TT_BASELINE'">TypeOfFrameRef must have ref="NL:BISON:TypeOfFrame:NL_TT_BASELINE".</sch:assert>
        <sch:assert test="normalize-space(@version)='9.4.0'">TypeOfFrameRef must have version="9.4.0".</sch:assert>
    </sch:rule>
</sch:pattern>