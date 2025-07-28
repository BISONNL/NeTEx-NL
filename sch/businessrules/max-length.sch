<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="ntx" uri="http://www.netex.org.uk/netex"/>
    <sch:ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>

    <!-- Een tekst voor een DestinationDisplayVariant mag niet langer zijn dan de opgegeven MaxLength voor deze variant. -->
    <sch:pattern id="max-length">
        <sch:rule context="//ntx:DestinationDisplayVariant[ntx:Extensions/ntx:MaxLength[matches(text(),'^BISON:DisplayTextLength:.*$')]]">
            <sch:let name="max-length" value="number(substring(ntx:Extensions/ntx:MaxLength/text(),string-length('BISON:DisplayTextLength:')+1))"/>
            <sch:assert test="string-length(ntx:Name/text())&lt;=$max-length">Tekst is langer dan opgegeven maximale lengte</sch:assert>
            <sch:assert test="string-length(ntx:vias/ntx:Via/ntx:Name/text())&lt;=$max-length">Tekst is langer dan opgegeven maximale lengte</sch:assert>
        </sch:rule>
    </sch:pattern>

</sch:schema>
