<sch:pattern id="ResourceFrame-DataSource" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE']/ntx:dataSources/ntx:DataSource">
        <sch:assert test="ntx:Name/text()!=''">Name is verplicht</sch:assert>
        <sch:assert test="ntx:ShortName/text()!=''">ShortName is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>