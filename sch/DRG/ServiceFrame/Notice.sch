<sch:pattern id="DRG.ServiceFrame.Notice" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:notices/ntx:Notice">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:Text">Text is verplicht</sch:assert>

        <!-- Other business rules -->
    </sch:rule>
</sch:pattern>