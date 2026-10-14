<sch:pattern id="DRG.CompositeFrame.TypeOfFrameRef" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <!-- Meegeleverde centrale CompositeFrames (BISON, DOVA) vallen onder hun eigen export-schema -->
    <sch:rule context="ntx:CompositeFrame[not(ntx:TypeOfFrameRef/@ref = ('NL:BISON:TypeOfFrame:NL_BISON_ENUMS', 'NL:BISON:TypeOfFrame:NL_DOVA_LISTS', 'NL:BISON:TypeOfFrame:NL_CODESPACES'))]/ntx:TypeOfFrameRef">
        <sch:assert test="normalize-space(@ref)='NL:BISON:TypeOfFrame:NL_TT_BASELINE'">TypeOfFrameRef must have ref="NL:BISON:TypeOfFrame:NL_TT_BASELINE".</sch:assert>
        <sch:assert test="(normalize-space(@version), normalize-space(@versionRef)) = '9.4.0'">TypeOfFrameRef must have version="9.4.0" or versionRef="9.4.0".</sch:assert>
    </sch:rule>
</sch:pattern>
