<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://purl.oclc.org/dsdl/schematron">

    <!-- Namespaces used in NeTEx NL -->
    <sch:ns prefix="ntx" uri="http://www.netex.org.uk/netex"/>
    <sch:ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>

    <!-- Include all frame-specific schematron schema -->
    <!-- Composite -->
    <sch:include href="CompositeFrame/FrameDefaults.sch"/>
    <sch:include href="CompositeFrame/ValidBetween.sch"/>
    <sch:include href="CompositeFrame/TypeOfFrameRef.sch"/>
    <sch:include href="CompositeFrame/frames.sch"/>

    <!-- ResourceFrame -->
    <sch:include href="ResourceFrame/TypeOfFrameRef.sch"/>
    <sch:include href="ResourceFrame/Authority.sch"/>
    <sch:include href="ResourceFrame/Branding.sch"/>
    <sch:include href="ResourceFrame/DataSource.sch"/>
    <sch:include href="ResourceFrame/OperationalContext.sch"/>
    <sch:include href="ResourceFrame/Operator.sch"/>
    <sch:include href="ResourceFrame/PassengerCapacity.sch"/>
    <sch:include href="ResourceFrame/ResponsibilitySet.sch"/>
    <sch:include href="ResourceFrame/ServiceFacilitySet.sch"/>
    <sch:include href="ResourceFrame/TransportAdministrativeZone.sch"/>
    <sch:include href="ResourceFrame/TypeOfProductCategory.sch"/>
    <sch:include href="ResourceFrame/Vehicle.sch"/>
    <sch:include href="ResourceFrame/VehicleType.sch"/>

    <!-- InfrastructureFrame -->
    <sch:include href="InfrastructureFrame/TypeOfFrameRef.sch"/>
    <sch:include href="InfrastructureFrame/ActivationPoint.sch"/>

    <!-- ServiceFrame -->
    <sch:include href="ServiceFrame/TypeOfFrameRef.sch"/>
    <sch:include href="ServiceFrame/AccessibilityAssessment.sch"/>
    <sch:include href="ServiceFrame/AccessibilityAssessment-limitations.sch"/>
    <sch:include href="ServiceFrame/AccessibilityLimitation.sch"/>
    <sch:include href="ServiceFrame/DeadRunJourneyPattern.sch"/>
    <sch:include href="ServiceFrame/DestinationDisplay.sch"/>
    <sch:include href="ServiceFrame/DestinationDisplayVariant.sch"/>
    <sch:include href="ServiceFrame/FlexibleStopAssignment.sch"/>
    <sch:include href="ServiceFrame/JourneyLayover.sch"/>
    <sch:include href="ServiceFrame/JourneyRunTime.sch"/>
    <sch:include href="ServiceFrame/JourneyWaitTime.sch"/>
    <sch:include href="ServiceFrame/Line.sch"/>
    <sch:include href="ServiceFrame/Notice.sch"/>
    <sch:include href="ServiceFrame/NoticeAssignment.sch"/>
    <sch:include href="ServiceFrame/PassengerStopAssignment.sch"/>
    <sch:include href="ServiceFrame/PointOnLink.sch"/>
    <sch:include href="ServiceFrame/PointOnRoute.sch"/>
    <sch:include href="ServiceFrame/PointProjection.sch"/>
    <sch:include href="ServiceFrame/Route.sch"/>
    <sch:include href="ServiceFrame/RouteLink.sch"/>
    <sch:include href="ServiceFrame/RoutePoint.sch"/>
    <sch:include href="ServiceFrame/ScheduledStopPoint.sch"/>
    <sch:include href="ServiceFrame/ServiceJourneyPattern.sch"/>
    <sch:include href="ServiceFrame/StopArea.sch"/>
    <sch:include href="ServiceFrame/StopPointInJourneyPattern.sch"/>
    <sch:include href="ServiceFrame/TimeDemandType.sch"/>
    <sch:include href="ServiceFrame/TimingLink.sch"/>
    <sch:include href="ServiceFrame/TimingPoint.sch"/>
    <sch:include href="ServiceFrame/TimingPointInJourneyPattern.sch"/>
    <sch:include href="ServiceFrame/Via.sch"/>

    <!-- TimetableFrame -->
    <sch:include href="TimetableFrame/TypeOfFrameRef.sch"/>
    <sch:include href="TimetableFrame/AvailabilityCondition.sch"/>
    <sch:include href="TimetableFrame/DeadRun.sch"/>
    <sch:include href="TimetableFrame/ServiceJourney.sch"/>
    <sch:include href="TimetableFrame/ServiceJourneyInterchange.sch"/>
    <sch:include href="TimetableFrame/vehicleJourneys.sch"/>

    <!-- ServiceCalendarFrame -->
    <sch:include href="ServiceCalendarFrame/TypeOfFrameRef.sch"/>
    <sch:include href="ServiceCalendarFrame/DayType.sch"/>
    <sch:include href="ServiceCalendarFrame/DayTypeAssignment.sch"/>
    <sch:include href="ServiceCalendarFrame/Timeband.sch"/>

    <!-- VehicleScheduleFrame -->
    <sch:include href="VehicleScheduleFrame/TypeOfFrameRef.sch"/>
    <sch:include href="VehicleScheduleFrame/Block.sch"/>

    <!-- Algemeen -->
    <sch:include href="Algemeen/Presentation.sch"/>
    <sch:include href="Algemeen/Elementidentificatie.sch"/>
    <sch:include href="Algemeen/Concessiegebonden-vervoer.sch"/>

    <!-- GML -->
    <sch:include href="GML/pos.sch"/>
    <sch:include href="GML/posList.sch"/>

    <sch:pattern>
        <sch:rule context="ntx:PublicationDelivery">
            <sch:assert test="@version='ntx:2.0'">version moet gelijk zijn aan 'ntx:2.0'</sch:assert>
            <sch:assert test="ntx:PublicationTimestamp">PublicationTimestamp is verplicht</sch:assert>
            <sch:assert test="ntx:ParticipantRef">ParticipantRef is verplicht</sch:assert>
            <sch:assert test="ntx:dataObjects">dataObjects is verplicht</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>
