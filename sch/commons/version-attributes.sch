<sch:pattern id="VersionAttributes" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:PublicationDelivery">
        <sch:assert test="@version='ntx:1.1'">Het version attribuut in PublicationDelivery moet de waarde 'ntx:1.1' hebben</sch:assert>
    </sch:rule>
    <sch:rule context="ntx:TypeOfFrame">
        <sch:assert test="@version='9.4.0'">TypeOfFrame moet versie 9.4.0 hebben</sch:assert>
    </sch:rule>
    <sch:rule context="ntx:TypeOfFrameRef">
        <sch:assert test="@version='9.4.0'">TypeOfFrameRef moet verwijzen naar versie 9.4.0</sch:assert>
    </sch:rule>
    <sch:rule context="ntx:GeneralFrame//ntx:*">
        <assert test="@version='any'">Het version attribuut moet de waarde 'any' hebben</assert>
    </sch:rule>
    <sch:rule context="ntx:*">
        <assert test="not(@version) or .[matches(@version, '^\d+$')]">Het version attribuut moet een getal zijn.</assert>
    </sch:rule>
</sch:pattern>
