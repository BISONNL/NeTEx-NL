<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://purl.oclc.org/dsdl/schematron">
    <!-- Namespaces used in NeTEx NL -->
    <sch:ns prefix="ntx" uri="http://www.netex.org.uk/netex"/>
    <sch:ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>

    <!-- Profiel versie -->
    <sch:pattern id="ProfileVersion">
        <sch:rule context="ntx:TypeOfFrameRef">
            <sch:assert test="@version='9.4.0'">TypeOfFrameRef verwijst niet naar versie 9.4.0</sch:assert>
        </sch:rule>
        <sch:rule context="ntx:PublicationDelivery">
            <sch:assert test="@version='ntx:1.1'">Het version attribuut in PublicationDelivery moet de waarde 'ntx:1.1' hebben</sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- Afwezigheid van tijdzones in dateTime elementen -->
    <sch:pattern id="NoTimeAndTimezones">
        <sch:rule context="(ntx:PublicationTimestamp)">
            <sch:assert test=".[matches(text(), '^20[2-9]\d\-(0[0-9]|1[012])\-([0-2][0-9]|3[01])T[012][0-9]:[0-5][0-9]:[0-5][0-9](\.\d+)?$')]">PublicationTimestamp mag geen tijdzone specificeren</sch:assert>
        </sch:rule>
        <sch:rule context="(ntx:FromDate|ntx:ToDate)">
            <sch:assert test=".[matches(text(), '^20[2-9]\d\-(0[0-9]|1[012])\-([0-2][0-9]|3[01])T00:00:00(\.0+)?$')]">Om verwarring te voorkomen, moet in elementen van het type xs:dateTime (binnen ValidBetween en AvailabilityCondition) de tijd op 00:00:00 worden gesteld, en mag geen tijdzone worden opgegeven. Dit omdat hier enkel een operationele dag wordt aangeven.</sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- ID naming convention -->
    <sch:pattern id="IdNamingConvention">
        <sch:rule context="//ntx:CompositeFrame">
            <sch:assert test=".[matches(@id, '^NL:BISON:CompositeFrame:[a-zA-Z0-9\-_]+$')]">CompositeFrame voldoet niet aan naamgevingseisen. Het id attribuut moet een waarde hebben van de vorm: NL:BISON:CompositeFrame:[UniqueValue]</sch:assert>
        </sch:rule>
        <sch:rule context="//ntx:Codespace">
            <sch:assert test=".[matches(@id, '^NL:BISON:Codespace:[a-zA-Z0-9\-_]+$')]">Codespace voldoet niet aan naamgevingseisen. Het id attribuut moet een waarde hebben van de vorm: NL:BISON:Codespace:[UniqueValue]</sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- Validatie van de CompositeFrame met daarin de voorgedefinieerde Codespace elementen -->
    <sch:pattern id="CompositeFrame">
        <sch:rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_CODESPACES']">
            <sch:assert test="ntx:codespaces">codespaces is verplicht</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="CompositeFrame-Codespace">
        <sch:rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_CODESPACES']/ntx:codespaces">
            <sch:assert test="ntx:Codespace/ntx:Xmlns/text()!=''">Xmlns is verplicht</sch:assert>
            <sch:assert test="ntx:Codespace/ntx:Description/text()!=''">Description is verplicht</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>
