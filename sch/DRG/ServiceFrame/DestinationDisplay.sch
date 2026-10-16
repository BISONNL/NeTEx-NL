<sch:pattern id="DRG.ServiceFrame.DestinationDisplay" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE']/ntx:destinationDisplays/ntx:DestinationDisplay">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:Name">Name is verplicht</sch:assert>
        <sch:assert test="ntx:FrontText">FrontText is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <sch:assert test="ntx:privateCodes/ntx:PrivateCode[@type='DestinationCode']/text()!=''">PrivateCode van type 'DestinationCode' is verplicht en mag niet leeg zijn</sch:assert>
    </sch:rule>
</sch:pattern>