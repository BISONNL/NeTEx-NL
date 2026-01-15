<sch:pattern id="TypeOfActivation" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:GeneralFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TypeOfActivationValues']/ntx:members/ntx:ValueSet/ntx:values/ntx:TypeOfActivation">
        <sch:assert test="ntx:Name">Name is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>