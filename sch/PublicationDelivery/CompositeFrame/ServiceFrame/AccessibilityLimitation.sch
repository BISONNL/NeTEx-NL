<sch:pattern id="ServiceFrame-Line-AccessibilityAssessment-limitations-AccessibilityLimitation" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:lines/ntx:Line/ntx:AccessibilityAssessment/ntx:limitations/ntx:AccessibilityLimitation">
        <sch:assert test="ntx:WheelchairAccess">WheelchairAccess is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>
