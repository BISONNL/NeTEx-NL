<sch:pattern id="ResourceFrame-ResponsibilitySet" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE']/ntx:responsibilitySets/ntx:ResponsibilitySet">
        <sch:assert test="ntx:roles/ntx:ResponsibilityRoleAssignment">ResponsibilityRoleAssignment is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>