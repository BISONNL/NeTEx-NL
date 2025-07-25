<sch:pattern id="Network" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:GeneralFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_NetworkList']/ntx:members/ntx:Network">
        <sch:assert test="ntx:Name">Name is verplicht</sch:assert>
        <sch:assert test="ntx:ShortName">ShortName is verplicht</sch:assert>
        <sch:assert test="ntx:GroupOfLinesType">GroupOfLinesType is verplicht</sch:assert>
        <sch:assert test="ntx:AuthorityRef">AuthorityRef is verplicht</sch:assert>
        <sch:assert test="@version='any'">Attribuut version moet de waarde 'any' hebben</sch:assert>
    </sch:rule>
</sch:pattern>