<sch:pattern id="DRG.ResourceFrame.PassengerCapacity" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE']/ntx:vehicleTypes/ntx:VehicleType/ntx:capacities/ntx:PassengerCapacity">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->

        <!-- Other business rules -->
        <!-- A -->
        <!-- TODO: Original rule incorrectly validated VehicleMode against FuelType values - needs review -->

        <!-- B -->
        <sch:assert test="number(normalize-space(ntx:TotalCapacity)) = number(normalize-space(ntx:SeatingCapacity)) + number(normalize-space(ntx:StandingCapacity))">
            TotalCapacity moet gelijk zijn aan SeatingCapacity plus StandingCapacity
        </sch:assert>

    </sch:rule>
</sch:pattern>
