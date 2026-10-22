<sch:pattern id="DRG.VehicleScheduleFrame.Block" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:VehicleScheduleFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_VEHICLE']/ntx:blocks/ntx:Block">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:Name">Name is verplicht</sch:assert>
        <sch:assert test="ntx:privateCodes/ntx:PrivateCode[@type='BlockCode']">PrivateCode van type 'BlockCode' is verplicht</sch:assert>
        <sch:assert test="ntx:journeys[count(*)>0]">Journeys moet minimaal 1 DeadRunRef of ServiceJourneyRef bevatten</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <sch:assert test="ntx:privateCodes/ntx:PrivateCode[@type='BlockCode']/text()!=''">De waarde van PrivateCode van type 'BlockCode' mag niet leeg zijn</sch:assert>

        <!-- B: Ritten komen slechts één keer voor in een Block -->
        <sch:assert test="count(ntx:journeys/*//@ref) = count(distinct-values(ntx:journeys/*//@ref))">
            Ritten komen slechts één keer voor in een Block
        </sch:assert>

        <!-- C: Ritten komen in maximaal één Block voor -->
        <sch:assert test="not(ntx:journeys/*/@ref[. = current()/preceding-sibling::ntx:Block/ntx:journeys/*/@ref])">
            Een rit mag in maximaal één Block voorkomen
        </sch:assert>

        <!-- D: VehicleTypeRef is verplicht -->
        <sch:assert test="ntx:VehicleTypeRef">VehicleTypeRef is verplicht voor een Block</sch:assert>
    </sch:rule>
</sch:pattern>
