<sch:pattern id="DRG.gml.posList" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="//gml:posList">
        <sch:assert test="matches(normalize-space(.), '^(-?(90|[0-8]?\d)(\.\d{1,6})? +-?(180|1[0-7]\d|[0-9]?\d)(\.\d{1,6})?)( +-?(90|[0-8]?\d)(\.\d{1,6})? +-?(180|1[0-7]\d|[0-9]?\d)(\.\d{1,6})?)+$')">
            Een gml:posList moet twee of meer spatiegescheiden WGS84-coördinatenparen bevatten, met maximaal 6 decimalen per coördinaat.
        </sch:assert>
    </sch:rule>
</sch:pattern>
