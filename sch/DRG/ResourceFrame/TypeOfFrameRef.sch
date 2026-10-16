<sch:pattern id="DRG.ResourceFrame.TypeOfFrameRef" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_BASELINE']/ntx:frames/ntx:ResourceFrame/ntx:TypeOfFrameRef">
        <sch:assert test="normalize-space(@ref)='NL:BISON:TypeOfFrame:NL_TT_RESOURCE'">TypeOfFrameRef must have ref="NL:BISON:TypeOfFrame:NL_TT_RESOURCE".</sch:assert>
        <sch:assert test="normalize-space(@versionRef)='9.4.0'">TypeOfFrameRef must have versionRef="9.4.0".</sch:assert>
    </sch:rule>
</sch:pattern>