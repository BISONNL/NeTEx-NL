<sch:pattern id="DRG.ServiceFrame.AccessibilityAssessment-limitations" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:lines/ntx:Line/ntx:AccessibilityAssessment/ntx:limitations">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:AccessibilityLimitation">AccessibilityLimitation is verplicht</sch:assert>

        <!-- Other business rules -->
    </sch:rule>
</sch:pattern>