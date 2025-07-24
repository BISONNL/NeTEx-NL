<sch:pattern id="ServiceFrame-Line" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:lines/ntx:Line">
        <sch:assert test="ntx:Name">Name is verplicht</sch:assert>
        <sch:assert test="ntx:TransportMode">TransportMode is verplicht</sch:assert>
        <sch:assert test="ntx:privateCodes/ntx:PrivateCode[@type='LinePlanningNumber']">PrivateCode van type 'LinePlanningNumber' is verplicht</sch:assert>
        <sch:assert test="ntx:OperatorRef">OperatorRef is verplicht</sch:assert>
        <sch:assert test="ntx:TypeOfServiceRef">TypeOfServiceRef is verplicht</sch:assert>
        <sch:assert test="ntx:Monitored">Monitored is verplicht</sch:assert>
        <sch:assert test="ntx:AccessibilityAssessment">AccessibilityAssessment is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>