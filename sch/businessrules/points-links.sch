<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="ntx" uri="http://www.netex.org.uk/netex"/>
    <sch:ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>

    <!-- De LineString van een RouteLink begint met het coordinaat van het FromPointRef en eindigt met het coordinaat van het ToPointRef -->
    <sch:pattern>
        <sch:rule context="//ntx:RouteLink">
            <!-- FromPoint -->
            <sch:let name="fromPointId" value="ntx:FromPointRef/@ref"/>
            <sch:let name="fromPointVersion" value="ntx:FromPointRef/@version"/>
            <sch:let name="fromPoint" value="//RoutePoint[@id=$fromPointId and @version=$fromPointVersion]/ntx:Location/gml:pos/text()"/>
            <!-- ToPoint -->
            <sch:let name="toPointId" value="ntx:ToPointRef/@id"/>
            <sch:let name="toPointVersion" value="ntx:ToPointRef/@version"/>
            <sch:let name="toPoint" value="//RoutePoint[@id=toPointId and @version=$toPointVersion]/ntx:Location/gml:pos/text()"/>
            <!-- LineString validatie -->
            <sch:assert test="starts-with(gml:LineString/gml:posList/text(),$fromPoint)">Eerste coordinaat in de posList is niet gelijk aan het coordinaat van het FromPointRef</sch:assert>
            <sch:assert test="ends-with(gml:LineString/gml:posList/text(),$toPoint)">Laatste coordinaat in de posList is niet gelijk aan het coordinaat van het ToPointRef</sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- De TimingLinks voor een ServiceJourney die bepaald zijn via de relatie ServiceJourney > ServiceJourneyPattern > PointsInJourneyPattern > TimingLink moeten dezelfde zijn als via de relatie ServiceJourney > TimeDemandType > runTimes > JourneyRunTime > TimingLink  -->
    <sch:pattern>
        <!--        TODO-->
    </sch:pattern>

    <!-- De Distance van een RouteLinks wijkt niet meer dan x meter af van de lengte die bepaald wordt door de LineString -->
    <sch:pattern>
        <!--        TODO-->
    </sch:pattern>

    <!-- De coordinaten van een ScheduledStopPoint of TimingLink wijk niet verder dan x meter af van de RoutePoint waarop deze geprojecteerd is. -->
    <sch:pattern>
        <!--        TODO-->
    </sch:pattern>

    <!-- Elke StopPointInJourneyPattern en TimingLinkInJourneyPattern heeft een OnwardTimingLinkRef, behalve de laatste in de pointsInSequence van een ServiceJourneyPattern. -->
    <sch:pattern>
        <sch:rule context="//(ntx:ServiceJourneyPattern|ntx:DeadRunJourneyPattern)/ntx:pointsInSequence/*[last()]">
            <sch:assert test="not(ntx:OnwardTimingLinkRef)">OnwardTimingLink is niet toegestaan binnen het laatste element (StopPointInJourneyPattern of TimingLinkInJourneyPattern) in de pointInSequence</sch:assert>
        </sch:rule>
        <sch:rule context="//(ntx:ServiceJourneyPattern|ntx:DeadRunJourneyPattern)/ntx:pointsInSequence/*">
            <sch:assert test="ntx:OnwardTimingLinkRef">OnwardTimingLink is verplicht</sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- De OnwardTimingLinkRef van een ServiceJourneyPatterns en DeadRunJourneyPatterns verwijst altijd van het huidige naar het volgende ScheduledStopPointRef of TimingPointRef uit de pointsInSequence -->
    <sch:pattern>
        <!--        TODO-->
    </sch:pattern>

    <!-- Elke PointOnRoute heeft een OnwardRouteLinkRef, behalve de laatste in de pointsInSequence van een Route. -->
    <sch:pattern>
        <sch:rule context="//ntx:Route/ntx:pointsInSequence/*[last()]">
            <sch:assert test="not(ntx:OnwardRouteLinkRef)">OnwardRouteLinkRef is niet toegestaan binnen het laatste PointOnRoute in de pointInSequence</sch:assert>
        </sch:rule>
        <sch:rule context="//ntx:Route/ntx:pointsInSequence/*">
            <sch:assert test="ntx:OnwardRouteLinkRef">OnwardRouteLinkRef is verplicht</sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- De OnwardRouteLinkRef van een Route verwijst altijd van het huidige naar het volgende RoutePoint uit de pointsInSequence -->
    <sch:pattern>
        <!--        TODO-->
    </sch:pattern>

    <!-- De ScheduledStopPoints en TimingPoints van een ServiceJourney zijn geprojecteerd op de RoutePoints van de bijbehorende Route (in dezelfde volgorde). -->
    <sch:pattern>
        <!--        TODO-->
    </sch:pattern>
</sch:schema>
