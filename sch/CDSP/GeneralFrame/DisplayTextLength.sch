<sch:pattern name="DisplayTextLength" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:GeneralFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TechnicalEnumerations']/ntx:members/ntx:ValueSet/ntx:values/ntx:TypeOfEntity">
        <sch:assert test="ntx:Name">Name is verplicht</sch:assert>
        <sch:assert test=".[matches(@id, '^NL:BISON:DisplayTextLength:\d+$')]">TypeOfEntity moet een id van de vorm 'NL:BISON:DisplayTextLength:[UniqueValue]' hebben</sch:assert>
        <sch:assert test="@version='any'">Attribuut version moet de waarde 'any' hebben</sch:assert>
    </sch:rule>
</sch:pattern>
