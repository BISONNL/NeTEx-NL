<sch:pattern id="DRG.ServiceFrame.TimingLink" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:timingLinks/ntx:TimingLink">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:Distance">Distance is verplicht</sch:assert>
        <sch:assert test="ntx:FromPointRef">FromPointRef is verplicht</sch:assert>
        <sch:assert test="ntx:ToPointRef">ToPointRef is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <sch:assert test="ntx:FromPointRef/@nameOfRefClass">Maak het type waarnaar verwezen wordt expliciet met het nameOfRefClass attribuut</sch:assert>
        <sch:assert test="ntx:ToPointRef/@nameOfRefClass">Maak het type waarnaar verwezen wordt expliciet met het nameOfRefClass attribuut</sch:assert>

    </sch:rule>
</sch:pattern>