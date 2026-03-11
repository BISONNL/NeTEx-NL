<sch:pattern id="DRG.ServiceFrame.ScheduledStopPoint" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:scheduledStopPoints/ntx:ScheduledStopPoint">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:Name">Name is verplicht</sch:assert>
        <sch:assert test="ntx:Location">Location is verplicht</sch:assert>
        <sch:assert test="ntx:projections/ntx:PointProjection">projections/PointProjection is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <sch:assert test="ntx:privateCodes/ntx:PrivateCode[@type='UserStopCode']">PrivateCode van type 'UserStopCode' is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>