<sch:pattern id="DRG.VehicleScheduleFrame.Block" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:VehicleScheduleFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_VEHICLE']/ntx:blocks/ntx:Block">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:Name">Name is verplicht</sch:assert>
        <sch:assert test="ntx:privateCodes/ntx:PrivateCode[@type='BlockCode']">PrivateCode van type 'BlockCode' is verplicht</sch:assert>
        <sch:assert test="ntx:journeys[count(*)>0]">Journeys moet minimaal 1 DeadRunRef of ServiceJourneyRef bevatten</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <sch:assert test="ntx:privateCodes/ntx:PrivateCode[@type='BlockCode']">PrivateCode van type 'BlockCode' is verplicht</sch:assert>

        <!-- B -->
        <!-- Ritten komen slechts één keer voor in een Block. -->

        <!-- C -->
        <!-- Ritten komen in maximaal één Block voor. -->

        <!-- D -->
        <!-- Is voor een Block een VehicleTypeRef gedefinieerd. -->
    </sch:rule>
</sch:pattern>
