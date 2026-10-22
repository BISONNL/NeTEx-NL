<sch:pattern id="DRG.ServiceFrame.TimingPoint" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:timingPoints/ntx:TimingPoint">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:Name">Name is verplicht</sch:assert>
        <sch:assert test="ntx:Location">Location is verplicht</sch:assert>
        <sch:assert test="ntx:projections/ntx:PointProjection">projections/PointProjection is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <sch:assert test="not(ntx:privateCodes/ntx:PrivateCode[@type='UserStopCode']) or ntx:privateCodes/ntx:PrivateCode[@type='UserStopCode']/text()!=''">Als er een PrivateCode van type 'UserStopCode' is geleverd, mag de waarde niet leeg zijn</sch:assert>

    </sch:rule>
</sch:pattern>