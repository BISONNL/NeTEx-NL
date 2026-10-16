<sch:pattern id="DRG.TimetableFrame.TypeOfFrameRef" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_BASELINE']/ntx:frames/ntx:TimetableFrame/ntx:TypeOfFrameRef">
        <sch:assert test="normalize-space(@ref)='NL:BISON:TypeOfFrame:NL_TT_TIMETABLE'">TypeOfFrameRef must have ref="NL:BISON:TypeOfFrame:NL_TT_TIMETABLE".</sch:assert>
        <sch:assert test="normalize-space(@versionRef)='9.4.0'">TypeOfFrameRef must have versionRef="9.4.0".</sch:assert>
    </sch:rule>
</sch:pattern>