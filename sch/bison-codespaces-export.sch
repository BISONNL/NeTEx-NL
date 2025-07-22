<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://purl.oclc.org/dsdl/schematron">
    <!-- Namespaces used in NeTEx NL -->
    <ns prefix="ntx" uri="http://www.netex.org.uk/netex"/>
    <ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>

    <!-- Profiel versie -->
    <pattern id="ProfileVersion">
        <rule context="ntx:TypeOfFrameRef">
            <assert test="@version='9.4.0'">TypeOfFrameRef verwijst niet naar versie 9.4.0</assert>
        </rule>
        <rule context="ntx:PublicationDelivery">
            <assert test="@version='ntx:1.1'">Het version attribuut in PublicationDelivery moet de waarde 'ntx:1.1' hebben</assert>
        </rule>
    </pattern>

    <!-- Afwezigheid van tijdzones in dateTime elementen -->
    <pattern id="NoTimeAndTimezones">
        <rule context="(ntx:PublicationTimestamp)">
            <assert test=".[matches(text(), '^20[2-9]\d\-(0[0-9]|1[012])\-([0-2][0-9]|3[01])T[012][0-9]:[0-5][0-9]:[0-5][0-9](\.\d+)?$')]">PublicationTimestamp mag geen tijdzone specificeren</assert>
        </rule>
        <rule context="(ntx:FromDate|ntx:ToDate)">
            <assert test=".[matches(text(), '^20[2-9]\d\-(0[0-9]|1[012])\-([0-2][0-9]|3[01])T00:00:00(\.0+)?$')]">Om verwarring te voorkomen, moet in elementen van het type xs:dateTime (binnen ValidBetween en AvailabilityCondition) de tijd op 00:00:00 worden gesteld, en mag geen tijdzone worden opgegeven. Dit omdat hier enkel een operationele dag wordt aangeven.</assert>
        </rule>
    </pattern>

    <!-- ID naming convention -->
    <pattern id="IdNamingConvention">
        <rule context="//ntx:CompositeFrame">
            <assert test=".[matches(@id, '^NL:BISON:CompositeFrame:[a-zA-Z0-9\-_]+$')]">CompositeFrame voldoet niet aan naamgevingseisen. Het id attribuut moet een waarde hebben van de vorm: NL:BISON:CompositeFrame:[UniqueValue]</assert>
        </rule>
        <rule context="//ntx:Codespace">
            <assert test=".[matches(@id, '^NL:BISON:Codespace:[a-zA-Z0-9\-_]+$')]">Codespace voldoet niet aan naamgevingseisen. Het id attribuut moet een waarde hebben van de vorm: NL:BISON:Codespace:[UniqueValue]</assert>
        </rule>
    </pattern>

    <!-- Validatie van de CompositeFrame met daarin de voorgedefinieerde Codespace elementen -->
    <pattern id="CompositeFrame">
        <rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_CODESPACES']">
            <assert test="ntx:codespaces">codespaces is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="CompositeFrame-Codespace">
        <rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_CODESPACES']/ntx:codespaces">
            <assert test="ntx:Codespace/ntx:Xmlns/text()!=''">Xmlns is verplicht</assert>
            <assert test="ntx:Codespace/ntx:Description/text()!=''">Description is verplicht</assert>
        </rule>
    </pattern>
</schema>
