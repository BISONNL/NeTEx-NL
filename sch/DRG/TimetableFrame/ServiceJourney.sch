<sch:pattern id="DRG.TimetableFrame.ServiceJourney" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:TimetableFrame[ntx:TypeOfFrameRef/@ref='NL:BISON:TypeOfFrame:NL_TT_TIMETABLE']/ntx:vehicleJourneys/ntx:ServiceJourney">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:validityConditions">validityConditions is verplicht</sch:assert>
        <sch:assert test="ntx:DepartureTime">DepartureTime is verplicht</sch:assert>
        <sch:assert test="ntx:ServiceJourneyPatternRef">ServiceJourneyPatternRef is verplicht</sch:assert>
        <sch:assert test="ntx:TimeDemandTypeRef">TimeDemandTypeRef is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <!-- Als Print=true, dan is validityConditions verplicht. -->

        <!-- B -->
        <!-- Indien dayTypes zijn meegegeven, dan dient de hieruit af te leiden geldigheid gelijk te zijn aan de geldigheid die volgt uit validityConditions. -->

        <!-- C -->
        <!-- Elke ServiceJourney moet een PrivateCode met type “JourneyNumber” hebben, en de waarde hiervan mag niet leeg zijn. -->
        <sch:assert test="ntx:privateCodes/ntx:PrivateCode[@type='JourneyNumber']!=''">PrivateCode van type 'JourneyNumber' is verplicht en mag niet leeg zijn</sch:assert>

        <!-- D -->
        <!-- Alle ServiceJourneys binnen een CompositeFrame een dienen een uniek LinePlanningNumber, JourneyNumber en DataOwnerCode te hebben voor alle operationele dagen die zijn gespecificeerd binnen het CompositeFrame. Voor deze controle dienen de ritten uit alle Timetable-frames te worden gecombineerd. -->

        <!-- E -->
        <!-- Elke AvailabilityCondition van een ServiceJourney (met IsAvailable = ‘true’) definieert de geldigheid voor een periode die niet geheel of gedeeltelijk overlapt met een andere AvailabilityCondition (met IsAvailable = ‘true’) voor diezelfde ServiceJourney.  -->

        <!-- F -->
        <!-- Voor elke rit kunnen op twee manieren TimingLinks worden bepaald:
                1. ServiceJourney -> ServiceJourneyPattern -> PointsInJourneyPattern -> TimingLink
                2. ServiceJourneyPattern -> TimeDemandGroup -> RunTimes -> JourneyRunTime -> TimingLink
             De set van TimingLinks die via pad 1 kan worden bepaald, dient exact gelijk te zijn aan de set die via pad 2 kan worden bepaald. -->

        <!-- G -->
        <!-- Voor omleidingsritten mag verwezen worden naar de ‘originele rit’ middels de attributen derivedFromObjectRef
             en derivedFromVersionRef. Het is echter niet toegestaan om op deze manier te nesten. Met andere woorden:
             als van rit A naar rit B verwezen wordt, dan mag niet rit B niet op zijn beurt ook weer naar een rit verwijzen. -->
    </sch:rule>
</sch:pattern>
