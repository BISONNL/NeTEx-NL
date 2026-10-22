<sch:pattern id="DRG.ServiceFrame.StopArea" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:stopAreas/ntx:StopArea">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:Name">Name is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <sch:assert test="not(ntx:privateCodes/ntx:PrivateCode[@type='UserStopAreaCode']) or ntx:privateCodes/ntx:PrivateCode[@type='UserStopAreaCode']/text()!=''">Als er een PrivateCode van type 'UserStopAreaCode' is geleverd, mag de waarde niet leeg zijn</sch:assert>
    </sch:rule>
</sch:pattern>