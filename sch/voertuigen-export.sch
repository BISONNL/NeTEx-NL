<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://purl.oclc.org/dsdl/schematron">
    <!-- Namespaces used in NeTEx NL -->
    <sch:ns prefix="ntx" uri="http://www.netex.org.uk/netex"/>
    <sch:ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>



    <!-- Afwezigheid van tijdzones in dateTime elementen -->
    <sch:pattern id="NoTimeAndTimezones">
        <sch:rule context="(ntx:PublicationTimestamp)">
            <sch:assert test=".[matches(text(), '^20\d\d\-(0[0-9]|1[012])\-([0-2][0-9]|3[01])T[012][0-9]:[0-5][0-9]:[0-5][0-9](\.\d+)?$')]">PublicationTimestamp mag geen tijdzone specificeren</sch:assert>
        </sch:rule>
        <sch:rule context="(ntx:FromDate|ntx:ToDate)">
            <sch:assert test=".[matches(text(), '^20\d\d\-(0[0-9]|1[012])\-([0-2][0-9]|3[01])T00:00:00(\.0+)?$')]">Om verwarring te voorkomen, moet in elementen van het type xs:dateTime (binnen ValidBetween en AvailabilityCondition) de tijd op 00:00:00 worden gesteld, en mag geen tijdzone worden opgegeven. Dit omdat hier enkel een operationele dag wordt aangeven.</sch:assert>
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

    <!-- GML -->
    <sch:pattern id="gml">
        <sch:rule context="//gml:pos">
            <sch:assert test=".[matches(text(),'^\d{1,6} \d{1,6}$')]">Een gml:pos moet gegeven worden als spatiegescheiden RD-coordinaten</sch:assert>
        </sch:rule>
        <sch:rule context="//gml:posList">
            <sch:assert test=".[matches(text(),'^\d{1,6} \d{1,6}( \d{1,6} \d{1,6})+$')]">Een gml:posList moet gegeven worden als twee of meer spatiegescheiden RD-coordinaten</sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- Validatie van de CompositeFrame met daarin de dienstregelinggegevens -->
    <sch:pattern id="CompositeFrame">
        <sch:rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEHICLES']">
            <sch:assert test="ntx:FrameDefaults">FrameDefaults is verplicht</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="CompositeFrame-FrameDefaults">
        <sch:rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEHICLES']/ntx:FrameDefaults">
            <sch:assert test="ntx:DefaultCodespaceRef">FrameDefaults/DefaultCodespaceRef is verplicht</sch:assert>
            <sch:assert test="not(ntx:DefaultSystemOfUnits) or ntx:DefaultSystemOfUnits='SiMetres'">FrameDefaults/DefaultSystemOfUnits is optioneel, maar moet de waarde 'SiMetres' hebben, indien aangeleverd</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="CompositeFrame-frames">
        <sch:rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEHICLES']/ntx:frames">
            <sch:assert test="ntx:ResourceFrame/ntx:TypeOfFrameRef[count(@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE')=1]">Er moet exact 1 ResourceFrame (van type 'NL:BISON:TypeOfFrame:NL_VEH_RESOURCE') worden geleverd als onderdeel van de voertuigenexport</sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- Validatie van de ResourceFrame -->
    <sch:pattern id="ResourceFrame">
        <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE']">
            <sch:assert test="ntx:dataSources[count(ntx:DataSource)=1]">Er moet exact 1 DataSource worden gegeven</sch:assert>
            <sch:assert test="ntx:organisations[count(ntx:Operator)&gt;0]">Er moet minimaal 1 Operator worden gegeven</sch:assert>
            <sch:assert test="ntx:vehicleTypes[count(ntx:VehicleType)&gt;0]">Er moet minimaal 1 VehicleType worden gegeven</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="ResourceFrame-DataSource">
        <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE']/ntx:dataSources/ntx:DataSource">
            <sch:assert test="ntx:Name/text()!=''">Name is verplicht</sch:assert>
            <sch:assert test="ntx:ShortName/text()!=''">ShortName is verplicht</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="ResourceFrame-ResponsibilitySet">
        <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE']/ntx:responsibilitySets/ntx:ResponsibilitySet">
            <sch:assert test="ntx:roles/ntx:ResponsibilityRoleAssignment">ResponsibilityRoleAssignment is verplicht</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="ResourceFrame-Branding">
        <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE']/ntx:typesOfValue/ntx:Branding">
            <sch:assert test="ntx:Name/text()!=''">Name is verplicht</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="ResourceFrame-TypeOfProductCategory">
        <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE']/ntx:typesOfValue/ntx:TypeOfProductCategory">
            <sch:assert test="ntx:Name/text()!=''">Name is verplicht</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="ResourceFrame-Operator">
        <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE']/ntx:organisations/ntx:Operator">
            <sch:assert test="ntx:Name/text()!=''">Name is verplicht</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="ResourceFrame-Authority">
        <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE']/ntx:organisations/ntx:Authority">
            <sch:assert test="ntx:Name/text()!=''">Name is verplicht</sch:assert>
            <sch:assert test="ntx:ShortName/text()!=''">ShortName is verplicht</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="ResourceFrame-VehicleType">
        <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE']/ntx:vehicleTypes/ntx:VehicleType">
            <sch:assert test="ntx:Name/text()!=''">Name is verplicht</sch:assert>
            <sch:assert test="ntx:Description/text()!=''">Description is verplicht</sch:assert>
            <sch:assert test="ntx:FuelType/text()!=''">FuelType is verplicht</sch:assert>
            <sch:assert test="ntx:TransportMode/text()!=''">TransportMode is verplicht</sch:assert>
            <sch:assert test="ntx:LowFloor/text()!=''">LowFloor is verplicht</sch:assert>
            <sch:assert test="ntx:HasLiftOrRamp/text()!=''">HasLiftOrRamp is verplicht</sch:assert>
            <sch:assert test="ntx:Length/text()!=''">Length is verplicht</sch:assert>
            <sch:assert test="ntx:facilities/text()!=''">facilities is verplicht</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="ResourceFrame-VehicleType-capacities">
        <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE']/ntx:vehicleTypes/ntx:VehicleType/ntx:capacities">
            <sch:assert test=".[count(ntx:PassengerCapacity)=1] or .[count(ntx:PassengerCapacityRef)=1]">Altijd 1 embedded PassengerCapacity element OF 1 PassengerCapacityRef verwijzing opnemen</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="ResourceFrame-Vehicle">
        <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE']/ntx:vehicles/ntx:Vehicle">
            <sch:assert test="ntx:ValidBetween">ValidBetween is verplicht</sch:assert>
            <sch:assert test="ntx:OperationalNumber">OperationalNumber is verplicht</sch:assert>
            <sch:assert test="ntx:VehicleTypeRef">VehicleTypeRef is verplicht</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="ResourceFrame-ValidBetween">
        <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE']/ntx:vehicles/ntx:Vehicle/ntx:ValidBetween">
            <sch:assert test="ntx:FromDate/text()!=''">FromDate is verplicht</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>
