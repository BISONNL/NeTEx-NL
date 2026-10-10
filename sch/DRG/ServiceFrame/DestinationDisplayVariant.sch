<sch:pattern id="DRG.ServiceFrame.DestinationDisplayVariant" xmlns:sch="http://purl.oclc.org/dsdl/schematron">

    <!-- Mandatory lengths per DestinationDisplay -->
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:destinationDisplays/ntx:DestinationDisplay">

        <sch:assert test="ntx:variants/ntx:DestinationDisplayVariant[ntx:Extensions[count(ntx:MaxLength)=1]/ntx:MaxLength='NL:BISON:DisplayTextLength:16']">
            DestinationDisplayVariant voor lengtevariant 'NL:BISON:DisplayTextLength:16' is verplicht
        </sch:assert>

        <sch:assert test="ntx:variants/ntx:DestinationDisplayVariant[ntx:Extensions[count(ntx:MaxLength)=1]/ntx:MaxLength='NL:BISON:DisplayTextLength:19']">
            DestinationDisplayVariant voor lengtevariant 'NL:BISON:DisplayTextLength:19' is verplicht
        </sch:assert>

        <sch:assert test="ntx:variants/ntx:DestinationDisplayVariant[ntx:Extensions[count(ntx:MaxLength)=1]/ntx:MaxLength='NL:BISON:DisplayTextLength:21']">
            DestinationDisplayVariant voor lengtevariant 'NL:BISON:DisplayTextLength:21' is verplicht
        </sch:assert>

        <sch:assert test="ntx:variants/ntx:DestinationDisplayVariant[ntx:Extensions[count(ntx:MaxLength)=1]/ntx:MaxLength='NL:BISON:DisplayTextLength:24']">
            DestinationDisplayVariant voor lengtevariant 'NL:BISON:DisplayTextLength:24' is verplicht
        </sch:assert>

    </sch:rule>

    <!-- B. Constraints per DestinationDisplayVariant -->
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:destinationDisplays/ntx:DestinationDisplay/ntx:variants/ntx:DestinationDisplayVariant">

        <!-- Variables for use in business rule -->
        <sch:let name="max-length" value="number(substring(ntx:Extensions/ntx:MaxLength/text(),string-length('NL:BISON:DisplayTextLength:')+1))"/>

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:Name">Name is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <sch:assert test="count(ntx:Extensions/ntx:MaxLength)=1">Precies één MaxLength is verplicht binnen Extensions</sch:assert>

        <sch:assert test="ntx:Extensions/ntx:MaxLength=('NL:BISON:DisplayTextLength:16','NL:BISON:DisplayTextLength:19','NL:BISON:DisplayTextLength:21','NL:BISON:DisplayTextLength:24')">MaxLength moet een van de toegestane lengtevarianten 16, 19, 21 of 24 bevatten</sch:assert>

        <!-- B -->
        <sch:assert test="string-length(ntx:Name/text())&lt;=$max-length">Tekst is langer dan opgegeven maximale lengte</sch:assert>

        <!-- C -->
        <sch:assert test="every $via in ntx:vias/ntx:Via/text() satisfies string-length($via/ntx:Name/text())&lt;=$max-length">Tekst is langer dan opgegeven maximale lengte voor Via/Name</sch:assert>

    </sch:rule>
</sch:pattern>
