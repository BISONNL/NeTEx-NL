<sch:pattern id="DRG.gml.posList" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="//gml:posList">
        <sch:assert test=".[matches(text(),'^^-?(90|[0-8]?\d)(\.\d+)? +-?(180|1[0-7]\d|\d?\d)(\.\d+)?$( +^-?(90|[0-8]?\d)(\.\d+)? +-?(180|1[0-7]\d|\d?\d)(\.\d+)?$)+$')]">Een gml:posList moet gegeven worden als twee of meer spatiegescheiden WGS84-coordinaten</sch:assert>
    </sch:rule>
</sch:pattern>
