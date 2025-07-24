<sch:pattern id="ServiceFrame-DestinationDisplayVariant" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:destinationDisplays/ntx:DestinationDisplay/ntx:variants/ntx:DestinationDisplayVariant">
        <sch:assert test="ntx:Name">Name is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>