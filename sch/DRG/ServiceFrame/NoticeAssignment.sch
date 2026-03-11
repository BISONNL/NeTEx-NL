<sch:pattern id="DRG.ServiceFrame.NoticeAssignment" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:noticeAssignments/ntx:NoticeAssignment">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:NoticeRef">NoticeRef is verplicht</sch:assert>
        <sch:assert test="ntx:NoticedObjectRef">NoticedObjectRef is verplicht</sch:assert>

        <!-- Other business rules -->
    </sch:rule>
</sch:pattern>