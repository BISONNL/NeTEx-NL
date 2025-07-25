<sch:pattern id="TariffZone" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:GeneralFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TariffZoneList']/ntx:members/ntx:TariffZone">
        <sch:assert test="ntx:Name">Name is verplicht</sch:assert>
        <sch:assert test="ntx:ShortName">ShortName is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>