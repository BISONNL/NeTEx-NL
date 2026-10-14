<sch:pattern id="DRG.TimetableFrame.ServiceJourney" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:TimetableFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_TIMETABLE']/ntx:vehicleJourneys/ntx:ServiceJourney">
        <!-- Variables for use in business rule -->
        <sch:let name="availability-conditions" value="ntx:validityConditions/ntx:AvailabilityCondition | //ntx:AvailabilityCondition[@id = current()/ntx:validityConditions/ntx:AvailabilityConditionRef/@ref]"/>
        <sch:let name="available-conditions" value="$availability-conditions[not(normalize-space(ntx:IsAvailable) = ('false', '0'))]"/>

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:validityConditions">validityConditions is verplicht</sch:assert>
        <sch:assert test="ntx:DepartureTime">DepartureTime is verplicht</sch:assert>
        <sch:assert test="ntx:ServiceJourneyPatternRef">ServiceJourneyPatternRef is verplicht</sch:assert>
        <sch:assert test="ntx:TimeDemandTypeRef">TimeDemandTypeRef is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- B: Als Print=true, dan is validityConditions verplicht.
             NB: validityConditions is al onvoorwaardelijk verplicht (strenger dan de PDF-regel). -->

        <!-- C: Geldigheid in dayTypes consistent met validityConditions -->
        <!-- Niet implementeerbaar: vereist datum-interpretatie van ValidDayBits en vergelijking met DayType-geldigheden -->

        <!-- D -->
        <!-- Elke ServiceJourney moet een PrivateCode met type “JourneyNumber” hebben, en de waarde hiervan mag niet leeg zijn. -->
        <sch:assert test="ntx:privateCodes/ntx:PrivateCode[@type='JourneyNumber']!=''">PrivateCode van type 'JourneyNumber' is verplicht en mag niet leeg zijn</sch:assert>

        <!-- E: Dubbele ritten - uniek LinePlanningNumber+JourneyNumber+DataOwnerCode per operationele dag -->
        <!-- Niet implementeerbaar: vereist cross-frame combinatie van alle TimetableFrames en datum-interpretatie -->

        <!-- F: AvailabilityConditions (IsAvailable=true) mogen niet overlappen qua periodes -->
        <sch:assert test="every $a in $available-conditions, $b in $available-conditions satisfies
            $a is $b
            or xs:dateTime($a/ntx:FromDate) gt xs:dateTime($b/ntx:ToDate)
            or xs:dateTime($a/ntx:ToDate) lt xs:dateTime($b/ntx:FromDate)">
            AvailabilityConditions (met IsAvailable=true) van dezelfde ServiceJourney mogen niet overlappen in periode
        </sch:assert>

        <!-- G: TimingLinks via JourneyPattern-pad moeten gelijk zijn aan TimingLinks via TimeDemandType-pad -->
        <sch:let name="pattern-timing-links" value="string-join(
            for $ref in //ntx:ServiceJourneyPattern[@id=current()/ntx:ServiceJourneyPatternRef/@ref]/ntx:pointsInSequence/*/ntx:OnwardTimingLinkRef/@ref
            return string($ref), ' ')"/>
        <sch:let name="tdt-timing-links" value="string-join(
            for $ref in //ntx:TimeDemandType[@id=current()/ntx:TimeDemandTypeRef/@ref]/ntx:runTimes/ntx:JourneyRunTime/ntx:TimingLinkRef/@ref
            return string($ref), ' ')"/>
        <sch:assert test="$pattern-timing-links = $tdt-timing-links">
            De set TimingLinks via het ServiceJourneyPattern (pad 1) moet gelijk zijn aan de set via het TimeDemandType (pad 2)
        </sch:assert>
        <!-- H: Geen nesting bij derivedFromObjectRef -->
        <sch:assert test="not(@derivedFromObjectRef) or not(//ntx:ServiceJourney[@id=current()/@derivedFromObjectRef]/@derivedFromObjectRef)">
            Als van rit A naar rit B verwezen wordt via derivedFromObjectRef, dan mag rit B niet op zijn beurt ook weer naar een rit verwijzen
        </sch:assert>
    </sch:rule>
</sch:pattern>
