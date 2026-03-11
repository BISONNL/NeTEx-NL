<sch:pattern id="DRG.ServiceFrame.StopArea" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:stopAreas/ntx:StopArea">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:Name">Name is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <sch:assert test="ntx:privateCodes/ntx:PrivateCode[@type='UserStopAreaCode']/text()!=''">De waarde van de PrivateCode van type 'UserStopAreaCode' mag niet leeg zijn</sch:assert>
    </sch:rule>
</sch:pattern>