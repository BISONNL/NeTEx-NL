<sch:pattern id="ServiceFrame-NoticeAssignment" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:noticeAssignments/ntx:NoticeAssignment">
        <sch:assert test="ntx:NoticeRef">NoticeRef is verplicht</sch:assert>
        <sch:assert test="ntx:NoticedObjectRef">NoticedObjectRef is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>