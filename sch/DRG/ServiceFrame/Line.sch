<sch:pattern id="DRG.ServiceFrame.Line" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:lines/ntx:Line">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:Name">Name is verplicht</sch:assert>
        <sch:assert test="ntx:TransportMode">TransportMode is verplicht</sch:assert>
        <sch:assert test="ntx:privateCodes/ntx:PrivateCode[@type='LinePlanningNumber']">PrivateCode van type 'LinePlanningNumber' is verplicht</sch:assert>
        <sch:assert test="ntx:OperatorRef">OperatorRef is verplicht</sch:assert>
        <sch:assert test="ntx:TypeOfServiceRef">TypeOfServiceRef is verplicht</sch:assert>
        <sch:assert test="ntx:Monitored">Monitored is verplicht</sch:assert>
        <sch:assert test="ntx:AccessibilityAssessment">AccessibilityAssessment is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <!-- Elke OperationalContext moet een VehicleMode bevatten, conform de beschrijving in §19.13. -->

        <!-- B -->
        <!-- De TransportSubMode van een OperationalContext moet passen bij de VehicleMode, conform de beschrijving in §19.13. -->

        <!-- C -->
        <sch:assert test="ntx:privateCodes/ntx:PrivateCode[@type='LinePlanningNumber']/text()!=''">De waarde van PrivateCode van type 'LinePlanningNumber' mag niet leeg zijn</sch:assert>

        <!-- D -->
        <sch:assert test="not(ntx:ExternalLineRef[@type='VeTagLineNumber']) or ntx:ExternalLineRef[@type='VeTagLineNumber' and @ref!='']">Als ExternalLineRef met type 'VeTagLineNumber' is geleverd, mag de waarde (ref) niet leeg zijn</sch:assert>

        <!-- E: GroupOfLines volledigheid (alleen als er tenminste één GroupOfLines is geleverd) -->
        <sch:assert test="not(ancestor::ntx:ServiceFrame/ntx:groupsOfLines/ntx:GroupOfLines) or ancestor::ntx:ServiceFrame/ntx:groupsOfLines/ntx:GroupOfLines/ntx:members/ntx:LineRef[@ref=current()/@id]">
            Elke Line moet opgenomen zijn in een GroupOfLines (indien GroupOfLines geleverd worden)
        </sch:assert>
    </sch:rule>

    <!-- E (omgekeerde richting): Alle LineRefs in GroupOfLines moeten verwijzen naar bestaande Lines -->
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:groupsOfLines/ntx:GroupOfLines/ntx:members/ntx:LineRef">
        <sch:assert test="ancestor::ntx:ServiceFrame/ntx:lines/ntx:Line[@id=current()/@ref]">
            Elke LineRef in een GroupOfLines moet verwijzen naar een Line die is gedefinieerd binnen de levering
        </sch:assert>
    </sch:rule>
</sch:pattern>