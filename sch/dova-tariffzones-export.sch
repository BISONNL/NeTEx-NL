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
            <sch:assert test=".[matches(@id, '^NL:[a-zA-Z0-9]+:CompositeFrame:[a-zA-Z0-9\-_]+$')]">CompositeFrame voldoet niet aan naamgevingseisen. Het id attribuut moet een waarde hebben van de vorm: NL:[Codespace]:CompositeFrame:[UniqueValue]</sch:assert>
        </sch:rule>
        <sch:rule context="//ntx:GeneralFrame">
            <sch:assert test=".[matches(@id, '^NL:[a-zA-Z0-9]+:GeneralFrame:[a-zA-Z0-9\-_]+$')]">GeneralFrame voldoet niet aan naamgevingseisen. Het id attribuut moet een waarde hebben van de vorm: NL:[Codespace]:GeneralFrame:[UniqueValue]</sch:assert>
        </sch:rule>
        <sch:rule context="//ntx:Codespace">
            <sch:assert test=".[matches(@id, '^NL:BISON:Codespace:[a-zA-Z0-9\-_]+$')]">Codespace voldoet niet aan naamgevingseisen. Het id attribuut moet een waarde hebben van de vorm: NL:BISON:Codespace:[UniqueValue]</sch:assert>
        </sch:rule>
        <sch:rule context="//ntx:ValueSet">
            <sch:assert test=".[matches(@id, '^NL:[a-zA-Z0-9]+:ValueSet:[a-zA-Z0-9\-_]+$')]">CompositeFrame voldoet niet aan naamgevingseisen. Het id attribuut moet een waarde hebben van de vorm: NL:BISON:Codespace:[UniqueValue]</sch:assert>
        </sch:rule>
        <sch:rule context="//ntx:TypeOfFrame">
            <sch:assert test=".[matches(@id, '^NL:BISON:TypeOfFrame:[a-zA-Z0-9\-_]+$')]">TypeOfFrame voldoet niet aan naamgevingseisen. Het id attribuut moet een waarde hebben van de vorm: NL:BISON:TypeOfFrame:[UniqueValue]</sch:assert>
        </sch:rule>
        <sch:rule context="//*[matches(@id,'^NL:(DOVA|BISON):.*$')]">
            <sch:assert test=".[matches(@id, '^NL:[a-zA-Z0-9]+:[a-zA-Z0-9]+:[a-zA-Z0-9\-_]+$')]">Element uit DOVA-lijsten of BISON-enumeraties voldoet niet aan naamgevingseisen. Het id attribuut moet een waarde hebben van de vorm: NL:[Codespace]:[ObjectType]:[UniqueValue]</sch:assert>
            <sch:assert test="@version='any'">Het version attribuut van een element uit de DOVA-lijsten moet waarde 'any' hebben.</sch:assert>
        </sch:rule>
        <sch:rule context="ntx:PublicationDelivery//*[@id]">
            <sch:assert test=".[matches(@id, '^NL:[a-zA-Z0-9]+:[a-zA-Z0-9]+:[a-zA-Z0-9\-_]+$')] and .[not(matches(@id, '^NL:(DOVA|BISON):.+$'))]">Element voldoet niet aan naamgevingseisen. Het id attribuut moet een waarde hebben van de vorm: NL:[Codespace]:[ObjectType]:[UniqueValue]. De waarde voor [Codespace] mag daarbij niet gelijk zijn aan DOVA of BISON.</sch:assert>
            <sch:assert test="not(@version) or .[matches(@version, '^\d+$')]">Het version attribuut moet een getal zijn.</sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- Validatie van de CompositeFrame met daarin de dienstregelinggegevens -->
    <sch:pattern id="CompositeFrame">
        <sch:rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_DOVA_LISTS']">
            <sch:assert test="ntx:FrameDefaults">FrameDefaults is verplicht</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="CompositeFrame-Codespace">
        <sch:rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_DOVA_LISTS']/ntx:codespaces">
            <sch:assert test="ntx:Codespace/ntx:Xmlns/text()!=''">Xmlns is verplicht</sch:assert>
            <sch:assert test="ntx:Codespace/ntx:Description/text()!=''">Description is verplicht</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="CompositeFrame-FrameDefaults">
        <sch:rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_DOVA_LISTS']/ntx:FrameDefaults">
            <sch:assert test="ntx:DefaultCodespaceRef/@ref='NL:BISON:Codespace:DOVA'">FrameDefaults/DefaultCodespaceRef is verplicht en moet gelijk zijn aan 'NL:BISON:Codespace:DOVA'</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="CompositeFrame-frames">
        <sch:rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_DOVA_LISTS']/ntx:frames">
            <sch:assert test=".[count(ntx:GeneralFrame/ntx:TypeOfFrameRef[@ref='NL:BISON:TypeOfFrame:NL_TariffZoneList'])=1]">Er moet exact 1 GeneralFrame (van type 'NL:BISON:TypeOfFrame:NL_TariffZoneList') worden geleverd als onderdeel van de BISON enumerations export</sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:pattern id="TariffZone">
        <sch:rule context="ntx:GeneralFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TariffZoneList']">
            <sch:assert test="ntx:Description">Description is verplicht</sch:assert>
            <sch:assert test="ntx:members">members is verplicht</sch:assert>
            <sch:assert test="ntx:members/ntx:TariffZone">members/TariffZone is verplicht</sch:assert>
        </sch:rule>
        <sch:rule context="ntx:GeneralFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TariffZoneList']/ntx:members/ntx:TariffZone">
            <sch:assert test="ntx:Name">Name is verplicht</sch:assert>
            <sch:assert test="ntx:ShortName">ShortName is verplicht</sch:assert>
            <sch:assert test="@version='any'">Attribuut version moet de waarde 'any' hebben</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>

