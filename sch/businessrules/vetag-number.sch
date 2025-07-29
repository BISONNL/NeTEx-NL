<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="ntx" uri="http://www.netex.org.uk/netex"/>
    <sch:ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>

    <!-- Controleert of voor een lijn een VetagNumber is opgegeven -->
    <sch:pattern id="vetag-number">
        <sch:rule context="//ntx:Line">
            <sch:assert test="ntx:ExternalLineRef[@type='VetagLineNumber' and @ref!='']">ExternalLineRef met type="VetagLineNumber" is verplicht (t.b.v. verwerking tot KV7)</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>
