<sch:pattern id="DRG.ResourceFrame.OperationalContext" xmlns:sch="http://purl.oclc.org/dsdl/schematron" >
    <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE']/ntx:operationalContexts/ntx:OperationalContext">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:VehicleMode/text()!=''">VehicleMode is verplicht</sch:assert>

        <!-- Other business rules -->

        <!-- A -->
        <sch:assert test="normalize-space(ntx:VehicleMode)=('unknown','all','bus','metro','tram','rail','water')">Het NL-profiel ondersteunt alleen de volgende waardes voor VehicleMode: unknown | all | bus | metro | tram | rail | water</sch:assert>

        <!-- B -->
        <sch:assert test="(normalize-space(ntx:VehicleMode)=('unknown','all','bus','metro','tram','rail','water') and not(ntx:TransportSubMode)) or
                          (normalize-space(ntx:VehicleMode)='bus' and normalize-space(ntx:TransportSubMode)=('localBus','regionalBus','expressBus','nightBus','mobilityBus','shuttleBus','highFrequencyBus','schoolBus','schoolAndPublicServiceBus','railReplacementBus','demandAndResponseBus','unknown','undefined')) or
                          (normalize-space(ntx:VehicleMode)='metro' and normalize-space(ntx:TransportSubMode)=('metro','urbanRailway','unknown','undefined')) or
                          (normalize-space(ntx:VehicleMode)='tram' and normalize-space(ntx:TransportSubMode)=('cityTram','localTram','regionalTram','trainTram','unknown','undefined')) or
                          (normalize-space(ntx:VehicleMode)='rail' and normalize-space(ntx:TransportSubMode)=('local','highSpeedRail','suburbanRailway','regionalRail','longDistance','international','specialTrain','unknown','undefined')) or
                          (normalize-space(ntx:VehicleMode)='water' and normalize-space(ntx:TransportSubMode)=('localCarFerry','localPassengerFerry','riverBus','unknown','undefined'))
">De TransportSubMode matcht niet bij de opgegeven VehicleMode</sch:assert>

    </sch:rule>
</sch:pattern>