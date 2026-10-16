<sch:pattern id="DRG.ServiceFrame.DestinationDisplayVariant" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <!-- A: Compleetheid - alle 4 lengtevarianten moeten aanwezig zijn (op DestinationDisplay niveau) -->
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:destinationDisplays/ntx:DestinationDisplay">
        <sch:assert test="ntx:variants/ntx:DestinationDisplayVariant[ntx:Extensions/ntx:MaxLength='NL:BISON:DisplayTextLength:16']">DestinationDisplayVariant voor lengtevariant 'NL:BISON:DisplayTextLength:16' is verplicht</sch:assert>
        <sch:assert test="ntx:variants/ntx:DestinationDisplayVariant[ntx:Extensions/ntx:MaxLength='NL:BISON:DisplayTextLength:19']">DestinationDisplayVariant voor lengtevariant 'NL:BISON:DisplayTextLength:19' is verplicht</sch:assert>
        <sch:assert test="ntx:variants/ntx:DestinationDisplayVariant[ntx:Extensions/ntx:MaxLength='NL:BISON:DisplayTextLength:21']">DestinationDisplayVariant voor lengtevariant 'NL:BISON:DisplayTextLength:21' is verplicht</sch:assert>
        <sch:assert test="ntx:variants/ntx:DestinationDisplayVariant[ntx:Extensions/ntx:MaxLength='NL:BISON:DisplayTextLength:24']">DestinationDisplayVariant voor lengtevariant 'NL:BISON:DisplayTextLength:24' is verplicht</sch:assert>
    </sch:rule>

    <!-- B: Correctheid + Extensions.A - op variant niveau -->
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:destinationDisplays/ntx:DestinationDisplay/ntx:variants/ntx:DestinationDisplayVariant">
        <sch:let name="max-length" value="number(substring-after(ntx:Extensions/ntx:MaxLength, 'NL:BISON:DisplayTextLength:'))"/>

        <!-- Cardinality -->
        <sch:assert test="ntx:Name">Name is verplicht</sch:assert>

        <!-- B: Lengte van tekst kleiner of gelijk aan opgegeven maximale lengte -->
        <sch:assert test="string-length(normalize-space(ntx:Name)) &lt;= $max-length">Tekst van Name is langer dan de opgegeven maximale lengte</sch:assert>

        <!-- Extensions.A: MaxLength moet een BISON-enumeratie referentie zijn -->
        <sch:assert test="normalize-space(ntx:Extensions/ntx:MaxLength) = ('NL:BISON:DisplayTextLength:16', 'NL:BISON:DisplayTextLength:19', 'NL:BISON:DisplayTextLength:21', 'NL:BISON:DisplayTextLength:24')">De MaxLength moet verwijzen naar een waarde uit de BISON-enumeratie DisplayTextLength (bijv. 'NL:BISON:DisplayTextLength:16'), niet een getal</sch:assert>
    </sch:rule>
</sch:pattern>