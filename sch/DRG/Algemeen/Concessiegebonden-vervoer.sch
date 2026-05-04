<sch:pattern id="concessiegebonden-vervoer" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <!-- Voor concessiegebonden vervoer is bij het Line element altijd een AuthorityRef verplicht. Bij OpenAccess is dit optioneel. -->
    <sch:rule context="//ntx:Line[matches(@responsibilitySetRef,'^NL:DOVA:.*')]">
        <sch:assert test="ntx:AuthorityRef[matches(text(),'^NL:DOVA:.*')]">Een Line-element voor concessiegebonden vervoer moet een AuthorityRef hebben die verwijst naar een Authority uit de DOVA-lijsten</sch:assert>
    </sch:rule>
</sch:pattern>
