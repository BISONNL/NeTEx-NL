<sch:pattern id="DRG.ResourceFrame.TransportAdministrativeZone" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ResourceFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:zones/ntx:TransportAdministrativeZone">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:ShortName/text()!=''">ShortName is verplicht</sch:assert>

        <!-- Other business rules -->
    </sch:rule>
</sch:pattern>