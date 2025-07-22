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
            <assert test=".[matches(@id, '^NL:[a-zA-Z0-9]+:CompositeFrame:[a-zA-Z0-9\-_]+$')]">CompositeFrame voldoet niet aan naamgevingseisen. Het id attribuut moet een waarde hebben van de vorm: NL:[Codespace]:CompositeFrame:[UniqueValue]</assert>
        </rule>
        <rule context="//ntx:GeneralFrame">
            <assert test=".[matches(@id, '^NL:[a-zA-Z0-9]+:GeneralFrame:[a-zA-Z0-9\-_]+$')]">GeneralFrame voldoet niet aan naamgevingseisen. Het id attribuut moet een waarde hebben van de vorm: NL:[Codespace]:GeneralFrame:[UniqueValue]</assert>
        </rule>
        <rule context="//ntx:Codespace">
            <assert test=".[matches(@id, '^NL:BISON:Codespace:[a-zA-Z0-9\-_]+$')]">Codespace voldoet niet aan naamgevingseisen. Het id attribuut moet een waarde hebben van de vorm: NL:BISON:Codespace:[UniqueValue]</assert>
        </rule>
        <rule context="//ntx:ValueSet">
            <assert test=".[matches(@id, '^NL:[a-zA-Z0-9]+:ValueSet:[a-zA-Z0-9\-_]+$')]">CompositeFrame voldoet niet aan naamgevingseisen. Het id attribuut moet een waarde hebben van de vorm: NL:BISON:Codespace:[UniqueValue]</assert>
        </rule>
        <rule context="//ntx:TypeOfFrame">
            <assert test=".[matches(@id, '^NL:BISON:TypeOfFrame:[a-zA-Z0-9\-_]+$')]">TypeOfFrame voldoet niet aan naamgevingseisen. Het id attribuut moet een waarde hebben van de vorm: NL:BISON:TypeOfFrame:[UniqueValue]</assert>
        </rule>
        <rule context="//*[matches(@id,'^NL:(DOVA|BISON):.*$')]">
            <assert test=".[matches(@id, '^NL:[a-zA-Z0-9]+:[a-zA-Z0-9]+:[a-zA-Z0-9\-_]+$')]">Element uit DOVA-lijsten of BISON-enumeraties voldoet niet aan naamgevingseisen. Het id attribuut moet een waarde hebben van de vorm: NL:[Codespace]:[ObjectType]:[UniqueValue]</assert>
            <assert test="@version='any'">Het version attribuut van een element uit de DOVA-lijsten moet waarde 'any' hebben.</assert>
        </rule>
        <rule context="ntx:PublicationDelivery//*[@id]">
            <assert test=".[matches(@id, '^NL:[a-zA-Z0-9]+:[a-zA-Z0-9]+:[a-zA-Z0-9\-_]+$')] and .[not(matches(@id, '^NL:(DOVA|BISON):.+$'))]">Element voldoet niet aan naamgevingseisen. Het id attribuut moet een waarde hebben van de vorm: NL:[Codespace]:[ObjectType]:[UniqueValue]. De waarde voor [Codespace] mag daarbij niet gelijk zijn aan DOVA of BISON.</assert>
            <assert test="not(@version) or .[matches(@version, '^\d+$')]">Het version attribuut moet een getal zijn.</assert>
        </rule>
    </pattern>

    <!-- Validatie van de CompositeFrame met daarin de dienstregelinggegevens -->
    <pattern id="CompositeFrame">
        <rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_DOVA_LISTS']">
            <assert test="ntx:FrameDefaults">FrameDefaults is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="CompositeFrame-Codespace">
        <rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_DOVA_LISTS']/ntx:codespaces">
            <assert test="ntx:Codespace/ntx:Xmlns/text()!=''">Xmlns is verplicht</assert>
            <assert test="ntx:Codespace/ntx:Description/text()!=''">Description is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="CompositeFrame-FrameDefaults">
        <rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_DOVA_LISTS']/ntx:FrameDefaults">
            <assert test="ntx:DefaultCodespaceRef/@ref='NL:BISON:Codespace:DOVA'">FrameDefaults/DefaultCodespaceRef is verplicht en moet gelijk zijn aan 'NL:BISON:Codespace:DOVA'</assert>
        </rule>
    </pattern>
    <pattern id="CompositeFrame-frames">
        <rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_DOVA_LISTS']/ntx:frames">
            <assert test=".[count(ntx:GeneralFrame/ntx:TypeOfFrameRef[@ref='NL:BISON:TypeOfFrame:NL_AuthorityList'])=1]">Er moet exact 1 GeneralFrame (van type 'NL:BISON:TypeOfFrame:NL_AuthorityList') worden geleverd als onderdeel van de BISON enumerations export</assert>
        </rule>
    </pattern>

    <pattern id="Authority">
        <rule context="ntx:GeneralFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_AuthorityList']">
            <assert test="ntx:Description">Description is verplicht</assert>
            <assert test="ntx:members">members is verplicht</assert>
            <assert test="ntx:members/ntx:Authority">members/ValueSet/values/Authority is verplicht</assert>
        </rule>
        <rule context="ntx:GeneralFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_AuthorityList']/ntx:members/ntx:Authority">
            <assert test="ntx:Name">Name is verplicht</assert>
            <assert test="ntx:ShortName">ShortName is verplicht</assert>
            <assert test="@version='any'">Attribuut version moet de waarde 'any' hebben</assert>
        </rule>
    </pattern>
</schema>

