<sch:pattern id="DRG.ResourceFrame.ServiceFacilitySet" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ResourceFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:ServiceFacilitySet">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->

        <!-- Other business rules -->
        <!-- A -->
        <sch:assert test="matches(normalize-space(ntx:PassengerCommsFacilityList), '^(powerSupplySockets|freeWifi)$')">Het NL-profiel ondersteunt alleen de volgende waardes voor PassengerCommsFacilityList: powerSupplySockets | freeWifi</sch:assert>

        <!-- B -->
        <sch:assert test="matches(normalize-space(ntx:SanitaryFacilityList), '^(toilet|wheelchairAccessToilet)$')">Het NL-profiel ondersteunt alleen de volgende waardes voor SanitaryFacilityList: toilet | wheelchairAccessToilet</sch:assert>

        <!-- C -->
        <sch:assert test="matches(normalize-space(ntx:TicketingServiceFacilityList), '^(collection)$')">Het NL-profiel ondersteunt alleen de volgende waardes voor TicketingServiceFacilityList: collection</sch:assert>

        <!-- D -->
        <sch:assert test="matches(normalize-space(ntx:VehicleAccessFacilityList), '^(wheelchairLift|manualRamp|automaticRamp|steps|slidingStep|narrowEntrance|validator)$')">Het NL-profiel ondersteunt alleen de volgende waardes voor VehicleAccessFacilityList: wheelchairLift | manualRamp | automaticRamp | steps | slidingStep | narrowEntrance | validator</sch:assert>
    </sch:rule>
</sch:pattern>
