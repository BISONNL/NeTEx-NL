<sch:pattern id="DRG.ResourceFrame.ServiceFacilitySet" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE']/ntx:vehicleTypes/ntx:VehicleType/ntx:facilities/ntx:ServiceFacilitySet">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="normalize-space(ntx:VehicleAccessFacilityList)!=''">VehicleAccessFacilityList is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <sch:assert test="not(ntx:PassengerCommsFacilityList) or (every $waarde in tokenize(normalize-space(ntx:PassengerCommsFacilityList), ' ') satisfies $waarde = ('powerSupplySockets', 'freeWifi'))">Het NL-profiel ondersteunt alleen de volgende waardes voor PassengerCommsFacilityList: powerSupplySockets | freeWifi</sch:assert>

        <!-- B -->
        <sch:assert test="not(ntx:SanitaryFacilityList) or (every $waarde in tokenize(normalize-space(ntx:SanitaryFacilityList), ' ') satisfies $waarde = ('toilet', 'wheelchairAccessToilet'))">Het NL-profiel ondersteunt alleen de volgende waardes voor SanitaryFacilityList: toilet | wheelchairAccessToilet</sch:assert>

        <!-- C -->
        <sch:assert test="not(ntx:TicketingServiceFacilityList) or (every $waarde in tokenize(normalize-space(ntx:TicketingServiceFacilityList), ' ') satisfies $waarde = 'collection')">Het NL-profiel ondersteunt alleen de volgende waardes voor TicketingServiceFacilityList: collection</sch:assert>

        <!-- D: unknown ontbreekt in de profieltekst, maar staat wel in VehicleAccessFacilityEnumeration en in het profielvoorbeeld bij §14.7.5 -->
        <sch:assert test="not(ntx:VehicleAccessFacilityList) or (every $waarde in tokenize(normalize-space(ntx:VehicleAccessFacilityList), ' ') satisfies $waarde = ('unknown', 'wheelchairLift', 'manualRamp', 'automaticRamp', 'steps', 'slidingStep', 'narrowEntrance', 'validator'))">Het NL-profiel ondersteunt alleen de volgende waardes voor VehicleAccessFacilityList: unknown | wheelchairLift | manualRamp | automaticRamp | steps | slidingStep | narrowEntrance | validator</sch:assert>
    </sch:rule>
</sch:pattern>
