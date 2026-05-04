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
        <!-- Elke Line moet een PrivateCode met type “LinePlanningNumber” hebben, en de waarde hiervan mag niet leeg zijn. -->
        <sch:assert test="ntx:privateCodes/ntx:PrivateCode[@type='LinePlanningNumber']">PrivateCode van type 'LinePlanningNumber' is verplicht</sch:assert>

        <!-- D -->
        <!-- Als er voor een Line een ExternalObjectRefStructure met type “LineVeTagNummer” is geleverd, mag de waarde (lees: ref) niet leeg zijn. -->
        <sch:assert test="ntx:ExternalLineRef[@type='VetagLineNumber' and @ref!='']">ExternalLineRef met type="VetagLineNumber" is verplicht</sch:assert>

        <!-- E -->
        <!-- Alle in een GroupOfLines genoemde Line-elementen moeten gedefinieerd zijn binnen de levering.
             Alle gedefinieerde Line-elementen dienen te zijn opgenomen in één van de GroupOfLines.
             Deze regel is alleen van toepassing als de vervoerder ervoor heeft gekozen om tenminste één GroupOfLines aan te leveren. -->
    </sch:rule>
</sch:pattern>