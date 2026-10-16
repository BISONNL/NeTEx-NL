<sch:pattern id="DRG.TimetableFrame.AvailabilityCondition" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:TimetableFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_TIMETABLE']/ntx:contentValidityConditions/ntx:AvailabilityCondition">
        <!-- Variables for use in business rule -->
        <sch:let name="from" value="xs:dateTime(ntx:FromDate)"/>
        <sch:let name="to" value="xs:dateTime(ntx:ToDate)"/>
        <sch:let name="bits" value="replace(normalize-space(ntx:ValidDayBits), '\s+', '')"/>
        <sch:let name="daysInclusive" value="floor(( $to - $from ) div xs:dayTimeDuration('P1D')) + 1"/>

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:FromDate">FromDate is verplicht</sch:assert>
        <sch:assert test="ntx:ToDate">ToDate is verplicht</sch:assert>
        <sch:assert test="ntx:ValidDayBits">ValidDayBits is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <sch:assert test="xs:dateTime($to) ge xs:dateTime($from)">De ToDate van de AvailabilityCondition dient na de FromDate te liggen of hieraan gelijk te zijn.</sch:assert>

        <!-- B -->
        <sch:assert test="string-length($bits)=$daysInclusive">
            Lengte van ValidDayBits (<sch:value-of select="string-length($bits)"/>) moet gelijk zijn aan het aantal dagen tussen FromDate en ToDate (inclusief) (<sch:value-of select="$daysInclusive"/>).
        </sch:assert>

    </sch:rule>
</sch:pattern>