<sch:pattern id="DRG.TimetableFrame.DeadRun" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:TimetableFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_TIMETABLE']/ntx:vehicleJourneys/ntx:DeadRun">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:validityConditions">validityConditions is verplicht</sch:assert>
        <sch:assert test="ntx:DepartureTime">DepartureTime is verplicht</sch:assert>
        <sch:assert test="ntx:DeadRunJourneyPatternRef">DeadRunJourneyPatternRef is verplicht</sch:assert>
        <sch:assert test="ntx:TimeDemandTypeRef">TimeDemandTypeRef is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A: Als JourneyNumber geleverd is, moet het een positieve integer zijn -->
        <sch:assert test="not(ntx:privateCodes/ntx:PrivateCode[@type='JourneyNumber']) or matches(normalize-space(ntx:privateCodes/ntx:PrivateCode[@type='JourneyNumber']), '^[1-9][0-9]*$')">
            Als een PrivateCode van type 'JourneyNumber' is geleverd, moet dit een positieve integer-waarde zijn
        </sch:assert>
    </sch:rule>
</sch:pattern>
