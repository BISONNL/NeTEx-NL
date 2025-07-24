<sch:pattern id="CompositeFrame-ValidBetween" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:CompositeFrame/ntx:ValidBetween">
        <sch:assert test="ntx:FromDate/text()!=''">FromDate is verplicht</sch:assert>
        <sch:assert test="ntx:ToDate/text()!=''">ToDate is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>