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
        <sch:rule context="//(ntx:ServiceJourneyPattern|ntx:DeadRunJourneyPattern)/ntx:pointsInSequence/*[not(last())]">
            <sch:assert test="ntx:OnwardTimingLinkRef">OnwardTimingLink is verplicht</sch:assert>
        </sch:rule>
        <sch:rule context="//(ntx:ServiceJourneyPattern|ntx:DeadRunJourneyPattern)/ntx:pointsInSequence/*[last()]">
            <sch:assert test="not(ntx:OnwardTimingLinkRef)">OnwardTimingLink is niet toegestaan binnen het laatste element (StopPointInJourneyPattern of TimingLinkInJourneyPattern) in de pointInSequence</sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- De OnwardTimingLinkRef van een ServiceJourneyPatterns of DeadRunJourneyPatterns verwijst altijd van het *PointRef van de huidige *PointInJourneyPattern naar het *PointRef van de volgende *PointInJourneyPattern -->
    <sch:pattern>
        <sch:rule context="//ntx:StopPointInJourneyPattern[ntx:OnwardTimingLinkRef]">
            <!-- FromPoint -->
            <sch:let name="onwardTimingLinkId" value="ntx:OnwardTimingLinkRef/@ref"/>
            <sch:let name="onwardTimingLinkVersion" value="ntx:OnwardTimingLinkRef/@version"/>
            <sch:let name="fromPointRef" value="//ntx:TimingLink[@id=$onwardTimingLinkId and @version=$onwardTimingLinkVersion]/ntx:FromPointRef/@ref"/>
            <sch:let name="fromPointVersion" value="//ntx:TimingLink[@id=$onwardTimingLinkId and @version=$onwardTimingLinkVersion]/ntx:FromPointRef/@version"/>
            <sch:let name="toPointRef" value="//ntx:TimingLink[@id=$onwardTimingLinkId and @version=$onwardTimingLinkVersion]/ntx:ToPointRef/@ref"/>
            <sch:let name="toPointVersion" value="//ntx:TimingLink[@id=$onwardTimingLinkId and @version=$onwardTimingLinkVersion]/ntx:ToPointRef/@version"/>
            <sch:assert test="ntx:ScheduledStopPointRef[@ref=$fromPointRef and @version=$fromPointVersion]">ScheduledStopPointRef verwijst niet naar dezelfde TimingPoint als de FromPointRef van de OnwardTimingLink</sch:assert>
            <sch:assert test="following-sibling::*[1]/(ntx:ScheduledStopPointRef|ntx:TimingPointRef)[@ref=$toPointRef and @version=$toPointVersion]">ScheduledStopPointRef (of TimingPointRef) van het volgende PointOnTiming verwijst niet naar dezelfde TimingPoint als de ToPointRef van de OnwardTimingLink</sch:assert>
        </sch:rule>
        <sch:rule context="//ntx:TimingPointInJourneyPattern[ntx:OnwardTimingLinkRef]">
            <!-- FromPoint -->
            <sch:let name="onwardTimingLinkId" value="ntx:OnwardTimingLinkRef/@ref"/>
            <sch:let name="onwardTimingLinkVersion" value="ntx:OnwardTimingLinkRef/@version"/>
            <sch:let name="fromPointRef" value="//ntx:TimingLink[@id=$onwardTimingLinkId and @version=$onwardTimingLinkVersion]/ntx:FromPointRef/@ref"/>
            <sch:let name="fromPointVersion" value="//ntx:TimingLink[@id=$onwardTimingLinkId and @version=$onwardTimingLinkVersion]/ntx:FromPointRef/@version"/>
            <sch:let name="toPointRef" value="//ntx:TimingLink[@id=$onwardTimingLinkId and @version=$onwardTimingLinkVersion]/ntx:ToPointRef/@ref"/>
            <sch:let name="toPointVersion" value="//ntx:TimingLink[@id=$onwardTimingLinkId and @version=$onwardTimingLinkVersion]/ntx:ToPointRef/@version"/>
            <sch:assert test="ntx:TimingPointRef[@ref=$fromPointRef and @version=$fromPointVersion]">TimingPointRef verwijst niet naar dezelfde TimingPoint als de FromPointRef van de OnwardTimingLink</sch:assert>
            <sch:assert test="following-sibling::*[1]/(ntx:ScheduledStopPointRef|ntx:TimingPointRef)[@ref=$toPointRef and @version=$toPointVersion]">TimingPointRef van het volgende PointOnTiming verwijst niet naar dezelfde TimingPoint als de ToPointRef van de OnwardTimingLink</sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- Elke PointOnRoute heeft een OnwardRouteLinkRef, behalve de laatste in de pointsInSequence van een Route. -->
    <sch:pattern>
        <sch:rule context="//ntx:Route/ntx:pointsInSequence/*[not(last())]">
            <sch:assert test="ntx:OnwardRouteLinkRef">OnwardRouteLinkRef is verplicht</sch:assert>
        </sch:rule>
        <sch:rule context="//ntx:Route/ntx:pointsInSequence/*[last()]">
            <sch:assert test="not(ntx:OnwardRouteLinkRef)">OnwardRouteLinkRef is niet toegestaan binnen het laatste PointOnRoute in de pointInSequence</sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- De OnwardRouteLinkRef van een Route verwijst altijd van het RoutePointRef van de huidige PointOnRoute naar het RoutePointRef van het eerstvolgende PointOnRoute -->
    <sch:pattern>
        <sch:rule context="//ntx:PointOnRoute[ntx:OnwardRouteLinkRef]">
            <!-- FromPoint -->
            <sch:let name="onwardRouteLinkId" value="ntx:OnwardRouteLinkRef/@ref"/>
            <sch:let name="onwardRouteLinkVersion" value="ntx:OnwardRouteLinkRef/@version"/>
            <sch:let name="fromPointRef" value="//ntx:RouteLink[@id=$onwardRouteLinkId and @version=$onwardRouteLinkVersion]/ntx:FromPointRef/@ref"/>
            <sch:let name="fromPointVersion" value="//ntx:RouteLink[@id=$onwardRouteLinkId and @version=$onwardRouteLinkVersion]/ntx:FromPointRef/@version"/>
            <sch:let name="toPointRef" value="//ntx:RouteLink[@id=$onwardRouteLinkId and @version=$onwardRouteLinkVersion]/ntx:ToPointRef/@ref"/>
            <sch:let name="toPointVersion" value="//ntx:RouteLink[@id=$onwardRouteLinkId and @version=$onwardRouteLinkVersion]/ntx:ToPointRef/@version"/>
            <sch:assert test="ntx:RoutePointRef[@ref=$fromPointRef and @version=$fromPointVersion]">RoutePointRef verwijst niet naar dezelfde RoutePoint als de FromPointRef van de OnwardTimingLink</sch:assert>
            <sch:assert test="following-sibling::*[1]/ntx:RoutePointRef[@ref=$toPointRef and @version=$toPointVersion]">RoutePointRef van het volgende PointOnRoute verwijst niet naar dezelfde RoutePoint als de ToPointRef van de OnwardTimingLink</sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- De ScheduledStopPoints en TimingPoints van een ServiceJourney zijn geprojecteerd op de RoutePoints van de bijbehorende Route (in dezelfde volgorde). -->
    <sch:pattern>
        <!--        TODO-->
    </sch:pattern>
</sch:schema>
