<sch:pattern id="DRG.CompositeFrame.FrameDefaults" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <!-- Meegeleverde centrale CompositeFrames (BISON, DOVA) vallen onder hun eigen export-schema -->
    <sch:rule context="ntx:CompositeFrame[not(ntx:TypeOfFrameRef/@ref = ('NL:BISON:TypeOfFrame:NL_BISON_ENUMS', 'NL:BISON:TypeOfFrame:NL_DOVA_LISTS', 'NL:BISON:TypeOfFrame:NL_CODESPACES'))]/ntx:FrameDefaults">
        <!-- Cardinality and data-type constraints -->
        <sch:assert test="normalize-space(ntx:DefaultCodespaceRef/@ref)!=''">DefaultCodespaceRef is verplicht</sch:assert>
        <sch:assert test="normalize-space(ntx:DefaultDataSourceRef/@ref)!=''">DefaultDataSourceRef is verplicht</sch:assert>
        <sch:assert test="normalize-space(ntx:DefaultResponsibilitySetRef/@ref)!=''">DefaultResponsibilitySetRef is verplicht</sch:assert>
        <sch:assert test="ntx:DefaultLocale/ntx:TimeZone/text()!=''">DefaultLocale/TimeZone is verplicht</sch:assert>
        <sch:assert test="ntx:DefaultLocationSystem/text()!=''">DefaultLocationSystem is verplicht</sch:assert>
        <sch:assert test="ntx:DefaultSystemOfUnits/text()!=''">DefaultSystemOfUnits is verplicht</sch:assert>
        <sch:assert test="ntx:DefaultCurrency/text()!=''">DefaultCurrency is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <sch:assert test="matches(ntx:DefaultCodespaceRef/@ref, 'NL:BISON:')">
            DefaultCodespaceRef verwijst naar een voorgedefinieerde Codespace
        </sch:assert>

        <!-- B: DefaultResponsibilitySetRef verwijst naar een ResponsibilitySet met een ResponsibilityRoleAssignment
             die verwijst naar het enige TransportAdministrativeZone binnen dit CompositeFrame -->
        <sch:assert test="//ntx:ResponsibilitySet[@id=current()/ntx:DefaultResponsibilitySetRef/@ref]/ntx:roles/ntx:ResponsibilityRoleAssignment/ntx:ResponsibleAreaRef/@ref = //ntx:TransportAdministrativeZone/@id">
            DefaultResponsibilitySetRef moet verwijzen naar een ResponsibilitySet met een ResponsibilityRoleAssignment die verwijst naar de TransportAdministrativeZone
        </sch:assert>

        <!-- C -->
        <sch:assert test="ntx:DefaultLocale/ntx:TimeZone='Europe/Amsterdam'">
            DefaultLocale/TimeZone moet de waarde 'Europe/Amsterdam' hebben.
        </sch:assert>

        <!-- D -->
        <sch:assert test="normalize-space(ntx:DefaultLocationSystem)='EPSG:4326'">
            DefaultLocationSystem moet de waarde 'EPSG:4326' hebben.
        </sch:assert>

        <!-- E -->
        <sch:assert test="normalize-space(ntx:DefaultSystemOfUnits)='SiMetres'">
            DefaultSystemOfUnits moet de waarde 'SiMetres' hebben.
        </sch:assert>

        <!-- F -->
        <sch:assert test="normalize-space(ntx:DefaultCurrency)='EUR'">
            DefaultCurrency moet de waarde 'EUR' hebben.
        </sch:assert>
    </sch:rule>
</sch:pattern>