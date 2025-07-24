<sch:pattern id="ServiceFrame-Line-AccessibilityAssessment-limitations" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:lines/ntx:Line/ntx:AccessibilityAssessment/ntx:limitations">
        <sch:assert test="ntx:AccessibilityLimitation">AccessibilityLimitation is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>