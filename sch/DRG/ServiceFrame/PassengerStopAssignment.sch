<sch:pattern id="DRG.ServiceFrame.PassengerStopAssignment" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:stopAssignments/ntx:PassengerStopAssignment">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:ScheduledStopPointRef">ScheduledStopPointRef is verplicht</sch:assert>
        <sch:assert test="ntx:QuayRef">QuayRef is verplicht</sch:assert>

        <!-- Other business rules -->

        <!-- B: Uniciteit -->
        <sch:assert test="not(preceding-sibling::ntx:PassengerStopAssignment[ntx:ScheduledStopPointRef/@ref = current()/ntx:ScheduledStopPointRef/@ref])">
            Elke ScheduledStopPoint dient exact één keer voor te komen in de lijst met PassengerStopAssignments
        </sch:assert>
        <!-- B: Volledigheid - elke ScheduledStopPoint moet een PassengerStopAssignment hebben -->
        <sch:assert test="not(ancestor::ntx:ServiceFrame/ntx:scheduledStopPoints/ntx:ScheduledStopPoint[not(@id = current()/ancestor::ntx:stopAssignments/ntx:PassengerStopAssignment/ntx:ScheduledStopPointRef/@ref)])">
            Elke ScheduledStopPoint moet voorkomen in de lijst met PassengerStopAssignments
        </sch:assert>

    </sch:rule>
</sch:pattern>