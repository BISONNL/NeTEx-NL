<sch:pattern id="gml" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="//gml:pos">
        <sch:assert test=".[matches(text(),'^\d{1,6}(\.\d+)? \d{1,6}(\.\d+)?$')]">Een gml:pos moet gegeven worden als spatiegescheiden RD-coordinaten</sch:assert>
    </sch:rule>
    <sch:rule context="//gml:posList">
        <sch:assert test=".[matches(text(),'^\d{1,6}(\.\d+)? \d{1,6}(\.\d+)?( \d{1,6}(\.\d+)? \d{1,6}(\.\d+)?)+$')]">Een gml:posList moet gegeven worden als twee of meer spatiegescheiden RD-coordinaten</sch:assert>
    </sch:rule>
</sch:pattern>
