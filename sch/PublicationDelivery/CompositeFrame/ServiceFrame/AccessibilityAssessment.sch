<sch:pattern id="ServiceFrame-Line-AccessibilityAssessment" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:lines/ntx:Line/ntx:AccessibilityAssessment">
        <sch:assert test="ntx:MobilityImpairedAccess">MobilityImpairedAccess is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>