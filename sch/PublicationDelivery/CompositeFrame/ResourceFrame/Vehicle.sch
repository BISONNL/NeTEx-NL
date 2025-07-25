<sch:pattern id="ResourceFrame-Vehicle" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE']/ntx:vehicles/ntx:Vehicle">
        <sch:assert test="ntx:ValidBetween">ValidBetween is verplicht</sch:assert>
        <sch:assert test="ntx:OperationalNumber">OperationalNumber is verplicht</sch:assert>
        <sch:assert test="ntx:VehicleTypeRef">VehicleTypeRef is verplicht</sch:assert>
    </sch:rule>
    <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE']/ntx:vehicles/ntx:Vehicle/ntx:ValidBetween">
        <sch:assert test="ntx:FromDate/text()!=''">FromDate is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>
