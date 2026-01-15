<sch:pattern id="DRG.CompositeFrame.FrameDefaults" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:CompositeFrame/ntx:FrameDefaults">
        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:DefaultCodespaceRef/text()!=''">DefaultCodespaceRef is verplicht</sch:assert>
        <sch:assert test="ntx:DefaultDataSourceRef/text()!=''">DefaultDataSourceRef is verplicht</sch:assert>
        <sch:assert test="ntx:DefaultResponsibilitySetRef/text()!=''">DefaultResponsibilitySetRef is verplicht</sch:assert>
        <sch:assert test="ntx:DefaultLocale/ntx:TimeZone/text()!=''">DefaultLocale/TimeZone is verplicht</sch:assert>
        <sch:assert test="ntx:DefaultLocationSystem/text()!=''">DefaultLocationSystem is verplicht</sch:assert>
        <sch:assert test="ntx:DefaultSystemOfUnits/text()!=''">DefaultSystemOfUnits is verplicht</sch:assert>
        <sch:assert test="ntx:DefaultCurrency/text()!=''">DefaultCurrency is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <sch:assert test="matches(ntx:DefaultCodespaceRef/@ref, 'NL:BISON:')">
            DefaultCodespaceRef verwijst naar een voorgedefinieerde Codespace
        </sch:assert>

        <!-- B -->
        <!-- TODO: De DefaultResponsibilitySetRef is verplicht en verwijst naar een ResponsibilitySet, met daarin een ResponsibilityRoleAssignment die verwijst naar het enige TransportAdministrativeZone die binnen dit baseline-CompositeFrame is gedefinieerd. Deze ResponsibilitySet wordt nergens anders voor gebruikt binnen de levering. -->

        <!-- C -->
        <sch:assert test="ntx:DefaultLocale/ntx:TimeZone='Europe/Amsterdam'">
            DefaultLocale/TimeZone moet de waarde 'Europe/Amsterdam' hebben.
        </sch:assert>

        <!-- D -->
        <sch:assert test="normalize-space(ntx:DefaultLocationSystem)='EPSG\:4326'">
            DefaultLocationSystem maar moet de waarde 'EPSG\:4326' hebben.
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