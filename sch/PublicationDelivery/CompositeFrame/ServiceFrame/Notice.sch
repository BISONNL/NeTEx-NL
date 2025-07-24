<sch:pattern id="ServiceFrame-Notice" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:notices/ntx:Notice">
        <sch:assert test="ntx:Text">Text is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>