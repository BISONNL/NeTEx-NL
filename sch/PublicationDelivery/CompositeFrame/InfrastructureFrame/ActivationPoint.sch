<sch:pattern id="InfrastructureFrame-ActivationPoint" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:InfrastructureFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_INFRA']/ntx:activationPoints/ntx:ActivationPoint">
        <sch:assert test="ntx:privateCodes/ntx:PrivateCode[@type='KarAddress']">PrivateCode van type 'KarAddress' is verplicht</sch:assert>
        <sch:assert test="ntx:TypeOfActivationRef">TypeOfActivationRef is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>