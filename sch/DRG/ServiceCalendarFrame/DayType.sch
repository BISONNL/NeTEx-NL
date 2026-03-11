<sch:pattern id="DRG.ServiceCalendarFrame.DayType" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceCalendarFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:dayTypes/ntx:DayType">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:properties/ntx:PropertyOfDay">Er moet minimaal 1 PropertyOfDay worden gegeven</sch:assert>

        <!-- Other business rules -->
    </sch:rule>
</sch:pattern>