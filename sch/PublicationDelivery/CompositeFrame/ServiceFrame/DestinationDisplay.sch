<sch:pattern id="ServiceFrame-DestinationDisplay" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:destinationDisplays/ntx:DestinationDisplay">
        <sch:assert test="ntx:Name">Name is verplicht</sch:assert>
        <sch:assert test="ntx:FrontText">FrontText is verplicht</sch:assert>
        <sch:assert test="ntx:variants/ntx:DestinationDisplayVariant[ntx:Extensions[count(ntx:MaxLength)=1]/ntx:MaxLength/text()='BISON:DisplayTextLength:16']">DestinationDisplayVariant voor lengtevariant 'BISON:DisplayTextLength:16' is verplicht</sch:assert>
        <sch:assert test="ntx:variants/ntx:DestinationDisplayVariant[ntx:Extensions[count(ntx:MaxLength)=1]/ntx:MaxLength/text()='BISON:DisplayTextLength:19']">DestinationDisplayVariant voor lengtevariant 'BISON:DisplayTextLength:19' is verplicht</sch:assert>
        <sch:assert test="ntx:variants/ntx:DestinationDisplayVariant[ntx:Extensions[count(ntx:MaxLength)=1]/ntx:MaxLength/text()='BISON:DisplayTextLength:21']">DestinationDisplayVariant voor lengtevariant 'BISON:DisplayTextLength:21' is verplicht</sch:assert>
        <sch:assert test="ntx:variants/ntx:DestinationDisplayVariant[ntx:Extensions[count(ntx:MaxLength)=1]/ntx:MaxLength/text()='BISON:DisplayTextLength:24']">DestinationDisplayVariant voor lengtevariant 'BISON:DisplayTextLength:24' is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>