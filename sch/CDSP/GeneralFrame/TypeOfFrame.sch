<sch:pattern id="TypeOfFrame" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:GeneralFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TypeOfEquipmentValues']/ntx:members/ntx:ValueSet/ntx:values/ntx:TypeOfFrame">
        <sch:assert test="ntx:Name">Name is verplicht</sch:assert>
        <sch:assert test="@version!='any'">Attribuut version mag NIET de waarde 'any' hebben</sch:assert>
    </sch:rule>
</sch:pattern>