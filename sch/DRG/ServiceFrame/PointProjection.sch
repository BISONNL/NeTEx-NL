<sch:pattern id="DRG.ServiceFrame.PointProjection" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']//ntx:ScheduledStopPoint/ntx:projections/ntx:PointProjection">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:ProjectToPointRef">ProjectToPointRef is verplicht</sch:assert>
        <sch:assert test="ntx:ProjectToPointRef/@nameOfRefClass">Attribuut nameOfRefClass is verplicht op ProjectToPointRef</sch:assert>
        <sch:assert test="ntx:ProjectToPointRef/@nameOfRefClass='RoutePoint'">Attribuut nameOfRefClass moet altijd de waarde 'RoutePoint' hebben</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <!-- Exact één ProjectToPointRef verwijst naar een RoutePoint.
             Bij deze verwijzing wordt expliciet het type benoemd in de nameOfRefClass. -->
    </sch:rule>
</sch:pattern>