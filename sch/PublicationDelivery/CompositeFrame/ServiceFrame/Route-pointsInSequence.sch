<sch:pattern id="ServiceFrame-Route-pointsInSequence" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:routes/ntx:Route/ntx:pointsInSequence">
        <sch:assert test="count(ntx:PointOnRoute)>1">Er wordt een minimum van twee PointOnRoute elementen verwacht</sch:assert>
    </sch:rule>
</sch:pattern>