<sch:pattern id="DRG.ServiceFrame.AccessibilityAssessment" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:lines/ntx:Line/ntx:AccessibilityAssessment">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:MobilityImpairedAccess">MobilityImpairedAccess is verplicht</sch:assert>

        <!-- Other business rules -->
    </sch:rule>
</sch:pattern>