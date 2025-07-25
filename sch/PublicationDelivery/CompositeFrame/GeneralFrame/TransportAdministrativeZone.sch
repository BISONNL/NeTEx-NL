<sch:pattern id="TransportAdministrativeZone" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:GeneralFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_NetworkList']/ntx:members/ntx:TransportAdministrativeZone">
        <sch:assert test="ntx:Name">Name is verplicht</sch:assert>
        <sch:assert test="ntx:ShortName">ShortName is verplicht</sch:assert>
        <sch:assert test="@version='any'">Attribuut version moet de waarde 'any' hebben</sch:assert>
    </sch:rule>
</sch:pattern>