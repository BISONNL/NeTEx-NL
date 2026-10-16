<sch:pattern id="DRG.ServiceFrame.Via" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:destinationDisplays/ntx:DestinationDisplay//ntx:Via">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:Name">Name is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <sch:assert test="not(starts-with(lower-case(normalize-space(ntx:Name)), 'via '))">De waarde van Name mag niet beginnen met 'via '</sch:assert>
    </sch:rule>
</sch:pattern>