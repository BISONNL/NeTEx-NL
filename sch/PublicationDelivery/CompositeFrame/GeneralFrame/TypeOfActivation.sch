<sch:pattern id="TypeOfActivation" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:GeneralFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TypeOfActivationValues']">
        <sch:assert test="ntx:Description">Description is verplicht</sch:assert>
        <sch:assert test="ntx:members">members is verplicht</sch:assert>
        <sch:assert test="ntx:members/ntx:ValueSet/ntx:values/ntx:TypeOfActivation">members/ValueSet/values/TypeOfActivation is verplicht</sch:assert>
    </sch:rule>
    <sch:rule context="ntx:GeneralFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TypeOfActivationValues']/ntx:members/ntx:ValueSet/ntx:values/ntx:TypeOfActivation">
        <sch:assert test="ntx:Name">Name is verplicht</sch:assert>
        <sch:assert test="@version='any'">Attribuut version moet de waarde 'any' hebben</sch:assert>
    </sch:rule>
</sch:pattern>