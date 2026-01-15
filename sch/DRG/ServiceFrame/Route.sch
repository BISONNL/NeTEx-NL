<sch:pattern id="DRG.ServiceFrame.Route" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:routes/ntx:Route">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:LineRef">LineRef is verplicht</sch:assert>
        <sch:assert test="ntx:DirectionType">DirectionType is verplicht</sch:assert>
        <sch:assert test="ntx:pointsInSequence">pointsInSequence is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <sch:assert test="count(ntx:PointOnRoute)>1">Er wordt een minimum van twee PointOnRoute elementen verwacht</sch:assert>

    </sch:rule>
</sch:pattern>