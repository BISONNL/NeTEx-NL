<sch:pattern id="TypeOfResponsibilityRole" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:GeneralFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TechnicalEnumerations']">
        <sch:assert test="ntx:Description">Description is verplicht</sch:assert>
        <sch:assert test="ntx:members">members is verplicht</sch:assert>
        <sch:assert test="ntx:members/ntx:ValueSet/ntx:values/ntx:TypeOfResponsibilityRole or ntx:members/ntx:ValueSet/ntx:values/ntx:TypeOfEntity or ntx:members/ntx:ValueSet/ntx:values/ntx:TypeOfFrame">members/ValueSet/values/TypeOfResponsibilityRole of members/ValueSet/values/TypeOfFrame is verplicht</sch:assert>
    </sch:rule>
    <sch:rule context="ntx:GeneralFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TechnicalEnumerations']/ntx:members/ntx:ValueSet/ntx:values/ntx:TypeOfResponsibilityRole">
        <sch:assert test="ntx:Name">Name is verplicht</sch:assert>
        <sch:assert test="@version='any'">Attribuut version moet de waarde 'any' hebben</sch:assert>
    </sch:rule>
</sch:pattern>