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
        <rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_BASELINE']">
            <assert test="ntx:ValidBetween">De dienstregeling-geldigheid moet zijn aangegeven in een ValidBetween element</assert>
            <assert test="ntx:FrameDefaults">FrameDefaults is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="CompositeFrame-ValidBetween">
        <rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_BASELINE']/ntx:ValidBetween">
            <assert test="ntx:FromDate/text()!=''">FromDate is verplicht</assert>
            <assert test="ntx:ToDate/text()!=''">ToDate is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="CompositeFrame-Codespace">
        <rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_BASELINE']/ntx:codespaces">
            <assert test="ntx:Codespace/ntx:Xmlns/text()!=''">Xmlns is verplicht</assert>
            <assert test="ntx:Codespace/ntx:Description/text()!=''">Description is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="CompositeFrame-FrameDefaults">
        <rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_BASELINE']/ntx:FrameDefaults">
            <assert test="ntx:DefaultCodespaceRef">FrameDefaults/DefaultCodespaceRef is verplicht</assert>
            <assert test="ntx:DefaultLocale/ntx:TimeZone='Europe/Amsterdam'">FrameDefaults/DefaultLocale/TimeZone is verplicht, en moet de waarde 'Europe/Amsterdam' hebben</assert>
            <assert test="ntx:DefaultLocale/ntx:DefaultLanguage='nl'">FrameDefaults/DefaultLocale/DefaultLanguage is verplicht, en moet de waarde 'nl' hebben</assert>
            <assert test="not(ntx:DefaultLocationSystem) or ntx:DefaultLocationSystem='EPSG:28992'">FrameDefaults/DefaultLocationSystem is optioneel, maar moet de waarde 'EPSG:28992' hebben, indien aangeleverd</assert>
            <assert test="not(ntx:DefaultSystemOfUnits) or ntx:DefaultSystemOfUnits='SiMetres'">FrameDefaults/DefaultSystemOfUnits is optioneel, maar moet de waarde 'SiMetres' hebben, indien aangeleverd</assert>
            <assert test="not(ntx:DefaultCurrency) or ntx:DefaultCurrency='EUR'">FrameDefaults/DefaultCurrency is optioneel, maar moet de waarde 'EUR' hebben, indien aangeleverd</assert>
        </rule>
    </pattern>
    <pattern id="CompositeFrame-frames">
        <rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_BASELINE']/ntx:frames">
            <assert test="ntx:ResourceFrame/ntx:TypeOfFrameRef[count(@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE')=1]">Er moet exact 1 ResourceFrame (van type 'NL:BISON:TypeOfFrame:NL_TT_RESOURCE') worden geleverd als onderdeel van de dienstregeling</assert>
            <assert test="not(ntx:InfrastructureFrame) or ntx:InfrastructureFrame/ntx:TypeOfFrameRef[count(@ref='NL:BISON:TypeOfFrame:NL_TT_INFRA')&lt;2]">Er moet 0 of 1 InfrastructureFrames (van type 'NL:BISON:TypeOfFrame:NL_TT_INFRA') worden geleverd als onderdeel van de dienstregeling</assert>
            <assert test="not(ntx:SiteFrame) or ntx:SiteFrame/ntx:TypeOfFrameRef[count(@ref='NL:BISON:TypeOfFrame:NL_TT_SITE')&lt;2]">Er moet 0 of 1 SiteFrame (van type 'NL:BISON:TypeOfFrame:NL_TT_SITE') worden geleverd als onderdeel van de dienstregeling</assert>
            <assert test="ntx:ServiceFrame/ntx:TypeOfFrameRef[count(@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE')=1]">Er moet exact 1 ServiceFrame (van type 'NL:BISON:TypeOfFrame:NL_TT_SERVICE') worden geleverd als onderdeel van de dienstregeling</assert>
            <assert test="ntx:TimetableFrame/ntx:TypeOfFrameRef[count(@ref='NL:BISON:TypeOfFrame:NL_TT_TIMETABLE')&gt;0]">Er moet minimaal 1 (van type 'NL:BISON:TypeOfFrame:NL_TT_TIMETABLE') TimetableFrame worden geleverd als onderdeel van de dienstregeling</assert>
            <assert test="ntx:ServiceCalendarFrame/ntx:TypeOfFrameRef[count(@ref='NL:BISON:TypeOfFrame:NL_TT_CALENDAR')=1]">Er moet exact 1 (van type 'NL:BISON:TypeOfFrame:NL_TT_CALENDAR') ServiceCalendarFrame worden geleverd als onderdeel van de dienstregeling</assert>
            <assert test="ntx:VehicleScheduleFrame/ntx:TypeOfFrameRef[count(@ref='NL:BISON:TypeOfFrame:NL_TT_VEHICLE')=1]">Er moet exact 1 (van type 'NL:BISON:TypeOfFrame:NL_TT_VEHICLE') VehicleScheduleFrame worden geleverd als onderdeel van de dienstregeling</assert>
        </rule>
    </pattern>

    <!-- Validatie van de ResourceFrame -->
    <pattern id="ResourceFrame">
        <rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE']">
            <assert test="ntx:dataSources[count(ntx:DataSource)=1]">Er moet exact 1 DataSource worden gegeven</assert>
            <assert test="ntx:responsibilitySets[count(ntx:ResponsibilitySet)&gt;0]">Er moet minimaal een ResponsibilitySet worden gegeven die verwijst naar de partitie-definitie (d.w.z. een TransportAdministrativeZone uit ditzelfde ResourceFrame)</assert>
            <assert test="ntx:organisations[count(ntx:Operator)&gt;0]">Er moet minimaal 1 Operator worden gegeven</assert>
            <assert test="ntx:vehicleTypes[count(ntx:VehicleType)&gt;0]">Er moet minimaal 1 VehicleType worden gegeven</assert>
            <assert test="ntx:zones[count(ntx:TransportAdministrativeZone)&gt;0]">Er moet minimaal 1 TransportAdministrativeZone worden gegeven, die de partitie definieert</assert>
        </rule>
    </pattern>
    <pattern id="ResourceFrame-DataSource">
        <rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE']/ntx:dataSources/ntx:DataSource">
            <assert test="ntx:Name/text()!=''">Name is verplicht</assert>
            <assert test="ntx:ShortName/text()!=''">ShortName is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ResourceFrame-ResponsibilitySet">
        <rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE']/ntx:responsibilitySets/ntx:ResponsibilitySet">
            <assert test="ntx:roles/ntx:ResponsibilityRoleAssignment">ResponsibilityRoleAssignment is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ResourceFrame-Branding">
        <rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE']/ntx:typesOfValue/ntx:Branding">
            <assert test="ntx:Name/text()!=''">Name is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ResourceFrame-TypeOfProductCategory">
        <rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE']/ntx:typesOfValue/ntx:TypeOfProductCategory">
            <assert test="ntx:Name/text()!=''">Name is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ResourceFrame-Operator">
        <rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE']/ntx:organisations/ntx:Operator">
            <assert test="ntx:Name/text()!=''">Name is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ResourceFrame-Authority">
        <rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE']/ntx:organisations/ntx:Authority">
            <assert test="ntx:Name/text()!=''">Name is verplicht</assert>
            <assert test="ntx:ShortName/text()!=''">ShortName is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ResourceFrame-OperationalContext">
        <rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE']/ntx:operationalContexts/ntx:OperationalContext">
            <assert test="ntx:VehicleMode/text()!=''">VehicleMode is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ResourceFrame-VehicleType">
        <rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE']/ntx:vehicleTypes/ntx:VehicleType">
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
        <rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE']/ntx:vehicleTypes/ntx:VehicleType/ntx:capacities">
            <assert test=".[count(ntx:PassengerCapacity)=1] or .[count(ntx:PassengerCapacityRef)=1]">Altijd 1 embedded PassengerCapacity element OF 1 PassengerCapacityRef verwijzing opnemen</assert>
        </rule>
    </pattern>
    <pattern id="ResourceFrame-TransportAdministrativeZone">
        <rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE']/ntx:zones/ntx:TransportAdministrativeZone">
            <assert test="ntx:ShortName/text()!=''">ShortName is verplicht</assert>
        </rule>
    </pattern>

    <!-- Validatie van de ServiceFrame -->
    <pattern id="ServiceFrame">
        <rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']">
            <assert test="ntx:routePoints[count(ntx:RoutePoint)&gt;1]">Er moeten minimaal 2 RoutePoint worden gegeven</assert>
            <assert test="ntx:routeLinks[count(ntx:RouteLink)&gt;0]">Er moet minimaal 1 RouteLink worden gegeven</assert>
            <assert test="ntx:routes[count(ntx:Route)&gt;0]">Er moet minimaal 1 Route worden gegeven</assert>
            <assert test="ntx:lines[count(ntx:Line)&gt;0]">Er moet minimaal 1 Line worden gegeven</assert>
            <assert test="ntx:destinationDisplays[count(ntx:DestinationDisplay)&gt;0]">Er moet minimaal 1 DestinationDisplay worden gegeven</assert>
            <assert test="ntx:scheduledStopPoints[count(ntx:ScheduledStopPoint)&gt;1]">Er moeten minimaal 2 ScheduledStopPoints worden gegeven</assert>
            <assert test="ntx:stopAssignments[count(ntx:PassengerStopAssignment)&gt;1]">Er moeten minimaal 2 PassengerStopAssignment worden gegeven</assert>
            <assert test="ntx:timingLinks[count(ntx:TimingLink)&gt;0]">Er moet minimaal 1 TimingLink worden gegeven</assert>
            <assert test="ntx:journeyPatterns[count(ntx:ServiceJourneyPattern)&gt;0]">Er moet minimaal 1 ServiceJourneyPattern worden gegeven</assert>
            <assert test="ntx:timeDemandTypes[count(ntx:TimeDemandType)&gt;0]">Er moet minimaal 1 TimeDemandType worden gegeven</assert>
        </rule>
    </pattern>
    <pattern id="ServiceFrame-RoutePoint">
        <rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:routePoints/ntx:RoutePoint">
            <assert test="ntx:Location">Location is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ServiceFrame-RouteLink">
        <rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:routeLinks/ntx:RouteLink">
            <assert test="gml:LineString">LineString is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ServiceFrame-Route">
        <rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:routes/ntx:Route">
            <assert test="ntx:LineRef">LineRef is verplicht</assert>
            <assert test="ntx:DirectionType">DirectionType is verplicht</assert>
            <assert test="ntx:pointsInSequence">pointsInSequence is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ServiceFrame-Route-pointsInSequence">
        <rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:routes/ntx:Route/ntx:pointsInSequence">
            <assert test="count(ntx:PointOnRoute)>1">Er wordt een minimum van twee PointOnRoute elementen verwacht</assert>
        </rule>
    </pattern>
    <pattern id="ServiceFrame-Line">
        <rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:lines/ntx:Line">
            <assert test="ntx:Name">Name is verplicht</assert>
            <assert test="ntx:TransportMode">TransportMode is verplicht</assert>
            <assert test="ntx:privateCodes/ntx:PrivateCode[@type='LinePlanningNumber']">PrivateCode van type 'LinePlanningNumber' is verplicht</assert>
            <assert test="ntx:OperatorRef">OperatorRef is verplicht</assert>
            <assert test="ntx:TypeOfServiceRef">TypeOfServiceRef is verplicht</assert>
            <assert test="ntx:Monitored">Monitored is verplicht</assert>
            <assert test="ntx:AccessibilityAssessment">AccessibilityAssessment is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ServiceFrame-Line-AccessibilityAssessment">
        <rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:lines/ntx:Line/ntx:AccessibilityAssessment">
            <assert test="ntx:MobilityImpairedAccess">MobilityImpairedAccess is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ServiceFrame-Line-AccessibilityAssessment-limitations">
        <rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:lines/ntx:Line/ntx:AccessibilityAssessment/ntx:limitations">
            <assert test="ntx:AccessibilityLimitation">AccessibilityLimitation is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ServiceFrame-Line-AccessibilityAssessment-limitations-AccessibilityLimitation">
        <rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:lines/ntx:Line/ntx:AccessibilityAssessment/ntx:limitations/ntx:AccessibilityLimitation">
            <assert test="ntx:WheelchairAccess">WheelchairAccess is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ServiceFrame-DestinationDisplay">
        <rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:destinationDisplays/ntx:DestinationDisplay">
            <assert test="ntx:Name">Name is verplicht</assert>
            <assert test="ntx:FrontText">FrontText is verplicht</assert>
            <assert test="ntx:variants/ntx:DestinationDisplayVariant[ntx:Extensions[count(ntx:MaxLength)=1]/ntx:MaxLength/text()='BISON:DisplayTextLength:16']">DestinationDisplayVariant voor lengtevariant 'BISON:DisplayTextLength:16' is verplicht</assert>
            <assert test="ntx:variants/ntx:DestinationDisplayVariant[ntx:Extensions[count(ntx:MaxLength)=1]/ntx:MaxLength/text()='BISON:DisplayTextLength:19']">DestinationDisplayVariant voor lengtevariant 'BISON:DisplayTextLength:19' is verplicht</assert>
            <assert test="ntx:variants/ntx:DestinationDisplayVariant[ntx:Extensions[count(ntx:MaxLength)=1]/ntx:MaxLength/text()='BISON:DisplayTextLength:21']">DestinationDisplayVariant voor lengtevariant 'BISON:DisplayTextLength:21' is verplicht</assert>
            <assert test="ntx:variants/ntx:DestinationDisplayVariant[ntx:Extensions[count(ntx:MaxLength)=1]/ntx:MaxLength/text()='BISON:DisplayTextLength:24']">DestinationDisplayVariant voor lengtevariant 'BISON:DisplayTextLength:24' is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ServiceFrame-DestinationDisplay-DestinationDisplayVariant">
        <rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:destinationDisplays/ntx:DestinationDisplay/ntx:variants/ntx:DestinationDisplayVariant">
            <assert test="ntx:Name">Name is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ServiceFrame-DestinationDisplay-Via">
        <rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:destinationDisplays/ntx:DestinationDisplay//ntx:Via">
            <assert test="ntx:Name">Name is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ServiceFrame-ScheduledStopPoint">
        <rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:scheduledStopPoints/ntx:ScheduledStopPoint">
            <assert test="ntx:Name">Name is verplicht</assert>
            <assert test="ntx:Location">Location is verplicht</assert>
            <assert test="ntx:projections/ntx:PointProjection">projections/PointProjection is verplicht</assert>
            <assert test="ntx:privateCodes/ntx:PrivateCode[@type='UserStopCode']">PrivateCode van type 'UserStopCode' is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ServiceFrame-ScheduledStopPoint-projections">
        <rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:scheduledStopPoints/ntx:ScheduledStopPoint/ntx:projections/ntx:PointProjection">
            <assert test="ntx:ProjectToPointRef">ProjectToPointRef is verplicht</assert>
            <assert test="ntx:ProjectToPointRef/@nameOfRefClass">Attribuut nameOfRefClass moet altijd de waarde 'RoutePoint' hebben</assert>
        </rule>
    </pattern>
    <pattern id="ServiceFrame-StopArea">
        <rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:stopAreas/ntx:StopArea">
            <assert test="ntx:Name">Name is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ServiceFrame-PassengerStopAssignment">
        <rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:stopAssignments/ntx:PassengerStopAssignment">
            <assert test="ntx:ScheduledStopPointRef">ScheduledStopPointRef is verplicht</assert>
            <assert test="ntx:QuayRef">QuayRef is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ServiceFrame-FlexibleStopAssignment">
        <rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:stopAssignments/ntx:FlexibleStopAssignment">
            <assert test="ntx:ScheduledStopPointRef">ScheduledStopPointRef is verplicht</assert>
            <assert test="ntx:FlexibleStopPlaceRef">FlexibleStopPlaceRef is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ServiceFrame-TimingPoint">
        <rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:timingPoints/ntx:TimingPoint">
            <assert test="ntx:Name">Name is verplicht</assert>
            <assert test="ntx:Location">Location is verplicht</assert>
            <assert test="ntx:projections/ntx:PointProjection">projections/PointProjection is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ServiceFrame-TimingPoint-projections">
        <rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:timingPoints/ntx:TimingPoint/ntx:projections/ntx:PointProjection">
            <assert test="ntx:ProjectToPointRef">ProjectToPointRef is verplicht</assert>
            <assert test="ntx:ProjectToPointRef/@nameOfRefClass">Attribuut nameOfRefClass moet altijd de waarde 'RoutePoint' hebben</assert>
        </rule>
    </pattern>
    <pattern id="ServiceFrame-TimingLink">
        <rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:timingLinks/ntx:TimingLink">
            <assert test="ntx:Distance">Distance is verplicht</assert>
            <assert test="ntx:FromPointRef">FromPointRef is verplicht</assert>
            <assert test="ntx:ToPointRef">ToPointRef is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ServiceFrame-ServiceJourneyPattern">
        <rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:journeyPatterns/ntx:ServiceJourneyPattern">
            <assert test="ntx:RouteRef">RouteRef is verplicht</assert>
            <assert test="ntx:DestinationDisplayRef">DestinationDisplayRef is verplicht</assert>
            <assert test="ntx:pointsInSequence[count(*)>1]">Er moeten minimaal twee punten opgenomen zijn in de pointsInSequence (StopPointInJourneyPattern en/of TimingPointInJourneyPattern)</assert>
        </rule>
    </pattern>
    <pattern id="ServiceFrame-DeadRunJourneyPattern">
        <rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:journeyPatterns/ntx:DeadRunJourneyPattern">
            <assert test="ntx:pointsInSequence[count(*)>1]">Er moeten minimaal twee punten opgenomen zijn in de pointsInSequence (StopPointInJourneyPattern en/of TimingPointInJourneyPattern)</assert>
        </rule>
    </pattern>
    <pattern id="ServiceFrame-TimeDemandType">
        <rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:timeDemandTypes/ntx:TimeDemandType">
            <assert test="ntx:runTimes">runTimes is verplicht</assert>
            <assert test="ntx:runTimes[count(ntx:JourneyRunTime)>0]">Er moet minimaal één JourneyRunTime opgenomen zijn</assert>
            <assert test="not(ntx:waitTimes) or ntx:waitTimes[count(ntx:JourneyWaitTime)>0]">Laat het layovers parent-element weg of neem hierin minimaal één JourneyWaitTime op</assert>
            <assert test="not(ntx:layovers) or ntx:layovers[count(ntx:JourneyLayover)>0]">Laat het layovers parent-element weg of neem hierin minimaal één JourneyLayover op</assert>
        </rule>
    </pattern>
    <pattern id="ServiceFrame-TimeDemandType-JourneyRunTime">
        <rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:timeDemandTypes/ntx:TimeDemandType/ntx:runtimes/ntx:JourneyRunTime">
            <assert test="ntx:TimingLinkRef">TimingLinkRef is verplicht</assert>
            <assert test="ntx:RunTime">RunTime is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ServiceFrame-TimeDemandType-JourneyWaitTime">
        <rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:timeDemandTypes/ntx:TimeDemandType/ntx:waitTimes/ntx:JourneyWaitTime">
            <assert test="ntx:ScheduledStopPointRef or ntx:TimingPointRef">Neem een ScheduledStopPointRef óf TimingPointRef op</assert>
            <assert test="ntx:WaitTime">WaitTime is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ServiceFrame-TimeDemandType-JourneyLayover">
        <rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:timeDemandTypes/ntx:TimeDemandType/ntx:layovers/ntx:JourneyLayover">
            <assert test="ntx:ScheduledStopPointRef or ntx:TimingPointRef">Neem een ScheduledStopPointRef óf TimingPointRef op</assert>
            <assert test="ntx:Layover">Layover is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ServiceFrame-Notice">
        <rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:notices/ntx:Notice">
            <assert test="ntx:Text">Text is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ServiceFrame-NoticeAssignment">
        <rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:noticeAssignments/ntx:NoticeAssignment">
            <assert test="ntx:NoticeRef">NoticeRef is verplicht</assert>
            <assert test="ntx:NoticedObjectRef">NoticedObjectRef is verplicht</assert>
        </rule>
    </pattern>

    <!-- Validatie van de InfrastructureFrame -->
    <!-- Het leveren van een InfrastructureFrame is niet verplicht. -->
    <!-- Binnen het NL profiel is alleen ActivationPoint relevant voor het NL profiel, maar ook deze zijn niet verplicht als er een InfrastructureFrame wordt opgenomen. -->
    <pattern id="InfrastructureFrame-ActivationPoint">
        <rule context="ntx:InfrastructureFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_INFRA']/ntx:activationPoints/ntx:ActivationPoint">
            <assert test="ntx:privateCodes/ntx:PrivateCode[@type='KarAddress']">PrivateCode van type 'KarAddress' is verplicht</assert>
            <assert test="ntx:TypeOfActivationRef">TypeOfActivationRef is verplicht</assert>
        </rule>
    </pattern>

    <!-- Validatie van de VehicleScheduleFrame -->
    <pattern id="VehicleScheduleFrame">
        <rule context="ntx:VehicleScheduleFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_VEHICLE']">
            <assert test="ntx:blocks[count(ntx:Block)&gt;0]">Er moet minimaal 1 Block worden gegeven</assert>
        </rule>
    </pattern>
    <pattern id="VehicleScheduleFrame-Block">
        <rule context="ntx:VehicleScheduleFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_VEHICLE']/ntx:blocks/ntx:Block">
            <assert test="ntx:Name">Name is verplicht</assert>
            <assert test="ntx:privateCodes/ntx:PrivateCode[@type='BlockCode']">PrivateCode van type 'BlockCode' is verplicht</assert>
            <assert test="ntx:journeys[count(*)>0]">Journeys moet minimaal 1 DeadRunRef of ServiceJourneyRef bevatten</assert>
        </rule>
    </pattern>

    <!-- Validatie van de ServiceCalendarFrame -->
    <pattern id="ServiceCalendarFrame">
        <rule context="ntx:ServiceCalendarFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_CALENDAR']">
            <assert test="ntx:dayTypes[count(ntx:DayType)&gt;0]">Er moet minimaal 1 DayType worden gegeven</assert>
            <assert test="ntx:dayTypeAssignments[count(ntx:DayTypeAssignment)&gt;0]">Er moet minimaal 1 DayTypeAssignment worden gegeven</assert>
        </rule>
    </pattern>
    <pattern id="ServiceCalendarFrame-DayType">
        <rule context="ntx:ServiceCalendarFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_CALENDAR']/ntx:dayTypes/ntx:DayType">
            <assert test="ntx:properties/ntx:PropertyOfDay">Er moet minimaal 1 PropertyOfDay worden gegeven</assert>
        </rule>
    </pattern>
    <pattern id="ServiceCalendarFrame-Timeband">
        <rule context="ntx:ServiceCalendarFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_CALENDAR']/ntx:timebands/ntx:Timeband">
            <assert test="ntx:StartTime">StartTime is verplicht</assert>
            <assert test="ntx:EndTime">EndTime is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="ServiceCalendarFrame-DayTypeAssignment">
        <rule context="ntx:ServiceCalendarFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_CALENDAR']/ntx:dayTypeAssignments/ntx:DayTypeAssignment">
            <assert test="ntx:Date">Date is verplicht</assert>
            <assert test="ntx:DayTypeRef">DayTypeRef is verplicht</assert>
        </rule>
    </pattern>

    <!-- Validatie van de TimetableFrame -->
    <pattern id="TimetableFrame">
        <rule context="ntx:TimetableFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_TIMETABLE']">
            <assert test="ntx:contentValidityConditions[count(ntx:AvailabilityCondition)&gt;0]">Er moet minimaal 1 AvailabilityCondition worden gegeven</assert>
            <assert test="ntx:vehicleJourneys[count(ntx:ServiceJourney)&gt;0]">Er moet minimaal 1 ServiceJourney worden gegeven</assert>
        </rule>
    </pattern>
    <pattern id="TimetableFrame-AvailabilityCondition">
        <rule context="ntx:TimetableFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_TIMETABLE']/ntx:contentValidityConditions/ntx:AvailabilityCondition">
            <assert test="ntx:FromDate">FromDate is verplicht</assert>
            <assert test="ntx:ToDate">ToDate is verplicht</assert>
            <assert test="ntx:ValidDayBits">ValidDayBits is verplicht</assert>
            <assert test="ntx:ValidDayBits[matches(text(), '^[01]+$')]">ValidDayBits is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="TimetableFrame-ServiceJourney">
        <rule context="ntx:TimetableFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_TIMETABLE']/ntx:vehicleJourneys/ntx:ServiceJourney">
            <assert test="ntx:validityConditions">validityConditions is verplicht</assert>
            <assert test="ntx:privateCodes/ntx:PrivateCode[@type='JourneyNumber']">PrivateCode van type 'JourneyNumber' is verplicht</assert>
            <assert test="ntx:DepartureTime">DepartureTime is verplicht</assert>
            <assert test="ntx:ServiceJourneyPatternRef">ServiceJourneyPatternRef is verplicht</assert>
            <assert test="ntx:TimeDemandTypeRef">TimeDemandTypeRef is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="TimetableFrame-DeadRun">
        <rule context="ntx:TimetableFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_TIMETABLE']/ntx:vehicleJourneys/ntx:DeadRun">
            <assert test="ntx:validityConditions">validityConditions is verplicht</assert>
            <assert test="ntx:privateCodes/ntx:PrivateCode[@type='JourneyNumber']">PrivateCode van type 'JourneyNumber' is verplicht</assert>
            <assert test="ntx:DepartureTime">DepartureTime is verplicht</assert>
            <assert test="ntx:DeadRunJourneyPatternRef">DeadRunJourneyPatternRef is verplicht</assert>
            <assert test="ntx:TimeDemandTypeRef">TimeDemandTypeRef is verplicht</assert>
        </rule>
    </pattern>
    <pattern id="TimetableFrame-ServiceJourneyInterchange">
        <rule context="ntx:TimetableFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_TIMETABLE']/ntx:journeyInterchanges/ntx:ServiceJourneyInterchange">
            <assert test="ntx:FromPointRef">FromPointRef is verplicht</assert>
            <assert test="ntx:ToPointRef">ToPointRef is verplicht</assert>
            <assert test="ntx:FromJourneyRef">FromJourneyRef is verplicht</assert>
            <assert test="ntx:ToJourneyRef">ToJourneyRef is verplicht</assert>
        </rule>
    </pattern>
</schema>
