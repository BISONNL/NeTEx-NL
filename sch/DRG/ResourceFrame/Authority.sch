<sch:pattern id="DRG.ResourceFrame.Authority" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ResourceFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:organisations/ntx:Authority">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:Name/text()!=''">Name is verplicht</sch:assert>
        <sch:assert test="ntx:ShortName/text()!=''">ShortName is verplicht</sch:assert>

        <!-- Other business rules -->

    </sch:rule>
</sch:pattern>