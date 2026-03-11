<sch:pattern id="DRG.ResourceFrame.ResponsibilitySet" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ResourceFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:responsibilitySets/ntx:ResponsibilitySet">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:roles/ntx:ResponsibilityRoleAssignment">ResponsibilityRoleAssignment is verplicht</sch:assert>

        <!-- Other business rules -->
    </sch:rule>
</sch:pattern>