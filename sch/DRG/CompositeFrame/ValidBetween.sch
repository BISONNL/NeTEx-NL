<sch:pattern id="DRG.CompositeFrame.ValidBetween" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:CompositeFrame/ntx:ValidBetween">
        <!-- Variables for use in business rule -->
        <sch:let name="from" value="normalize-space(ntx:FromDate)"/>
        <sch:let name="to" value="normalize-space(ntx:ToDate)"/>
        <sch:let name="now" value="current-dateTime()"/>

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:FromDate/text()!=''">FromDate is verplicht</sch:assert>
        <sch:assert test="ntx:ToDate/text()!=''">ToDate is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <sch:assert test="xs:dateTime($from) gt $now">FromDate must be in the future. Current system time: '<value-of select="$now"/>'.</sch:assert>

        <!-- B -->
        <sch:assert test="xs:dateTime($to) gt xs:dateTime($from)">ToDate must be later than FromDate.</sch:assert>

        <!-- C -->
        <sch:assert test="matches($from, 'T00:00:00')">The time part of FromDate must be set to T00:00:00.</sch:assert>
        <sch:assert test="matches($to, 'T00:00:00')">The time part of ToDate must be set to T00:00:00.</sch:assert>
    </sch:rule>
</sch:pattern>
