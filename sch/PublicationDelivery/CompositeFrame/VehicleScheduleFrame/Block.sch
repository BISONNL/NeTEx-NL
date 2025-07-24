<sch:pattern id="VehicleScheduleFrame-Block" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:VehicleScheduleFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_VEHICLE']/ntx:blocks/ntx:Block">
        <sch:assert test="ntx:Name">Name is verplicht</sch:assert>
        <sch:assert test="ntx:privateCodes/ntx:PrivateCode[@type='BlockCode']">PrivateCode van type 'BlockCode' is verplicht</sch:assert>
        <sch:assert test="ntx:journeys[count(*)>0]">Journeys moet minimaal 1 DeadRunRef of ServiceJourneyRef bevatten</sch:assert>
    </sch:rule>
</sch:pattern>