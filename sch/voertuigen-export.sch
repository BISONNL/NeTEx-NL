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
            <assert test=".[matches(text(), '^20\d\d\-(0[0-9]|1[012])\-([0-2][0-9]|3[01])T[012][0-9]:[0-5][0-9]:[0-5][0-9](\.\d+)?$')]">PublicationTimestamp mag geen tijdzone specificeren</assert>
        </rule>
        <rule context="(ntx:FromDate|ntx:ToDate)">
            <assert test=".[matches(text(), '^20\d\d\-(0[0-9]|1[012])\-([0-2][0-9]|3[01])T00:00:00(\.0+)?$')]">Om verwarring te voorkomen, moet in elementen van het type xs:dateTime (binnen ValidBetween en AvailabilityCondition) de tijd op 00:00:00 worden gesteld, en mag geen tijdzone worden opgegeven. Dit omdat hier enkel een operationele dag wordt aangeven.</assert>
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

    <!-- GML -->
    <pattern id="gml">
        <rule context="//gml:pos">
            <assert test=".[matches(text(),'^\d{1,6} \d{1,6}$')]">Een gml:pos moet gegeven worden als spatiegescheiden RD-coordinaten</assert>
        </rule>
        <rule context="//gml:posList">
            <assert test=".[matches(text(),'^\d{1,6} \d{1,6}( \d{1,6} \d{1,6})+$')]">Een gml:posList moet gegeven worden als twee of meer spatiegescheiden RD-coordinaten</assert>
        </rule>
    </pattern>

    <!-- Validatie van de CompositeFrame met daarin de dienstregelinggegevens -->
    <pattern id="CompositeFrame">
        <rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEHICLES']">
            <assert test="ntx:FrameDefaults">FrameDefaults is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="CompositeFrame-FrameDefaults">
        <rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEHICLES']/ntx:FrameDefaults">
            <assert test="ntx:DefaultCodespaceRef">FrameDefaults/DefaultCodespaceRef is verplicht</assert>
            <assert test="not(ntx:DefaultSystemOfUnits) or ntx:DefaultSystemOfUnits='SiMetres'">FrameDefaults/DefaultSystemOfUnits is optioneel, maar moet de waarde 'SiMetres' hebben, indien aangeleverd</assert>
        </rule>
    </pattern>
    <pattern id="CompositeFrame-frames">
        <rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEHICLES']/ntx:frames">
            <assert test="ntx:ResourceFrame/ntx:TypeOfFrameRef[count(@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE')=1]">Er moet exact 1 ResourceFrame (van type 'NL:BISON:TypeOfFrame:NL_VEH_RESOURCE') worden geleverd als onderdeel van de voertuigenexport</assert>
        </rule>
    </pattern>

    <!-- Validatie van de ResourceFrame -->
    <pattern id="ResourceFrame">
        <rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE']">
            <assert test="ntx:dataSources[count(ntx:DataSource)=1]">Er moet exact 1 DataSource worden gegeven</assert>
            <assert test="ntx:organisations[count(ntx:Operator)&gt;0]">Er moet minimaal 1 Operator worden gegeven</assert>
            <assert test="ntx:vehicleTypes[count(ntx:VehicleType)&gt;0]">Er moet minimaal 1 VehicleType worden gegeven</assert>
        </rule>
    </pattern>
    <pattern id="ResourceFrame-DataSource">
        <rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE']/ntx:dataSources/ntx:DataSource">
            <assert test="ntx:Name/text()!=''">Name is verplicht</assert>
            <assert test="ntx:ShortName/text()!=''">ShortName is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ResourceFrame-ResponsibilitySet">
        <rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE']/ntx:responsibilitySets/ntx:ResponsibilitySet">
            <assert test="ntx:roles/ntx:ResponsibilityRoleAssignment">ResponsibilityRoleAssignment is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ResourceFrame-Branding">
        <rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE']/ntx:typesOfValue/ntx:Branding">
            <assert test="ntx:Name/text()!=''">Name is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ResourceFrame-TypeOfProductCategory">
        <rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE']/ntx:typesOfValue/ntx:TypeOfProductCategory">
            <assert test="ntx:Name/text()!=''">Name is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ResourceFrame-Operator">
        <rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE']/ntx:organisations/ntx:Operator">
            <assert test="ntx:Name/text()!=''">Name is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ResourceFrame-Authority">
        <rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE']/ntx:organisations/ntx:Authority">
            <assert test="ntx:Name/text()!=''">Name is verplicht</assert>
            <assert test="ntx:ShortName/text()!=''">ShortName is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ResourceFrame-VehicleType">
        <rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE']/ntx:vehicleTypes/ntx:VehicleType">
            <assert test="ntx:Name/text()!=''">Name is verplicht</assert>
            <assert test="ntx:Description/text()!=''">Description is verplicht</assert>
            <assert test="ntx:FuelType/text()!=''">FuelType is verplicht</assert>
            <assert test="ntx:TransportMode/text()!=''">TransportMode is verplicht</assert>
            <assert test="ntx:LowFloor/text()!=''">LowFloor is verplicht</assert>
            <assert test="ntx:HasLiftOrRamp/text()!=''">HasLiftOrRamp is verplicht</assert>
            <assert test="ntx:Length/text()!=''">Length is verplicht</assert>
            <assert test="ntx:facilities/text()!=''">facilities is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ResourceFrame-VehicleType-capacities">
        <rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE']/ntx:vehicleTypes/ntx:VehicleType/ntx:capacities">
            <assert test=".[count(ntx:PassengerCapacity)=1] or .[count(ntx:PassengerCapacityRef)=1]">Altijd 1 embedded PassengerCapacity element OF 1 PassengerCapacityRef verwijzing opnemen</assert>
        </rule>
    </pattern>
    <pattern id="ResourceFrame-Vehicle">
        <rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE']/ntx:vehicles/ntx:Vehicle">
            <assert test="ntx:ValidBetween">ValidBetween is verplicht</assert>
            <assert test="ntx:OperationalNumber">OperationalNumber is verplicht</assert>
            <assert test="ntx:VehicleTypeRef">VehicleTypeRef is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ResourceFrame-ValidBetween">
        <rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE']/ntx:vehicles/ntx:Vehicle/ntx:ValidBetween">
            <assert test="ntx:FromDate/text()!=''">FromDate is verplicht</assert>
        </rule>
    </pattern>
</schema>
