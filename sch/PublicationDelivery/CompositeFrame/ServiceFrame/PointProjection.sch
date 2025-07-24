<sch:pattern id="ServiceFrame-PointProjection" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']//ntx:ScheduledStopPoint/ntx:projections/ntx:PointProjection">
        <sch:assert test="ntx:ProjectToPointRef">ProjectToPointRef is verplicht</sch:assert>
        <sch:assert test="ntx:ProjectToPointRef/@nameOfRefClass">Attribuut nameOfRefClass moet altijd de waarde 'RoutePoint' hebben</sch:assert>
    </sch:rule>
</sch:pattern>