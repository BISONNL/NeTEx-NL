<sch:pattern id="DRG.Algemeen.Presentation.A" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:Presentation">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="not(ntx:Colour) or matches(normalize-space(ntx:Colour), '^[0-9A-Fa-f]{6}$')">Colour moet een RGB-kleur (hexadecimale string van 6 karakters) zijn</sch:assert>
        <sch:assert test="not(ntx:TextColour) or matches(normalize-space(ntx:TextColour), '^[0-9A-Fa-f]{6}$')">TextColour moet een RGB-kleur (hexadecimale string van 6 karakters) zijn</sch:assert>
        <sch:assert test="not(ntx:BackgroundColour) or matches(normalize-space(ntx:BackgroundColour), '^[0-9A-Fa-f]{6}$')">BackgroundColour moet een RGB-kleur (hexadecimale string van 6 karakters) zijn</sch:assert>

        <!-- Other business rules -->
    </sch:rule>
</sch:pattern>
