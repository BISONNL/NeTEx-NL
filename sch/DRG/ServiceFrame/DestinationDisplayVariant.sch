<sch:pattern id="DRG.ServiceFrame.DestinationDisplayVariant" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:destinationDisplays/ntx:DestinationDisplay/ntx:variants/ntx:DestinationDisplayVariant">
        <!-- Variables for use in business rule -->
        <sch:let name="max-length" value="number(substring(ntx:Extensions/ntx:MaxLength/text(),string-length('BISON:DisplayTextLength:')+1))"/>

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:Name">Name is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <sch:assert test="ntx:variants/ntx:DestinationDisplayVariant[ntx:Extensions[count(ntx:MaxLength)=1]/ntx:MaxLength/text()='BISON:DisplayTextLength:16']">DestinationDisplayVariant voor lengtevariant 'BISON:DisplayTextLength:16' is verplicht</sch:assert>
        <sch:assert test="ntx:variants/ntx:DestinationDisplayVariant[ntx:Extensions[count(ntx:MaxLength)=1]/ntx:MaxLength/text()='BISON:DisplayTextLength:19']">DestinationDisplayVariant voor lengtevariant 'BISON:DisplayTextLength:19' is verplicht</sch:assert>
        <sch:assert test="ntx:variants/ntx:DestinationDisplayVariant[ntx:Extensions[count(ntx:MaxLength)=1]/ntx:MaxLength/text()='BISON:DisplayTextLength:21']">DestinationDisplayVariant voor lengtevariant 'BISON:DisplayTextLength:21' is verplicht</sch:assert>
        <sch:assert test="ntx:variants/ntx:DestinationDisplayVariant[ntx:Extensions[count(ntx:MaxLength)=1]/ntx:MaxLength/text()='BISON:DisplayTextLength:24']">DestinationDisplayVariant voor lengtevariant 'BISON:DisplayTextLength:24' is verplicht</sch:assert>

        <!-- B -->
        <sch:assert test="string-length(ntx:Name/text())&lt;=$max-length">Tekst is langer dan opgegeven maximale lengte</sch:assert>
        <sch:assert test="string-length(ntx:vias/ntx:Via/ntx:Name/text())&lt;=$max-length">Tekst is langer dan opgegeven maximale lengte</sch:assert>

        <!-- C -->

    </sch:rule>
</sch:pattern>