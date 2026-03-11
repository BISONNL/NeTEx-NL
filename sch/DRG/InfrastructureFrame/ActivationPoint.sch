<sch:pattern id="DRG.InfrastructureFrame.ActivationPoint" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:InfrastructureFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:activationPoints/ntx:ActivationPoint">

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:TypeOfActivationRef">TypeOfActivationRef is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <sch:assert test="ntx:privateCodes/ntx:PrivateCode[@type='KarAddress']">PrivateCode van type 'KarAddress' is verplicht</sch:assert>

    </sch:rule>
</sch:pattern>