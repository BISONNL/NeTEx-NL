<sch:pattern id="ResourceFrame-VehicleType-capacities" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE']/ntx:vehicleTypes/ntx:VehicleType/ntx:capacities">
        <sch:assert test=".[count(ntx:PassengerCapacity)=1] or .[count(ntx:PassengerCapacityRef)=1]">Altijd 1 embedded PassengerCapacity element OF 1 PassengerCapacityRef verwijzing opnemen</sch:assert>
    </sch:rule>
</sch:pattern>