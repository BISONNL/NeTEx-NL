<sch:pattern id="ResourceFrame-Authority" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:GeneralFrame/ntx:TypeOfFrameRef[@ref='NL:BISON:TypeOfFrame:NL_AuthorityList']/ntx:members/ntx:Authority">
        <sch:assert test="ntx:Name/text()!=''">Name is verplicht</sch:assert>
        <sch:assert test="ntx:ShortName/text()!=''">ShortName is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>
