<sch:pattern id="ResourceFrame-TransportAdministrativeZone" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE']/ntx:zones/ntx:TransportAdministrativeZone">
        <sch:assert test="ntx:ShortName/text()!=''">ShortName is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>