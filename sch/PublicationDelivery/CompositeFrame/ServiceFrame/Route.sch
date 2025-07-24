<sch:pattern id="ServiceFrame-Route" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:routes/ntx:Route">
        <sch:assert test="ntx:LineRef">LineRef is verplicht</sch:assert>
        <sch:assert test="ntx:DirectionType">DirectionType is verplicht</sch:assert>
        <sch:assert test="ntx:pointsInSequence">pointsInSequence is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>