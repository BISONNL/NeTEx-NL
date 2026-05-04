<sch:pattern id="DRG.ResourceFrame.Operator" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE']/ntx:organisations/ntx:Operator">
    <!-- Variables for use in business rule -->

    <!-- Cardinality and data-type constraints -->
    <sch:assert test="ntx:Name/text()!=''">Name is verplicht</sch:assert>

    <!-- Other business rules -->

    </sch:rule>
</sch:pattern>