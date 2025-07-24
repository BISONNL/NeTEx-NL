<sch:pattern id="ResourceFrame-Branding" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE']/ntx:typesOfValue/ntx:Branding">
        <sch:assert test="ntx:Name/text()!=''">Name is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>