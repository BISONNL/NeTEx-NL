<sch:pattern id="concessiegebonden-vervoer" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <!-- Concessiegebonden (§4.1): de responsibilitySetRef verwijst naar een ResponsibilitySet met een DOVA-concessiezone -->
    <sch:rule context="ntx:Line[@responsibilitySetRef = //ntx:ResponsibilitySet[ntx:roles/ntx:ResponsibilityRoleAssignment/ntx:ResponsibleAreaRef[starts-with(@ref, 'NL:DOVA:TransportAdministrativeZone:')]]/@id]">
        <sch:assert test="starts-with(ntx:AuthorityRef/@ref, 'NL:DOVA:Authority:')">Een Line-element voor concessiegebonden vervoer moet een AuthorityRef hebben die verwijst naar een Authority uit de DOVA-lijsten</sch:assert>
    </sch:rule>
</sch:pattern>
