<sch:pattern id="DRG.ServiceFrame.TypeOfFrameRef" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_BASELINE']/ntx:frames/ntx:ServiceFrame/ntx:TypeOfFrameRef">
        <sch:assert test="normalize-space(@ref)='NL:BISON:TypeOfFrame:NL_TT_SERVICE'">TypeOfFrameRef must have ref="NL:BISON:TypeOfFrame:NL_TT_SERVICE".</sch:assert>
        <sch:assert test="normalize-space(@versionRef)='9.4.0'">TypeOfFrameRef must have versionRef="9.4.0".</sch:assert>
    </sch:rule>
</sch:pattern>