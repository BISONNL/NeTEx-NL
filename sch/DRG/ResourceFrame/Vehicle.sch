<sch:pattern id="DRG.ResourceFrame.Vehicle" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE']/ntx:vehicles/ntx:Vehicle">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:ValidBetween">ValidBetween is verplicht</sch:assert>
        <sch:assert test="ntx:OperationalNumber">OperationalNumber is verplicht</sch:assert>
        <sch:assert test="ntx:VehicleTypeRef">VehicleTypeRef is verplicht</sch:assert>

        <!-- Other business rules -->
    </sch:rule>
</sch:pattern>
