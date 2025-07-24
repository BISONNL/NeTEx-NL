<sch:pattern id="NoTimeAndTimezones" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="(ntx:PublicationTimestamp)">
        <sch:assert test=".[matches(text(), '^20[2-9]\d\-(0[0-9]|1[012])\-([0-2][0-9]|3[01])T[012][0-9]:[0-5][0-9]:[0-5][0-9](\.\d+)?$')]">PublicationTimestamp mag geen tijdzone specificeren</sch:assert>
    </sch:rule>
    <sch:rule context="(ntx:FromDate|ntx:ToDate)">
        <sch:assert test=".[matches(text(), '^20[2-9]\d\-(0[0-9]|1[012])\-([0-2][0-9]|3[01])T00:00:00(\.0+)?$')]">Om verwarring te voorkomen, moet in elementen van het type xs:dateTime (binnen ValidBetween en AvailabilityCondition) de tijd op 00:00:00 worden gesteld, en mag geen tijdzone worden opgegeven. Dit omdat hier enkel een operationele dag wordt aangeven.</sch:assert>
    </sch:rule>
</sch:pattern>
