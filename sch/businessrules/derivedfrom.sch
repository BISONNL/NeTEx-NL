<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="ntx" uri="http://www.netex.org.uk/netex"/>
    <sch:ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>

    <!-- Voor omleidingsritten mag verwezen worden naar de 'originele rit' middels de attributen derivedFromObjectRef en derivedFromVersionRef. -->
    <!-- Het is echter niet toegestaan om op deze manier te nesten (d.w.z. van rit A naar rit B verwijzen en van rit B naar rit C verwijzen). -->
    <sch:pattern id="derivedFrom">
        <sch:rule context="//ntx:ServiceJourney[@derivedFromObjectRef and @derivedFromVersionRef]">
            <sch:let name="derivedFromObjectRef" value="@derivedFromObjectRef"/>
            <sch:let name="derivedFromVersionRef" value="@derivedFromVersionRef"/>
            <sch:assert test="//ntx:ServiceJourney[@id=$derivedFromObjectRef and @version=$derivedFromVersionRef and not(@derivedFromObjectRef) and not(@derivedFromVersionRef)]">Met derivedFromObjectRef en derivedFromVersionRef mag niet verwezen worden naar een ServiceJourney die zelf ook weer verwijst naar een ServiceJourney (nesten is niet toegestaan).</sch:assert>
        </sch:rule>
        <sch:rule context="//ntx:ServiceJourney[@derivedFromObjectRef and not(@derivedFromVersionRef)]">
            <sch:let name="derivedFromObjectRef" value="@derivedFromObjectRef"/>
            <sch:let name="derivedFromVersionRef" value="@version"/>
            <sch:assert test="//ntx:ServiceJourney[@id=$derivedFromObjectRef and @version=$derivedFromVersionRef and not(@derivedFromObjectRef) and not(@derivedFromVersionRef)]">Met derivedFromObjectRef mag niet verwezen worden naar een ServiceJourney die zelf ook weer verwijst naar een ServiceJourney (nesten is niet toegestaan).</sch:assert>
        </sch:rule>
        <sch:rule context="//ntx:ServiceJourney[not(@derivedFromObjectRef) and @derivedFromVersionRef]">
            <sch:let name="derivedFromObjectRef" value="@id"/>
            <sch:let name="derivedFromVersionRef" value="@derivedFromVersionRef"/>
            <sch:assert test="//ntx:ServiceJourney[@id=$derivedFromObjectRef and @version=$derivedFromVersionRef and not(@derivedFromObjectRef) and not(@derivedFromVersionRef)]">Met derivedFromVersionRef mag niet verwezen worden naar een ServiceJourney die zelf ook weer verwijst naar een ServiceJourney (nesten is niet toegestaan).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>
