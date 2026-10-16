<sch:pattern id="DRG.Algemeen.Presentation.A" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:Presentation/ntx:Colour">
        <sch:assert test="matches(normalize-space(.), '^[0-9A-Fa-f]{6}$')">Colour moet een RGB-kleur (hexadecimale string van 6 karakters) zijn</sch:assert>
    </sch:rule>
    <sch:rule context="ntx:Presentation/ntx:TextColour">
        <sch:assert test="matches(normalize-space(.), '^[0-9A-Fa-f]{6}$')">TextColour moet een RGB-kleur (hexadecimale string van 6 karakters) zijn</sch:assert>
    </sch:rule>
</sch:pattern>
