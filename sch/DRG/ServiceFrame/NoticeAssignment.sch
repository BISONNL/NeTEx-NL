<sch:pattern id="DRG.ServiceFrame.NoticeAssignment" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:noticeAssignments/ntx:NoticeAssignment">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:NoticeRef">NoticeRef is verplicht</sch:assert>
        <sch:assert test="ntx:NoticedObjectRef">NoticedObjectRef is verplicht</sch:assert>

        <!-- Other business rules -->
    </sch:rule>
</sch:pattern>