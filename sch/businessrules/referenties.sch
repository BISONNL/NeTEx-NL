<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="ntx" uri="http://www.netex.org.uk/netex"/>
    <sch:ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>

    <!-- Elke element waaraan gerefereerd wordt moet bestaan in de levering zelf, m.u.v. referenties naar elementen in de codespaces NL:BISON, NL:DOVA en NL:CHB -->
    <sch:pattern id="referenties">
        <!-- Eerst twee validatieregels zonder asserts, waardoor er geen fouten optreden voor elementen van het type ExternalLineRef of verwijzingen naar BISON-enumeraties, DOVA-lijsten of CHB (alleen de eerste rule binnen een pattern die matcht met een element wordt uitgevoerd) -->
        <sch:rule context="//ntx:ExternalLineRef"/>
        <sch:rule context="//*[matches(@ref, '^NL:(BISON|DOVA|CHB):.*$')]"/>

        <!-- De werkelijke validatieregels: -->
        <sch:rule context="//*[@ref and @version and @nameOfRefClass]">
            <sch:let name="ref" value="@ref"/>
            <sch:let name="version" value="@version"/>
            <sch:let name="nameOfRefClass" value="@nameOfRefClass"/>
            <sch:assert test="//*[@id=$ref and (@version=$version or $version='any') and local-name()=$nameOfRefClass]">Er is geen element gedefinieerd in de levering met deze id en version, of deze is niet van het verwachte type</sch:assert>
        </sch:rule>
        <sch:rule context="//*[@ref and @version]">
            <sch:let name="ref" value="@ref"/>
            <sch:let name="version" value="@version"/>
            <sch:assert test="//*[@id=$ref and (@version=$version or $version='any')]">Er is geen element gedefinieerd in de levering met deze id en version</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>
