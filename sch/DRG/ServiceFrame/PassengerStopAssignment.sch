<sch:pattern id="DRG.ServiceFrame.PassengerStopAssignment" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:stopAssignments/ntx:PassengerStopAssignment">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:ScheduledStopPointRef">ScheduledStopPointRef is verplicht</sch:assert>
        <sch:assert test="ntx:QuayRef">QuayRef is verplicht</sch:assert>

        <!-- Other business rules -->

        <!-- B -->
        <!-- TODO Elke ScheduledStopPoint dient exact één keer voor te komen in de lijst met PassengerStopAssignments.-->

        <!-- C -->
        <!-- De coördinaten van elk PointOnLink in passingThrough is vermeld in de LineString van de RouteLink. -->

    </sch:rule>
</sch:pattern>