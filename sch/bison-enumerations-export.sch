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

    <!-- Validatie van de CompositeFrame met daarin de voorgedefinieerde elementen -->
    <sch:pattern id="CompositeFrame">
        <sch:rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_BISON_ENUMS']">
            <sch:assert test="ntx:FrameDefaults">FrameDefaults is verplicht</sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:include href="PublicationDelivery/CompositeFrame/Codespace.sch"/>

    <sch:pattern id="CompositeFrame-FrameDefaults">
        <sch:rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_BISON_ENUMS']/ntx:FrameDefaults">
            <sch:assert test="ntx:DefaultCodespaceRef/@ref='NL:BISON:Codespace:BISON'">FrameDefaults/DefaultCodespaceRef is verplicht en moet gelijk zijn aan 'NL:BISON:Codespace:BISON'</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="CompositeFrame-frames">
        <sch:rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_BISON_ENUMS']/ntx:frames">
            <sch:assert test=".[count(ntx:GeneralFrame/ntx:TypeOfFrameRef[@ref='NL:BISON:TypeOfFrame:NL_TypeOfEquipmentValues'])=1]">Er moet exact 1 GeneralFrame (van type 'NL:BISON:TypeOfFrame:NL_TypeOfEquipmentValues') worden geleverd als onderdeel van de BISON enumerations export</sch:assert>
            <sch:assert test=".[count(ntx:GeneralFrame/ntx:TypeOfFrameRef[@ref='NL:BISON:TypeOfFrame:NL_TypeOfActivationValues'])=1]">Er moet exact 1 GeneralFrame (van type 'NL:BISON:TypeOfFrame:NL_TypeOfActivationValues') worden geleverd als onderdeel van de BISON enumerations export</sch:assert>
            <sch:assert test=".[count(ntx:GeneralFrame/ntx:TypeOfFrameRef[@ref='NL:BISON:TypeOfFrame:NL_TypeOfServiceValues'])=1]">Er moet exact 1 GeneralFrame (van type 'NL:BISON:TypeOfFrame:NL_TypeOfServiceValues') worden geleverd als onderdeel van de BISON enumerations export</sch:assert>
            <sch:assert test=".[count(ntx:GeneralFrame/ntx:TypeOfFrameRef[@ref='NL:BISON:TypeOfFrame:NL_TechnicalEnumerations'])>1]">Er moet meer dan 1 GeneralFrame (van type 'NL:BISON:TypeOfFrame:NL_TechnicalEnumerations') worden geleverd als onderdeel van de BISON enumerations export</sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:pattern id="NL_TypeOfActivationValues">
        <sch:rule context="ntx:GeneralFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TypeOfActivationValues']">
            <sch:assert test="ntx:Description">Description is verplicht</sch:assert>
            <sch:assert test="ntx:members">members is verplicht</sch:assert>
            <sch:assert test="ntx:members/ntx:ValueSet/ntx:values/ntx:TypeOfActivation">members/ValueSet/values/TypeOfActivation is verplicht</sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:include href="PublicationDelivery/CompositeFrame/GeneralFrame/TypeOfActivation.sch"/>

    <sch:pattern id="NL_TypeOfEquipmentValues">
        <sch:rule context="ntx:GeneralFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TypeOfEquipmentValues']">
            <sch:assert test="ntx:Description">Description is verplicht</sch:assert>
            <sch:assert test="ntx:members">members is verplicht</sch:assert>
            <sch:assert test="ntx:members/ntx:ValueSet/ntx:values/ntx:TypeOfEquipment">members/ValueSet/values/TypeOfEquipment is verplicht</sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:include href="PublicationDelivery/CompositeFrame/GeneralFrame/TypeOfEquipment.sch"/>

    <sch:pattern id="NL_TypeOfServiceValues">
        <sch:rule context="ntx:GeneralFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TypeOfServiceValues']">
            <sch:assert test="ntx:Description">Description is verplicht</sch:assert>
            <sch:assert test="ntx:members">members is verplicht</sch:assert>
            <sch:assert test="ntx:members/ntx:ValueSet/ntx:values/ntx:TypeOfService">members/ValueSet/values/TypeOfService is verplicht</sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:include href="PublicationDelivery/CompositeFrame/GeneralFrame/TypeOfService.sch"/>

    <sch:pattern id="NL_TechnicalEnumerations">
        <sch:rule context="ntx:GeneralFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TechnicalEnumerations']">
            <sch:assert test="ntx:Description">Description is verplicht</sch:assert>
            <sch:assert test="ntx:members">members is verplicht</sch:assert>
            <sch:assert test="ntx:members/ntx:ValueSet/ntx:values/ntx:TypeOfResponsibilityRole or ntx:members/ntx:ValueSet/ntx:values/ntx:TypeOfEntity or ntx:members/ntx:ValueSet/ntx:values/ntx:TypeOfFrame">members/ValueSet/values/TypeOfResponsibilityRole of members/ValueSet/values/TypeOfFrame is verplicht</sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:include href="PublicationDelivery/CompositeFrame/GeneralFrame/TypeOfResponsibilityRole.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/GeneralFrame/DisplayTextLength.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/GeneralFrame/TypeOfFrame.sch"/>
</sch:schema>

