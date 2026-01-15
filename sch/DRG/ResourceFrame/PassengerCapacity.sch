<sch:pattern id="DRG.ResourceFrame.OperationalContext" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE']/ntx:OperationalContext">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:Name/text()!=''">Name is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <sch:assert test="matches(normalize-space(/ntx:VehicleMode), [petrol|diesel|naturalGas|biodiesel|electricity|hydrogen|other])">
            Het NL-profiel ondersteunt alleen de volgende waardes voor FuelType: petrol | diesel | naturalGas | biodiesel | electricity | hydrogen | other
        </sch:assert>

        <!-- B -->
        <assert test="number(normalize-space(ntx:TotalCapacity)) = number(normalize-space(ntx:SeatingCapacity)) + number(normalize-space(ntx:StandingCapacity))">
            TotalCapacity moet gelijk zijn aan SeatingCapacity plus StandingCapacity
        </assert>

    </sch:rule>
</sch:pattern>
