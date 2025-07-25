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

    <!-- Validatie van de CompositeFrame met daarin de dienstregelinggegevens -->
    <sch:pattern id="CompositeFrame">
        <sch:rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_DOVA_LISTS']">
            <sch:assert test="ntx:FrameDefaults">FrameDefaults is verplicht</sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:include href="PublicationDelivery/CompositeFrame/Codespace.sch"/>

    <sch:pattern id="CompositeFrame-FrameDefaults">
        <sch:rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_DOVA_LISTS']/ntx:FrameDefaults">
            <sch:assert test="ntx:DefaultCodespaceRef/@ref='NL:BISON:Codespace:DOVA'">FrameDefaults/DefaultCodespaceRef is verplicht en moet gelijk zijn aan 'NL:BISON:Codespace:DOVA'</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="CompositeFrame-frames">
        <sch:rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_DOVA_LISTS']/ntx:frames">
            <sch:assert test=".[count(ntx:GeneralFrame/ntx:TypeOfFrameRef[@ref='NL:BISON:TypeOfFrame:NL_TariffZoneList'])=1]">Er moet exact 1 GeneralFrame (van type 'NL:BISON:TypeOfFrame:NL_TariffZoneList') worden geleverd als onderdeel van de BISON enumerations export</sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:pattern id="GeneralFrame">
        <sch:rule context="ntx:GeneralFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TariffZoneList']">
            <sch:assert test="ntx:Description">Description is verplicht</sch:assert>
            <sch:assert test="ntx:members">members is verplicht</sch:assert>
            <sch:assert test="ntx:members/ntx:TariffZone">members/TariffZone is verplicht</sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:include href="PublicationDelivery/CompositeFrame/GeneralFrame/TariffZone.sch"/>

</sch:schema>

