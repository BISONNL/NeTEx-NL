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

    <!-- Validatie van de CompositeFrame met daarin de voertuiggegevens -->
    <sch:pattern id="CompositeFrame">
        <sch:rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEHICLES']">
            <sch:assert test="ntx:FrameDefaults">FrameDefaults is verplicht</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="CompositeFrame-FrameDefaults">
        <sch:rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEHICLES']/ntx:FrameDefaults">
            <sch:assert test="ntx:DefaultCodespaceRef">FrameDefaults/DefaultCodespaceRef is verplicht</sch:assert>
            <sch:assert test="not(ntx:DefaultSystemOfUnits) or ntx:DefaultSystemOfUnits='SiMetres'">FrameDefaults/DefaultSystemOfUnits is optioneel, maar moet de waarde 'SiMetres' hebben, indien aangeleverd</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="CompositeFrame-frames">
        <sch:rule context="ntx:CompositeFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEHICLES']/ntx:frames">
            <sch:assert test="ntx:ResourceFrame/ntx:TypeOfFrameRef[count(@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE')=1]">Er moet exact 1 ResourceFrame (van type 'NL:BISON:TypeOfFrame:NL_VEH_RESOURCE') worden geleverd als onderdeel van de voertuigenexport</sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- Validatie van de ResourceFrame -->
    <sch:pattern id="ResourceFrame">
        <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_VEH_RESOURCE']">
            <sch:assert test="ntx:dataSources[count(ntx:DataSource)=1]">Er moet exact 1 DataSource worden gegeven</sch:assert>
            <sch:assert test="ntx:organisations[count(ntx:Operator)&gt;0]">Er moet minimaal 1 Operator worden gegeven</sch:assert>
            <sch:assert test="ntx:vehicleTypes[count(ntx:VehicleType)&gt;0]">Er moet minimaal 1 VehicleType worden gegeven</sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:include href="PublicationDelivery/CompositeFrame/resourceframe/DataSource.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/resourceframe/ResponsibilitySet.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/resourceframe/Branding.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/resourceframe/TypeOfProductCategory.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/resourceframe/Operator.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/resourceframe/Authority.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/resourceframe/OperationalContext.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/resourceframe/VehicleType.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/resourceframe/VehicleType-capacities.sch"/>
    <sch:include href="PublicationDelivery/CompositeFrame/resourceframe/Vehicle.sch"/>
</sch:schema>
