<sch:pattern id="ResourceFrame-VehicleType" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE' or ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE']/ntx:vehicleTypes/ntx:VehicleType">
        <sch:assert test="ntx:Name/text()!=''">Name is verplicht</sch:assert>
        <sch:assert test="ntx:Description/text()!=''">Description is verplicht</sch:assert>
        <sch:assert test="ntx:FuelType/text()!=''">FuelType is verplicht</sch:assert>
        <sch:assert test="ntx:TransportMode/text()!=''">TransportMode is verplicht</sch:assert>
        <sch:assert test="ntx:LowFloor/text()!=''">LowFloor is verplicht</sch:assert>
        <sch:assert test="ntx:HasLiftOrRamp/text()!=''">HasLiftOrRamp is verplicht</sch:assert>
        <sch:assert test="ntx:Length/text()!=''">Length is verplicht</sch:assert>
        <sch:assert test="ntx:facilities/text()!=''">facilities is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>
