<sch:pattern id="DRG.ServiceFrame.PassengerStopAssignment" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <!-- Eenmalig per document: de lijsten waarin een ScheduledStopPoint van hetzelfde ServiceFrame ontbreekt -->
    <sch:let name="stop-assignment-lists-missing-a-stop" value="
        for $list in //ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:stopAssignments
        return if ($list/../ntx:scheduledStopPoints/ntx:ScheduledStopPoint[not(key('stop-assignment-by-stop', concat(generate-id($list), '|', @id)))])
               then $list else ()"/>

    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:stopAssignments/ntx:PassengerStopAssignment">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:ScheduledStopPointRef">ScheduledStopPointRef is verplicht</sch:assert>
        <sch:assert test="ntx:QuayRef">QuayRef is verplicht</sch:assert>

        <!-- Other business rules -->

        <!-- B: Uniciteit -->
        <sch:assert test="not(ntx:ScheduledStopPointRef) or not(key('stop-assignment-by-stop', concat(generate-id(..), '|', ntx:ScheduledStopPointRef/@ref))[. &lt;&lt; current()])">
            Elke ScheduledStopPoint dient exact één keer voor te komen in de lijst met PassengerStopAssignments
        </sch:assert>
        <!-- B: Volledigheid - elke ScheduledStopPoint moet een PassengerStopAssignment hebben -->
        <sch:assert test="not(.. intersect $stop-assignment-lists-missing-a-stop)">
            Elke ScheduledStopPoint moet voorkomen in de lijst met PassengerStopAssignments
        </sch:assert>

    </sch:rule>
</sch:pattern>