<sch:pattern id="ServiceFrame-ScheduledStopPoint" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:scheduledStopPoints/ntx:ScheduledStopPoint">
        <sch:assert test="ntx:Name">Name is verplicht</sch:assert>
        <sch:assert test="ntx:Location">Location is verplicht</sch:assert>
        <sch:assert test="ntx:projections/ntx:PointProjection">projections/PointProjection is verplicht</sch:assert>
        <sch:assert test="ntx:privateCodes/ntx:PrivateCode[@type='UserStopCode']">PrivateCode van type 'UserStopCode' is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>