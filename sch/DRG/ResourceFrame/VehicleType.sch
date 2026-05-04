<sch:pattern id="DRG.ResourceFrame.VehicleType" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE']/ntx:vehicleTypes/ntx:VehicleType">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:Name/text()!=''">Name is verplicht</sch:assert>
        <sch:assert test="ntx:Description/text()!=''">Description is verplicht</sch:assert>
        <sch:assert test="ntx:FuelType/text()!=''">FuelType is verplicht</sch:assert>
        <sch:assert test="ntx:TransportMode/text()!=''">TransportMode is verplicht</sch:assert>
        <sch:assert test="ntx:LowFloor/text()!=''">LowFloor is verplicht</sch:assert>
        <sch:assert test="ntx:HasLiftOrRamp/text()!=''">HasLiftOrRamp is verplicht</sch:assert>
        <sch:assert test="ntx:Length/text()!=''">Length is verplicht</sch:assert>
        <sch:assert test="ntx:facilities/text()!=''">facilities is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <sch:assert xmlns:sch="http://purl.oclc.org/dsdl/schematron" test="matches(normalize-space(/ntx:FuelType), '[petrol|diesel|naturalGas|biodiesel|electricity|hydrogen|other]')">Het NL-profiel ondersteunt alleen de volgende waardes voor FuelType: petrol | diesel | naturalGas | biodiesel | electricity | hydrogen | other</sch:assert>

        <!-- B -->
        <sch:assert test="/ntx:capacities[count(ntx:PassengerCapacity)=1] or /ntx:capacities[count(ntx:PassengerCapacityRef)=1]">Altijd 1 embedded PassengerCapacity element OF 1 PassengerCapacityRef verwijzing opnemen</sch:assert>
    </sch:rule>
</sch:pattern>
