<sch:pattern id="DRG.Algemeen.Presentation.A" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE']">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="matches(normalize-space(/ntx:Presentation/ntx:Colour), '[0-9A-Fa-f]{6}')">Colour moet een RGB-kleur (hexadecimale string van 6 karakters) zijn</sch:assert>
        <sch:assert test="matches(normalize-space(/ntx:Presentation/ntx:TextColour), '[0-9A-Fa-f]{6}')">TextColour moet een RGB-kleur (hexadecimale string van 6 karakters) zijn</sch:assert>

        <!-- Other business rules -->
    </sch:rule>
</sch:pattern>
