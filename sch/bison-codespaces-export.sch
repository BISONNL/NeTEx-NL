<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://purl.oclc.org/dsdl/schematron">
    <!-- Namespaces used in NeTEx NL -->
    <sch:ns prefix="ntx" uri="http://www.netex.org.uk/netex"/>
    <sch:ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>

    <!-- Algemene business rules voor het NL-profiel -->
    <sch:include href="commons/gml.sch"/>
    <sch:include href="commons/id-naming-convention.sch"/>
    <sch:include href="commons/timestamps-and-timezones.sch"/>
    <sch:include href="commons/version-attributes.sch"/>

    <!-- Validatie van de CompositeFrame met daarin de voorgedefinieerde Codespace elementen -->
    <sch:pattern id="CompositeFrame">
        <sch:rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_CODESPACES']">
            <sch:assert test="ntx:codespaces">codespaces is verplicht</sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:include href="PublicationDelivery/CompositeFrame/Codespace.sch"/>

</sch:schema>
