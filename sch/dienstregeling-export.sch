<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://purl.oclc.org/dsdl/schematron">
    <!-- Namespaces used in NeTEx NL -->
    <sch:ns prefix="ntx" uri="http://www.netex.org.uk/netex"/>
    <sch:ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>

    <!-- Algemene business rules voor het NL-profiel -->
    <sch:include href="commons/gml.sch"/>
    <sch:include href="commons/id-naming-convention.sch"/>
    <sch:include href="commons/timestamps-and-timezones.sch"/>
    <sch:include href="commons/version-attributes.sch"/>

    <!-- Validatie van de CompositeFrame -->
    <sch:pattern id="CompositeFrame">
        <sch:rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_BASELINE']">
            <sch:assert test="ntx:ValidBetween">De dienstregeling-geldigheid moet zijn aangegeven in een ValidBetween element</sch:assert>
            <sch:assert test="ntx:FrameDefaults">FrameDefaults is verplicht</sch:assert>
            <sch:assert test="ntx:frames">frames is verplicht</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="CompositeFrame-FrameDefaults">
        <sch:rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_BASELINE']/ntx:FrameDefaults">
            <sch:assert test="ntx:DefaultCodespaceRef">FrameDefaults/DefaultCodespaceRef is verplicht</sch:assert>
            <sch:assert test="ntx:DefaultLocale/ntx:TimeZone='Europe/Amsterdam'">FrameDefaults/DefaultLocale/TimeZone is verplicht, en moet de waarde 'Europe/Amsterdam' hebben</sch:assert>
            <sch:assert test="ntx:DefaultLocale/ntx:DefaultLanguage='nl'">FrameDefaults/DefaultLocale/DefaultLanguage is verplicht, en moet de waarde 'nl' hebben</sch:assert>
            <sch:assert test="not(ntx:DefaultLocationSystem) or ntx:DefaultLocationSystem='EPSG:28992'">FrameDefaults/DefaultLocationSystem is optioneel, maar moet de waarde 'EPSG:28992' hebben, indien aangeleverd</sch:assert>
            <sch:assert test="not(ntx:DefaultSystemOfUnits) or ntx:DefaultSystemOfUnits='SiMetres'">FrameDefaults/DefaultSystemOfUnits is optioneel, maar moet de waarde 'SiMetres' hebben, indien aangeleverd</sch:assert>
            <sch:assert test="not(ntx:DefaultCurrency) or ntx:DefaultCurrency='EUR'">FrameDefaults/DefaultCurrency is optioneel, maar moet de waarde 'EUR' hebben, indien aangeleverd</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="CompositeFrame-frames">
        <sch:rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_BASELINE']/ntx:frames">
            <sch:assert test="ntx:ResourceFrame/ntx:TypeOfFrameRef[count(@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE')=1]">Er moet exact 1 ResourceFrame (van type 'NL:BISON:TypeOfFrame:NL_TT_RESOURCE') worden geleverd als onderdeel van de dienstregeling</sch:assert>
            <sch:assert test="not(ntx:InfrastructureFrame) or ntx:InfrastructureFrame/ntx:TypeOfFrameRef[count(@ref='NL:BISON:TypeOfFrame:NL_TT_INFRA')&lt;2]">Er moet 0 of 1 InfrastructureFrames (van type 'NL:BISON:TypeOfFrame:NL_TT_INFRA') worden geleverd als onderdeel van de dienstregeling</sch:assert>
            <sch:assert test="ntx:ServiceFrame/ntx:TypeOfFrameRef[count(@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE')=1]">Er moet exact 1 ServiceFrame (van type 'NL:BISON:TypeOfFrame:NL_TT_SERVICE') worden geleverd als onderdeel van de dienstregeling</sch:assert>
            <sch:assert test="ntx:TimetableFrame/ntx:TypeOfFrameRef[count(@ref='NL:BISON:TypeOfFrame:NL_TT_TIMETABLE')&gt;0]">Er moet minimaal 1 (van type 'NL:BISON:TypeOfFrame:NL_TT_TIMETABLE') TimetableFrame worden geleverd als onderdeel van de dienstregeling</sch:assert>
            <sch:assert test="ntx:ServiceCalendarFrame/ntx:TypeOfFrameRef[count(@ref='NL:BISON:TypeOfFrame:NL_TT_CALENDAR')=1]">Er moet exact 1 (van type 'NL:BISON:TypeOfFrame:NL_TT_CALENDAR') ServiceCalendarFrame worden geleverd als onderdeel van de dienstregeling</sch:assert>
            <sch:assert test="ntx:VehicleScheduleFrame/ntx:TypeOfFrameRef[count(@ref='NL:BISON:TypeOfFrame:NL_TT_VEHICLE')=1]">Er moet exact 1 (van type 'NL:BISON:TypeOfFrame:NL_TT_VEHICLE') VehicleScheduleFrame worden geleverd als onderdeel van de dienstregeling</sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:include href="PublicationDelivery/CompositeFrame/ValidBetween.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/Codespace.sch"/>

    <!-- Validatie van de ResourceFrame -->
    <sch:pattern id="ResourceFrame">
        <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE']">
            <sch:assert test="ntx:dataSources[count(ntx:DataSource)=1]">Er moet exact 1 DataSource worden gegeven</sch:assert>
            <sch:assert test="ntx:responsibilitySets[count(ntx:ResponsibilitySet)&gt;0]">Er moet minimaal een ResponsibilitySet worden gegeven die verwijst naar de partitie-definitie (d.w.z. een TransportAdministrativeZone uit ditzelfde ResourceFrame)</sch:assert>
            <sch:assert test="ntx:organisations[count(ntx:Operator)&gt;0]">Er moet minimaal 1 Operator worden gegeven</sch:assert>
            <sch:assert test="ntx:vehicleTypes[count(ntx:VehicleType)&gt;0]">Er moet minimaal 1 VehicleType worden gegeven</sch:assert>
            <sch:assert test="ntx:zones[count(ntx:TransportAdministrativeZone)&gt;0]">Er moet minimaal 1 TransportAdministrativeZone worden gegeven, die de partitie definieert</sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:include href="PublicationDelivery/CompositeFrame/ResourceFrame/DataSource.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ResourceFrame/ResponsibilitySet.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ResourceFrame/Branding.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ResourceFrame/TypeOfProductCategory.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ResourceFrame/Operator.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ResourceFrame/Authority.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ResourceFrame/OperationalContext.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ResourceFrame/VehicleType.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ResourceFrame/VehicleType-capacities.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ResourceFrame/TransportAdministrativeZone.sch"/>

    <!-- Validatie van de ServiceFrame -->
    <sch:pattern id="ServiceFrame">
        <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']">
            <sch:assert test="ntx:routePoints[count(ntx:RoutePoint)&gt;1]">Er moeten minimaal 2 RoutePoint worden gegeven</sch:assert>
            <sch:assert test="ntx:routeLinks[count(ntx:RouteLink)&gt;0]">Er moet minimaal 1 RouteLink worden gegeven</sch:assert>
            <sch:assert test="ntx:routes[count(ntx:Route)&gt;0]">Er moet minimaal 1 Route worden gegeven</sch:assert>
            <sch:assert test="ntx:lines[count(ntx:Line)&gt;0]">Er moet minimaal 1 Line worden gegeven</sch:assert>
            <sch:assert test="ntx:destinationDisplays[count(ntx:DestinationDisplay)&gt;0]">Er moet minimaal 1 DestinationDisplay worden gegeven</sch:assert>
            <sch:assert test="ntx:scheduledStopPoints[count(ntx:ScheduledStopPoint)&gt;1]">Er moeten minimaal 2 ScheduledStopPoints worden gegeven</sch:assert>
            <sch:assert test="ntx:stopAssignments[count(ntx:PassengerStopAssignment)&gt;1]">Er moeten minimaal 2 PassengerStopAssignment worden gegeven</sch:assert>
            <sch:assert test="ntx:timingLinks[count(ntx:TimingLink)&gt;0]">Er moet minimaal 1 TimingLink worden gegeven</sch:assert>
            <sch:assert test="ntx:journeyPatterns[count(ntx:ServiceJourneyPattern)&gt;0]">Er moet minimaal 1 ServiceJourneyPattern worden gegeven</sch:assert>
            <sch:assert test="ntx:timeDemandTypes[count(ntx:TimeDemandType)&gt;0]">Er moet minimaal 1 TimeDemandType worden gegeven</sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:include href="PublicationDelivery/CompositeFrame/ServiceFrame/RoutePoint.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ServiceFrame/RouteLink.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ServiceFrame/Route.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ServiceFrame/Route-pointsInSequence.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ServiceFrame/Line.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ServiceFrame/AccessibilityAssessment.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ServiceFrame/AccessibilityAssessment-limitations.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ServiceFrame/AccessibilityLimitation.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ServiceFrame/DestinationDisplay.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ServiceFrame/DestinationDisplayVariant.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ServiceFrame/Via.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ServiceFrame/ScheduledStopPoint.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ServiceFrame/PointProjection.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ServiceFrame/StopArea.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ServiceFrame/PassengerStopAssignment.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ServiceFrame/TimingPoint.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ServiceFrame/TimingLink.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ServiceFrame/ServiceJourneyPattern.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ServiceFrame/DeadRunJourneyPattern.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ServiceFrame/TimeDemandType.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ServiceFrame/JourneyRunTime.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ServiceFrame/JourneyWaitTime.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ServiceFrame/JourneyLayover.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ServiceFrame/Notice.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ServiceFrame/NoticeAssignment.sch"/>

    <!-- Validatie van de InfrastructureFrame -->
    <!-- Het leveren van een InfrastructureFrame is niet verplicht. -->
    <!-- Binnen het NL profiel is alleen ActivationPoint relevant voor het NL profiel, maar ook deze zijn niet verplicht als er een InfrastructureFrame wordt opgenomen. -->

    <sch:include href="PublicationDelivery/CompositeFrame/InfrastructureFrame/ActivationPoint.sch"/>

    <!-- Validatie van de VehicleScheduleFrame -->
    <sch:pattern id="VehicleScheduleFrame">
        <sch:rule context="ntx:VehicleScheduleFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_VEHICLE']">
            <sch:assert test="ntx:blocks[count(ntx:Block)&gt;0]">Er moet minimaal 1 Block worden gegeven</sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:include href="PublicationDelivery/CompositeFrame/VehicleScheduleFrame/Block.sch"/>

    <!-- Validatie van de ServiceCalendarFrame -->
    <sch:pattern id="ServiceCalendarFrame">
        <sch:rule context="ntx:ServiceCalendarFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_CALENDAR']">
            <sch:assert test="ntx:dayTypes[count(ntx:DayType)&gt;0]">Er moet minimaal 1 DayType worden gegeven</sch:assert>
            <sch:assert test="ntx:dayTypeAssignments[count(ntx:DayTypeAssignment)&gt;0]">Er moet minimaal 1 DayTypeAssignment worden gegeven</sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:include href="PublicationDelivery/CompositeFrame/ServiceCalendarFrame/DayType.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ServiceCalendarFrame/Timeband.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/ServiceCalendarFrame/DayTypeAssignment.sch"/>

    <!-- Validatie van de TimetableFrame -->
    <sch:pattern id="TimetableFrame">
        <sch:rule context="ntx:TimetableFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_TIMETABLE']">
            <sch:assert test="ntx:contentValidityConditions[count(ntx:AvailabilityCondition)&gt;0]">Er moet minimaal 1 AvailabilityCondition worden gegeven</sch:assert>
            <sch:assert test="ntx:vehicleJourneys[count(ntx:ServiceJourney)&gt;0]">Er moet minimaal 1 ServiceJourney worden gegeven</sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:include href="PublicationDelivery/CompositeFrame/TimetableFrame/AvailabilityCondition.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/TimetableFrame/ServiceJourney.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/TimetableFrame/DeadRun.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/TimetableFrame/ServiceJourneyInterchange.sch"/>
</sch:schema>
