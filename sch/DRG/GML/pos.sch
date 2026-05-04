<sch:pattern id="DRG.gml.pos" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="//gml:pos">
        <sch:assert test=".[matches(text(),'^-?(90|[0-8]?\d)(\.\d+)? +-?(180|1[0-7]\d|\d?\d)(\.\d+)?$')]">Een gml:pos moet gegeven worden als spatiegescheiden WGS84-coordinaten</sch:assert>
    </sch:rule>
</sch:pattern>
