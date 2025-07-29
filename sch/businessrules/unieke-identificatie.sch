<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="ntx" uri="http://www.netex.org.uk/netex"/>
    <sch:ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>

    <!-- Controleert of alle gedefinieerde elementen een unieke combinatie van id en version hebben. -->
    <sch:pattern id="unieke-identificatie">
        <sch:rule context="//*[@id]">
            <sch:let name="id" value="@id"/>
            <sch:let name="version" value="@version"/>
            <sch:assert test=".[local-name()='Codespace'] or @version">Een version attribuut is verplicht</sch:assert>
            <sch:assert test="count(//*[@id=$id and @version=$version])&lt;=1">Dubbele element-definitie (de combinatie id en version moet uniek zijn in de levering)</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>