<sch:pattern id="ResourceFrame-OperationalContext" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ResourceFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE']/ntx:operationalContexts/ntx:OperationalContext">
        <sch:assert test="ntx:VehicleMode/text()!=''">VehicleMode is verplicht</sch:assert>
    </sch:rule>
</sch:pattern>