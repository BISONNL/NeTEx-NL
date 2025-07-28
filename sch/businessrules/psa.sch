<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="ntx" uri="http://www.netex.org.uk/netex"/>
    <sch:ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>

    <!-- Elke ScheduledStopPoint (met een UserStopCode) moet gekoppeld zijn aan een Quay uit het CHB, middels een PassengerStopAssignment element -->
    <sch:pattern id="PassengerStopAssignment-voor-elke-ScheduledStopPoint">
        <sch:rule context="//ntx:ScheduledStopPoint[ntx:privateCodes/ntx:PrivateCode[@type='UserStopCode']]">
            <sch:let name="ssp_id" value="@id"/>
            <sch:assert test="//ntx:PassengerStopAssignment[ntx:ScheduledStopPointRef/@ref=$ssp_id]/ntx:QuayRef[matches(@ref,'^NL:CHB:Quay:\d{8}$')]">Geen PassengerStopAssignment gevonden die deze ScheduledStopPoint koppelt aan een Quay uit het Centraal Haltebestand.</sch:assert>
        </sch:rule>
    </sch:pattern>

</sch:schema>
