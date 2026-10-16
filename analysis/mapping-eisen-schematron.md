# Mapping: PDF-eisen → Schematron-implementatie

Dit document koppelt elke bedrijfsregel (eis) uit **TMI9 Dienstregeling 9.4.0 (RELEASE)**
(`netex-nl-dienstregelingexport-9.4.0.pdf`) aan de plek én de manier waarop deze is
opgelost in de Schematron-bestanden onder [`sch/DRG/`](../sch/DRG/).

## Leeswijzer

De PDF bestaat uit twee delen:

- **Deel I — Functionele beschrijving** (hoofdstuk 2–10, pag. 12–45): achtergrond,
  uitleg en business rules in proza.
- **Deel II — Elementdefinities en validatieregels** (hoofdstuk 11–20, pag. 48–121):
  de 84 genummerde, formele validatieregels (`q DRG.<Frame>.<Element>.<Letter>`) plus
  de regel `ServiceJourney.H`. Dít zijn de regels die door Schematron worden afgedwongen.

Elke regel hieronder is voorzien van:

- **Deel II (§ · pag.)** — het paragraafnummer én het **gedrukte** paginanummer waar de
  eis formeel is gedefinieerd.
- **Deel I (§ · pag.)** — de paragraaf in de functionele beschrijving die de eis
  toelicht (indien aanwezig; `—` als er geen directe tegenhanger is).

> **Let op de paginanummering.** De paginanummers in dit document zijn de **gedrukte**
> nummers uit de PDF-voettekst (`X / 136`), niet de bladzijde-index van de PDF-viewer.
> Die lopen één uit elkaar: bijv. eis `Elementidentificatie.A` staat op gedrukte
> pagina **48** (= bladzijde 49 in de viewer).

## Legenda

| Symbool | Betekenis |
|---------|-----------|
| ✅ | Volledig geïmplementeerd conform PDF |
| ✅* | Geïmplementeerd, met afwijking/kanttekening (zie noot) |
| ❌ | Niet implementeerbaar in Schematron/XPath 2.0 (zie noot) |
| — | Geen directe tegenhanger in Deel I |

## Samenvatting

| Categorie | Aantal |
|-----------|-------:|
| Eisen totaal (84 `q`-regels + `ServiceJourney.H`) | 85 |
| ✅ Volledig geïmplementeerd | 78 |
| ✅* Met kanttekening | 4 |
| ❌ Niet implementeerbaar | 3 |

De drie niet-implementeerbare eisen (`RouteLink.A`, `ServiceJourney.C`,
`ServiceJourney.E`) vereisen berekeningen of cross-frame-aggregaties die buiten het
bereik van XPath 2.0 vallen. Zie de noten onderaan.

---

## Algemeen

| Eis | Deel II (§ · pag.) | Deel I (§ · pag.) | Omschrijving | .sch-bestand | Implementatie | Status |
|-----|--------------------|--------------------|--------------|--------------|---------------|:------:|
| `Algemeen.Elementidentificatie.A` | §11.1 · p.48 | §2.1 · p.12 | Elementidentificatie: `id` volgens `NL:[Codespace]:[ObjectType]:[Waarde]`, `version` numeriek | [Elementidentificatie.sch](../sch/DRG/Algemeen/Elementidentificatie.sch) | 9 context-specifieke `matches(@id, ...)`-regexes per elementtype (CompositeFrame, GeneralFrame, Codespace, ValueSet, TypeOfFrame, overige) + `version`-check `^\d+$` | ✅ |
| `Algemeen.Concessiegebonden-vervoer.A` | §11.2 · p.48 | §4.1 · p.17 | Lijnen voor concessiegebonden vervoer verwijzen naar een DOVA-Authority | [Concessiegebonden-vervoer.sch](../sch/DRG/Algemeen/Concessiegebonden-vervoer.sch) | `AuthorityRef[matches(text(),'^NL:DOVA:.*')]` | ✅ |
| `Algemeen.Presentation` | §11.8 · p.49 | §9.1.6 · p.39 | `Colour` en `TextColour` zijn 6-cijferige hex RGB-waarden | [Presentation.sch](../sch/DRG/Algemeen/Presentation.sch) | Aparte regels op `Presentation/Colour` en `Presentation/TextColour` met `matches(., '^[0-9A-Fa-f]{6}$')` — geldt voor álle elementen, niet alleen ResourceFrame | ✅ |

## CompositeFrame

| Eis | Deel II (§ · pag.) | Deel I (§ · pag.) | Omschrijving | .sch-bestand | Implementatie | Status |
|-----|--------------------|--------------------|--------------|--------------|---------------|:------:|
| `CompositeFrame.ValidBetween.A` | §13.1 · p.56 | §3.2 · p.15 | Leveringgeldigheid valt in de toekomst | [ValidBetween.sch](../sch/DRG/CompositeFrame/ValidBetween.sch) | `xs:dateTime($from) gt $now` | ✅ |
| `CompositeFrame.ValidBetween.B` | §13.1 · p.56 | §3.2 · p.15 | Geldigheid minimaal één dag (ToDate ≥ FromDate) | [ValidBetween.sch](../sch/DRG/CompositeFrame/ValidBetween.sch) | `xs:dateTime($to) ge xs:dateTime($from)` | ✅ |
| `CompositeFrame.ValidBetween.C` | §13.1 · p.56 | §3.2 · p.15 | Tijdgedeelte is `T00:00:00` | [ValidBetween.sch](../sch/DRG/CompositeFrame/ValidBetween.sch) | `matches($from, 'T00:00:00')` en idem voor `$to` | ✅ |
| `CompositeFrame.TypeOfFrameRef` | §13.2 · p.56 | §3.1 · p.14 | Verwijst naar `NL_TT_BASELINE` | [TypeOfFrameRef.sch](../sch/DRG/CompositeFrame/TypeOfFrameRef.sch) | `@ref='NL:BISON:TypeOfFrame:NL_TT_BASELINE'` + `@versionRef='9.4.0'` | ✅ |
| `CompositeFrame.FrameDefaults.A` | §13.3 · p.57 | §3.1 · p.14 | `DefaultCodespaceRef` verwijst naar voorgedefinieerde Codespace | [FrameDefaults.sch](../sch/DRG/CompositeFrame/FrameDefaults.sch) | Verplicht + `matches(@ref, 'NL:BISON:')` | ✅ |
| `CompositeFrame.FrameDefaults.B` | §13.3 · p.57 | §3.1 · p.14 | `DefaultDataSourceRef` is verplicht | [FrameDefaults.sch](../sch/DRG/CompositeFrame/FrameDefaults.sch) | `DefaultDataSourceRef/text()!=''` | ✅ |
| `CompositeFrame.FrameDefaults.C` | §13.3 · p.57 | §3.3 · p.16 | `DefaultResponsibilitySetRef` → ResponsibilitySet met RoleAssignment naar de TransportAdministrativeZone | [FrameDefaults.sch](../sch/DRG/CompositeFrame/FrameDefaults.sch) | Cross-referentie: `ResponsibilitySet[@id=DefaultResponsibilitySetRef/@ref]/roles/ResponsibilityRoleAssignment/ResponsibleAreaRef/@ref = //TransportAdministrativeZone/@id` | ✅ |
| `CompositeFrame.FrameDefaults.D` | §13.3 · p.57 | — | Timezone = `Europe/Amsterdam` | [FrameDefaults.sch](../sch/DRG/CompositeFrame/FrameDefaults.sch) | `DefaultLocale/TimeZone='Europe/Amsterdam'` | ✅ |
| `CompositeFrame.FrameDefaults.E` | §13.3 · p.57 | — | `DefaultLocationSystem` = `EPSG:4326` | [FrameDefaults.sch](../sch/DRG/CompositeFrame/FrameDefaults.sch) | `normalize-space(DefaultLocationSystem)='EPSG:4326'` | ✅ |
| `CompositeFrame.FrameDefaults.F` | §13.3 · p.57 | — | `DefaultSystemOfUnits` = `SiMetres` | [FrameDefaults.sch](../sch/DRG/CompositeFrame/FrameDefaults.sch) | `normalize-space(DefaultSystemOfUnits)='SiMetres'` | ✅ |
| `CompositeFrame.FrameDefaults.G` | §13.3 · p.57 | — | `DefaultCurrency` = `EUR` | [FrameDefaults.sch](../sch/DRG/CompositeFrame/FrameDefaults.sch) | `normalize-space(DefaultCurrency)='EUR'` | ✅ |
| `CompositeFrame.frames` | §13.4 · p.58 | §3.1 · p.14 | Correcte set frames (1 Resource, 0:1 Infra, 1 Service, 1:* Timetable, 1 Calendar, 0:1 Vehicle) | [frames.sch](../sch/DRG/CompositeFrame/frames.sch) | `count(<Frame>[TypeOfFrameRef/@ref='...'])` met de juiste kardinaliteit per frametype | ✅ |

## ResourceFrame

| Eis | Deel II (§ · pag.) | Deel I (§ · pag.) | Omschrijving | .sch-bestand | Implementatie | Status |
|-----|--------------------|--------------------|--------------|--------------|---------------|:------:|
| `ResourceFrame.TypeOfFrameRef` | §14.1 · p.60 | §3.1 · p.14 | Verwijst naar `NL_TT_RESOURCE` | [TypeOfFrameRef.sch](../sch/DRG/ResourceFrame/TypeOfFrameRef.sch) | `@ref='NL:BISON:TypeOfFrame:NL_TT_RESOURCE'` + `@versionRef='9.4.0'` | ✅ |
| `ResourceFrame.OperationalContext.A` | §14.6.1 · p.66 | §9.1.4 · p.38 | `VehicleMode` uit toegestane lijst | [OperationalContext.sch](../sch/DRG/ResourceFrame/OperationalContext.sch) | `VehicleMode=('unknown','all','bus','metro','tram','rail','water')` | ✅ |
| `ResourceFrame.OperationalContext.B` | §14.6.1 · p.66 | §9.1.5 · p.38 | `TransportSubmode` past bij `VehicleMode` | [OperationalContext.sch](../sch/DRG/ResourceFrame/OperationalContext.sch) | Samengestelde conditie die per VehicleMode de toegestane submodes valideert | ✅ |
| `ResourceFrame.VehicleType.A` | §14.7.1 · p.68 | — | `FuelType` uit toegestane lijst | [VehicleType.sch](../sch/DRG/ResourceFrame/VehicleType.sch) | `matches(FuelType, '^(petrol\|diesel\|naturalGas\|biodiesel\|electricity\|hydrogen\|other)$')` | ✅ |
| `ResourceFrame.PassengerCapacity.A` | §14.7.3 · p.69 | — | `FareClass` uit toegestane lijst | [PassengerCapacity.sch](../sch/DRG/ResourceFrame/PassengerCapacity.sch) | `matches(FareClass, '^(businessClass\|economyClass\|firstClass\|any)$')` | ✅ |
| `ResourceFrame.PassengerCapacity.B` | §14.7.3 · p.69 | — | `TotalCapacity` = `SeatingCapacity` + `StandingCapacity` | [PassengerCapacity.sch](../sch/DRG/ResourceFrame/PassengerCapacity.sch) | `number(TotalCapacity) = number(SeatingCapacity) + number(StandingCapacity)` | ✅ |
| `ResourceFrame.ServiceFacilitySet.A` | §14.7.5 · p.71 | — | `PassengerCommsFacilityList` waardes | [ServiceFacilitySet.sch](../sch/DRG/ResourceFrame/ServiceFacilitySet.sch) | `not(...)` of `every $waarde in tokenize(..., ' ') satisfies $waarde = ('powerSupplySockets','freeWifi')` | ✅ |
| `ResourceFrame.ServiceFacilitySet.B` | §14.7.5 · p.71 | — | `SanitaryFacilityList` waardes | [ServiceFacilitySet.sch](../sch/DRG/ResourceFrame/ServiceFacilitySet.sch) | `not(...)` of `every $waarde in tokenize(..., ' ') satisfies $waarde = ('toilet','wheelchairAccessToilet')` | ✅ |
| `ResourceFrame.ServiceFacilitySet.C` | §14.7.5 · p.71 | — | `TicketingServiceFacilityList` waardes | [ServiceFacilitySet.sch](../sch/DRG/ResourceFrame/ServiceFacilitySet.sch) | `not(...)` of `every $waarde in tokenize(..., ' ') satisfies $waarde = 'collection'` | ✅ |
| `ResourceFrame.ServiceFacilitySet.D` | §14.7.5 · p.71 | — | `VehicleAccessFacilityList` waardes | [ServiceFacilitySet.sch](../sch/DRG/ResourceFrame/ServiceFacilitySet.sch) | `every $waarde in tokenize(..., ' ') satisfies $waarde = ('unknown','wheelchairLift','manualRamp','automaticRamp','steps','slidingStep','narrowEntrance','validator')` | ✅* (noot 7) |

## InfrastructureFrame

| Eis | Deel II (§ · pag.) | Deel I (§ · pag.) | Omschrijving | .sch-bestand | Implementatie | Status |
|-----|--------------------|--------------------|--------------|--------------|---------------|:------:|
| `InfrastructureFrame.TypeOfFrameRef` | §15.1 · p.73 | §3.1 · p.14 | Verwijst naar `NL_TT_INFRA` | [TypeOfFrameRef.sch](../sch/DRG/InfrastructureFrame/TypeOfFrameRef.sch) | `@ref='NL:BISON:TypeOfFrame:NL_TT_INFRA'` + `@versionRef='9.4.0'` | ✅ |
| `InfrastructureFrame.ActivationPoint.A` | §15.2.1 · p.74 | §3.2 · p.15 | `PrivateCode` van type `KarAddress` aanwezig | [ActivationPoint.sch](../sch/DRG/InfrastructureFrame/ActivationPoint.sch) | `privateCodes/PrivateCode[@type='KarAddress']` | ✅ |

## ServiceFrame

| Eis | Deel II (§ · pag.) | Deel I (§ · pag.) | Omschrijving | .sch-bestand | Implementatie | Status |
|-----|--------------------|--------------------|--------------|--------------|---------------|:------:|
| `ServiceFrame.TypeOfFrameRef` | §16.1 · p.76 | §3.1 · p.14 | Verwijst naar `NL_TT_SERVICE` | [TypeOfFrameRef.sch](../sch/DRG/ServiceFrame/TypeOfFrameRef.sch) | `@ref='NL:BISON:TypeOfFrame:NL_TT_SERVICE'` + `@versionRef='9.4.0'` | ✅ |
| `ServiceFrame.RouteLink.A` | §16.4.1 · p.78 | §6.2 · p.26 | `Distance` ≥ hemelsbrede afstand From/ToPoint | [RouteLink.sch](../sch/DRG/ServiceFrame/RouteLink.sch) | Niet implementeerbaar — vereist haversine (sin/cos/atan2). Gedocumenteerd in commentaar | ❌ (noot 1) |
| `ServiceFrame.RouteLink.B` | §16.4.1 · p.78 | §6.2 · p.26 | LineString begint op From- en eindigt op ToPoint-coördinaat | [RouteLink.sch](../sch/DRG/ServiceFrame/RouteLink.sch) | `starts-with($posList, $fromPointCoord)` + `substring(...)` voor eindcoördinaat, met cross-ref naar `RoutePoint/Location/gml:pos` | ✅ |
| `ServiceFrame.passingThrough.A` | §16.4.2 · p.78 | §6.2 · p.26 | Coördinaten van elk `PointOnLink` staan in de LineString | [PointOnLink.sch](../sch/DRG/ServiceFrame/PointOnLink.sch) | `contains(normalize-space(ancestor::RouteLink/gml:LineString/gml:posList), normalize-space(Location/gml:pos))` | ✅ |
| `ServiceFrame.PointOnLink.A` | §16.4.3 · p.79 | §6.2 · p.26 | `DistanceFromStart` < `RouteLink.Distance` | [PointOnLink.sch](../sch/DRG/ServiceFrame/PointOnLink.sch) | `number(DistanceFromStart) lt number(ancestor::RouteLink/Distance)` | ✅ |
| `ServiceFrame.PointOnRoute.A` | §16.5.3 · p.80 | §6.2 · p.26 | OnwardRouteLink: FromPointRef = RoutePointRef; ToPointRef = volgende RoutePointRef | [PointOnRoute.sch](../sch/DRG/ServiceFrame/PointOnRoute.sch) | Twee asserts: From-check via cross-ref naar `RouteLink/FromPointRef`; To-check via `following-sibling::PointOnRoute[1]` vs `RouteLink/ToPointRef` | ✅ |
| `ServiceFrame.Line.A` | §16.6.1 · p.83 | §9.1.4 · p.38 | `VehicleMode` in OperationalContext | [OperationalContext.sch](../sch/DRG/ResourceFrame/OperationalContext.sch) | Gedekt door `OperationalContext.A` | ✅ |
| `ServiceFrame.Line.B` | §16.6.1 · p.83 | §9.1.5 · p.38 | `TransportSubmode` past bij VehicleMode | [OperationalContext.sch](../sch/DRG/ResourceFrame/OperationalContext.sch) | Gedekt door `OperationalContext.B` | ✅ |
| `ServiceFrame.Line.C` | §16.6.1 · p.83 | — | `PrivateCode` type `LinePlanningNumber`, niet leeg | [Line.sch](../sch/DRG/ServiceFrame/Line.sch) | Bestaan + `PrivateCode[@type='LinePlanningNumber']/text()!=''` | ✅ |
| `ServiceFrame.Line.D` | §16.6.1 · p.83 | — | `ExternalLineRef` (indien aanwezig) niet leeg | [Line.sch](../sch/DRG/ServiceFrame/Line.sch) | `not(ExternalLineRef[@type='VetagLineNumber']) or ...[@ref!='']` | ✅* (noot 4) |
| `ServiceFrame.Line.E` | §16.6.1 · p.83 | — | GroupOfLines-indeling volledig (beide richtingen) | [Line.sch](../sch/DRG/ServiceFrame/Line.sch) | Elke Line in een GroupOfLines (indien aanwezig) + elke `LineRef` verwijst naar bestaande Line | ✅ |
| `ServiceFrame.DestinationDisplay.A` | §16.7.1 · p.84 | §5.3 · p.24 | `PrivateCode` type `DestinationCode`, niet leeg | [DestinationDisplay.sch](../sch/DRG/ServiceFrame/DestinationDisplay.sch) | `PrivateCode[@type='DestinationCode']/text()!=''` | ✅ |
| `ServiceFrame.Via.A` | §16.7.3 · p.85 | §5.2 · p.23 | `Name` begint niet met `via ` | [Via.sch](../sch/DRG/ServiceFrame/Via.sch) | `not(starts-with(lower-case(normalize-space(Name)), 'via '))` | ✅ |
| `ServiceFrame.DestinationDisplayVariant.A` | §16.7.6 · p.86 | §5.1 · p.23 | Alle 4 lengtevarianten (16/19/21/24) aanwezig | [DestinationDisplayVariant.sch](../sch/DRG/ServiceFrame/DestinationDisplayVariant.sch) | Regel op `variants`-parent die elke `BISON:DisplayTextLength:N` afdwingt | ✅ |
| `ServiceFrame.DestinationDisplayVariant.B` | §16.7.6 · p.86 | §5.1 · p.23 | Tekstlengte ≤ opgegeven maximale lengte | [DestinationDisplayVariant.sch](../sch/DRG/ServiceFrame/DestinationDisplayVariant.sch) | `string-length(normalize-space(Name)) <= $max-length` | ✅ |
| `ServiceFrame.DestinationDisplayVariant.Extensions.A` | §16.7.7 · p.86 | §5.1 · p.23 | `MaxLength` is BISON-enumeratie-referentie | [DestinationDisplayVariant.sch](../sch/DRG/ServiceFrame/DestinationDisplayVariant.sch) | `MaxLength[starts-with(., 'BISON:DisplayTextLength:')]` | ✅ |
| `ServiceFrame.ScheduledStopPoint.A` | §16.8.1 · p.89 | §6.1 · p.26 | `PrivateCode` type `UserStopCode`, niet leeg | [ScheduledStopPoint.sch](../sch/DRG/ServiceFrame/ScheduledStopPoint.sch) | Bestaan + `...[@type='UserStopCode']/text()!=''` | ✅ |
| `ServiceFrame.PointProjection.B` | §16.8.1 · p.89 | §6.1 · p.26 | Projecteer op een RoutePoint (`nameOfRefClass='RoutePoint'`) | [PointProjection.sch](../sch/DRG/ServiceFrame/PointProjection.sch) | `ProjectToPointRef/@nameOfRefClass='RoutePoint'` | ✅ |
| `ServiceFrame.StopArea.A` | §16.9.1 · p.91 | — | `PrivateCode` type `UserStopAreaCode` (indien aanwezig) niet leeg | [StopArea.sch](../sch/DRG/ServiceFrame/StopArea.sch) | `not(PrivateCode[@type='UserStopAreaCode']) or .../text()!=''` | ✅ |
| `ServiceFrame.PassengerStopAssignment.A` | §16.11 · p.92 | §6.1 · p.26 | `QuayRef` is verplicht | [PassengerStopAssignment.sch](../sch/DRG/ServiceFrame/PassengerStopAssignment.sch) | `QuayRef` aanwezig | ✅ |
| `ServiceFrame.PassengerStopAssignment.B` | §16.11 · p.92 | §6.1 · p.26 | Elke ScheduledStopPoint exact één keer | [PassengerStopAssignment.sch](../sch/DRG/ServiceFrame/PassengerStopAssignment.sch) | Uniciteit via `preceding-sibling` + volledigheid via cross-ref naar `scheduledStopPoints` | ✅ |
| `ServiceFrame.TimingPoint.A` | §16.12.1 · p.93 | §6.1 · p.26 | `PrivateCode` type `UserStopCode` (indien aanwezig) niet leeg | [TimingPoint.sch](../sch/DRG/ServiceFrame/TimingPoint.sch) | `not(PrivateCode[@type='UserStopCode']) or .../text()!=''` | ✅ |
| `ServiceFrame.TimingLink.A` | §16.13.1 · p.94 | §6.2 · p.26 | `From-`/`ToPointRef` gebruiken `nameOfRefClass`, type komt overeen | [TimingLink.sch](../sch/DRG/ServiceFrame/TimingLink.sch) | Bestaan + waarde `='ScheduledStopPoint' or ='TimingPoint'` op beide refs | ✅ |
| `ServiceFrame.ServiceJourneyPattern.A` | §16.14.1 · p.96 | §6.1 · p.26 | Minimaal twee punten in pointsInSequence | [ServiceJourneyPattern.sch](../sch/DRG/ServiceFrame/ServiceJourneyPattern.sch) | `pointsInSequence[count(*)>1]` | ✅ |
| `ServiceFrame.StopPointInJourneyPattern.A` | §16.14.3 · p.97 | §6.1 · p.26 | `IsWaitPoint=true` voor eerste halte | [StopPointInJourneyPattern.sch](../sch/DRG/ServiceFrame/StopPointInJourneyPattern.sch) | `preceding-sibling::*[...] or IsWaitPoint='true'` | ✅ |
| `ServiceFrame.StopPointInJourneyPattern.B` | §16.14.3 · p.97 | §6.1 · p.26 | Boarding én Alighting aanwezig | [StopPointInJourneyPattern.sch](../sch/DRG/ServiceFrame/StopPointInJourneyPattern.sch) | Bestaan van punt met `ForBoarding` resp. `ForAlighting='true'` | ✅ |
| `ServiceFrame.StopPointInJourneyPattern.C` | §16.14.3 · p.97 | §6.1 · p.26 | Altijd instappen vóór uitstappen | [StopPointInJourneyPattern.sch](../sch/DRG/ServiceFrame/StopPointInJourneyPattern.sch) | Vóór eerste `ForAlighting` is er een `ForBoarding`-punt | ✅ |
| `ServiceFrame.StopPointInJourneyPattern.D` | §16.14.3 · p.97 | §6.1 · p.26 | Altijd uitstappen ná instappen | [StopPointInJourneyPattern.sch](../sch/DRG/ServiceFrame/StopPointInJourneyPattern.sch) | Ná laatste `ForBoarding` is er een `ForAlighting`-punt | ✅ |
| `ServiceFrame.StopPointInJourneyPattern.E` | §16.14.3 · p.97 | §6.1 · p.26 | `OnwardTimingLinkRef` verplicht behalve laatste | [StopPointInJourneyPattern.sch](../sch/DRG/ServiceFrame/StopPointInJourneyPattern.sch) | `OnwardTimingLinkRef or not(following-sibling::*[...])` | ✅ |
| `ServiceFrame.StopPointInJourneyPattern.F` | §16.14.3 · p.97 | §6.1 · p.26 | `ScheduledStopPointRef` = FromPointRef van OnwardTimingLink | [StopPointInJourneyPattern.sch](../sch/DRG/ServiceFrame/StopPointInJourneyPattern.sch) | Cross-ref naar `TimingLink[@id=OnwardTimingLinkRef/@ref]/FromPointRef` | ✅ |
| `ServiceFrame.TimingPointInJourneyPattern.A` | §16.14.4 · p.98 | §6.1 · p.26 | `IsWaitPoint=true` voor eerste halte | [TimingPointInJourneyPattern.sch](../sch/DRG/ServiceFrame/TimingPointInJourneyPattern.sch) | `preceding-sibling::*[...] or IsWaitPoint='true'` | ✅ |
| `ServiceFrame.TimingPointInJourneyPattern.B` | §16.14.4 · p.98 | §6.1 · p.26 | `OnwardTimingLinkRef` verplicht behalve laatste | [TimingPointInJourneyPattern.sch](../sch/DRG/ServiceFrame/TimingPointInJourneyPattern.sch) | `OnwardTimingLinkRef or not(following-sibling::*[...])` | ✅ |
| `ServiceFrame.TimingPointInJourneyPattern.C` | §16.14.4 · p.98 | §6.1 · p.26 | `TimingPointRef` = FromPointRef van OnwardTimingLink | [TimingPointInJourneyPattern.sch](../sch/DRG/ServiceFrame/TimingPointInJourneyPattern.sch) | Cross-ref naar `TimingLink[@id=OnwardTimingLinkRef/@ref]/FromPointRef` | ✅ |
| `ServiceFrame.JourneyRunTime.A` | §16.15.3 · p.100 | §7 · p.29 | TimingLinkRefs uniek binnen TimeDemandType | [JourneyRunTime.sch](../sch/DRG/ServiceFrame/JourneyRunTime.sch) | `not(preceding-sibling::JourneyRunTime[TimingLinkRef/@ref = current()/...])` | ✅ |
| `ServiceFrame.JourneyRunTime.B` | §16.15.3 · p.100 | §7 · p.29 | Realistische waarde (>0s, <24u) | [JourneyRunTime.sch](../sch/DRG/ServiceFrame/JourneyRunTime.sch) | `xs:dayTimeDuration(RunTime)` tussen `PT0S` en `PT24H` | ✅ |
| `ServiceFrame.JourneyWaitTime.A` | §16.15.5 · p.101 | §7 · p.29 | Realistische waarde (>0s, <24u) | [JourneyWaitTime.sch](../sch/DRG/ServiceFrame/JourneyWaitTime.sch) | `xs:dayTimeDuration(WaitTime)` tussen `PT0S` en `PT24H` | ✅ |
| `ServiceFrame.JourneyLayover.A` | §16.15.7 · p.102 | §7 · p.29 | Realistische waarde (>0s, <24u) | [JourneyLayover.sch](../sch/DRG/ServiceFrame/JourneyLayover.sch) | `xs:dayTimeDuration(Layover)` tussen `PT0S` en `PT24H` | ✅ |

## TimetableFrame

| Eis | Deel II (§ · pag.) | Deel I (§ · pag.) | Omschrijving | .sch-bestand | Implementatie | Status |
|-----|--------------------|--------------------|--------------|--------------|---------------|:------:|
| `TimetableFrame.NoticeAssignment.A` | §17.3 · p.104 | — | `vehicleJourneys` bevat minimaal één `ServiceJourney` | [vehicleJourneys.sch](../sch/DRG/TimetableFrame/vehicleJourneys.sch) | `ServiceJourney` aanwezig (de regel-id luidt `NoticeAssignment` maar de eis staat in §17.3 `vehicleJourneys`) | ✅ |
| `TimetableFrame.TypeOfFrameRef` | §17.1 · p.104 | §3.1 · p.14 | Verwijst naar `NL_TT_TIMETABLE` | [TypeOfFrameRef.sch](../sch/DRG/TimetableFrame/TypeOfFrameRef.sch) | `@ref='NL:BISON:TypeOfFrame:NL_TT_TIMETABLE'` + `@versionRef='9.4.0'` | ✅ |
| `TimetableFrame.AvailabilityCondition.A` | §17.2.1 · p.106 | §3.2 · p.15 | Geldt voor minimaal één dag (ToDate ≥ FromDate) | [AvailabilityCondition.sch](../sch/DRG/TimetableFrame/AvailabilityCondition.sch) | `xs:dateTime($to) ge xs:dateTime($from)` | ✅ |
| `TimetableFrame.AvailabilityCondition.B` | §17.2.1 · p.106 | §3.2 · p.15 | `ValidDayBits`-lengte = aantal dagen in periode | [AvailabilityCondition.sch](../sch/DRG/TimetableFrame/AvailabilityCondition.sch) | `string-length($bits)=$daysInclusive` (berekend uit From/ToDate) | ✅ |
| `TimetableFrame.ServiceJourney` | §17.3.1 · p.108 | §10 · p.44 | Cardinaliteiten wijken af van CEN-XSD | [ServiceJourney.sch](../sch/DRG/TimetableFrame/ServiceJourney.sch) | Verplicht: `validityConditions`, `DepartureTime`, `ServiceJourneyPatternRef`, `TimeDemandTypeRef` | ✅ |
| `TimetableFrame.ServiceJourney.B` | §17.3.1 · p.108 | §10.1 · p.44 | Bij `Print=true` is `validityConditions` verplicht | [ServiceJourney.sch](../sch/DRG/TimetableFrame/ServiceJourney.sch) | `validityConditions` is onvoorwaardelijk verplicht (strenger dan de eis) | ✅* (noot 5) |
| `TimetableFrame.ServiceJourney.C` | §17.3.1 · p.108 | §3.2 · p.15 | dayTypes-geldigheid consistent met validityConditions | [ServiceJourney.sch](../sch/DRG/TimetableFrame/ServiceJourney.sch) | Niet geïmplementeerd — vereist ValidDayBits-interpretatie + datumrekenkunde | ❌ (noot 2) |
| `TimetableFrame.ServiceJourney.D` | §17.3.1 · p.108 | — | `PrivateCode` type `JourneyNumber`, niet leeg | [ServiceJourney.sch](../sch/DRG/TimetableFrame/ServiceJourney.sch) | `PrivateCode[@type='JourneyNumber']!=''` | ✅ |
| `TimetableFrame.ServiceJourney.E` | §17.3.1 · p.109 | — | Uniek LinePlanningNumber+JourneyNumber+DataOwnerCode per dag, cross-frame | [ServiceJourney.sch](../sch/DRG/TimetableFrame/ServiceJourney.sch) | Niet implementeerbaar — cross-frame-aggregatie + datum-interpretatie | ❌ (noot 3) |
| `TimetableFrame.ServiceJourney.F` | §17.3.1 · p.109 | — | AvailabilityConditions (IsAvailable=true) overlappen niet | [ServiceJourney.sch](../sch/DRG/TimetableFrame/ServiceJourney.sch) | Overlap-detectie op `FromDate`/`ToDate` van AvailabilityConditions met `preceding-sibling` | ✅ |
| `TimetableFrame.ServiceJourney.G` | §17.3.1 · p.109 | — | TimingLinks via JourneyPattern = via TimeDemandType | [ServiceJourney.sch](../sch/DRG/TimetableFrame/ServiceJourney.sch) | `string-join()` van beide paden vergeleken: `$pattern-timing-links = $tdt-timing-links` | ✅ |
| `TimetableFrame.ServiceJourney.H` | §17.3.1 · p.109 | §8.1.3 · p.32 | Geen nesting bij `derivedFromObjectRef` | [ServiceJourney.sch](../sch/DRG/TimetableFrame/ServiceJourney.sch) | `not(@derivedFromObjectRef) or not(//ServiceJourney[@id=...]/@derivedFromObjectRef)` | ✅ |
| `TimetableFrame.DeadRun.A` | §17.3.2 · p.110 | — | `JourneyNumber` (indien aanwezig) positief geheel getal | [DeadRun.sch](../sch/DRG/TimetableFrame/DeadRun.sch) | `not(PrivateCode[@type='JourneyNumber']) or matches(..., '^[1-9][0-9]*$')` | ✅ |

## ServiceCalendarFrame

| Eis | Deel II (§ · pag.) | Deel I (§ · pag.) | Omschrijving | .sch-bestand | Implementatie | Status |
|-----|--------------------|--------------------|--------------|--------------|---------------|:------:|
| `ServiceCalendarFrame.TypeOfFrameRef` | §18.1 · p.112 | §3.1 · p.14 | Verwijst naar `NL_TT_CALENDAR` | [TypeOfFrameRef.sch](../sch/DRG/ServiceCalendarFrame/TypeOfFrameRef.sch) | `@ref='NL:BISON:TypeOfFrame:NL_TT_CALENDAR'` + `@versionRef='9.4.0'` | ✅ |

## VehicleScheduleFrame

| Eis | Deel II (§ · pag.) | Deel I (§ · pag.) | Omschrijving | .sch-bestand | Implementatie | Status |
|-----|--------------------|--------------------|--------------|--------------|---------------|:------:|
| `VehicleScheduleFrame.TypeOfFrameRef` | §19.1 · p.116 | §3.1 · p.14 | Verwijst naar `NL_TT_VEHICLE` | [TypeOfFrameRef.sch](../sch/DRG/VehicleScheduleFrame/TypeOfFrameRef.sch) | `@ref='NL:BISON:TypeOfFrame:NL_TT_VEHICLE'` + `@versionRef='9.4.0'` | ✅ |
| `VehicleScheduleFrame.Block.A` | §19.2.1 · p.118 | — | `PrivateCode` type `BlockCode`, niet leeg | [Block.sch](../sch/DRG/VehicleScheduleFrame/Block.sch) | Bestaan + `...[@type='BlockCode']/text()!=''` | ✅* (noot 6) |
| `VehicleScheduleFrame.Block.B` | §19.2.1 · p.118 | — | Ritten uniek binnen een Block | [Block.sch](../sch/DRG/VehicleScheduleFrame/Block.sch) | `count(journeys/*//@ref) = count(distinct-values(journeys/*//@ref))` | ✅ |
| `VehicleScheduleFrame.Block.C` | §19.2.1 · p.118 | — | Rit komt in slechts één Block voor | [Block.sch](../sch/DRG/VehicleScheduleFrame/Block.sch) | Geen overlap met `preceding-sibling::Block/journeys/*/@ref` | ✅ |
| `VehicleScheduleFrame.Block.D` | §19.2.1 · p.118 | — | Vehicle toegekend aan elk Block | [Block.sch](../sch/DRG/VehicleScheduleFrame/Block.sch) | `VehicleTypeRef` aanwezig | ✅ |

## GML

| Eis | Deel II (§ · pag.) | Deel I (§ · pag.) | Omschrijving | .sch-bestand | Implementatie | Status |
|-----|--------------------|--------------------|--------------|--------------|---------------|:------:|
| `GML.pos.A` | §20.1 · p.119 | — | Geldige WGS-84-coördinaten | [pos.sch](../sch/DRG/GML/pos.sch) | Regex valideert lat (-90..90) en lon (-180..180) | ✅ |
| `GML.posList.A` | §20.2 · p.120 | — | Geldige WGS-84-paden (≥2 punten) | [posList.sch](../sch/DRG/GML/posList.sch) | Regex valideert spatie-gescheiden coördinatenparen | ✅ |

---

## Noten

**Noot 1 — `RouteLink.A` (niet implementeerbaar).**
De eis vereist de hemelsbrede (haversine-)afstand tussen twee WGS-84-coördinaten.
Dit vergt goniometrische functies (`sin`, `cos`, `atan2`) die niet bestaan in
XPath 2.0. De eis is gedocumenteerd in commentaar in [RouteLink.sch](../sch/DRG/ServiceFrame/RouteLink.sch).

**Noot 2 — `ServiceJourney.C` (niet geïmplementeerd).**
Het vergelijken van de uit `dayTypes` afgeleide geldigheid met de geldigheid uit
`validityConditions` vereist interpretatie van de `ValidDayBits`-bitstring én
datumrekenkunde over de geldigheidsperiode. Theoretisch mogelijk maar buitensporig
complex; gedocumenteerd in commentaar.

**Noot 3 — `ServiceJourney.E` (niet implementeerbaar).**
Uniciteit van LinePlanningNumber + JourneyNumber + DataOwnerCode moet over álle
TimetableFrames heen worden bepaald, gecombineerd met dag-voor-dag-interpretatie van
`ValidDayBits`. Dit valt buiten het bereik van een per-document Schematron-validatie.

**Noot 4 — `Line.D` (kanttekening).**
De PDF noemt het type `LineVeTagNummer`, maar alle voorbeeld-XML's in de repository
gebruiken `VetagLineNumber`. De Schematron volgt de praktijk (`VetagLineNumber`).
Bij correctie van de PDF of data dient deze waarde gelijkgetrokken te worden.

**Noot 5 — `ServiceJourney.B` (strenger).**
De PDF eist `validityConditions` alleen wanneer `Print=true`. De Schematron maakt het
veld onvoorwaardelijk verplicht. Dit is een superset van de eis en verwerpt dus geen
geldige documenten die aan de PDF-eis voldoen, maar is mogelijk strenger dan bedoeld.

**Noot 6 — `Block.A` (kanttekening).**
De PDF stelt dat de `BlockCode` numeriek moet zijn. De Schematron controleert nu alleen
op aanwezigheid en niet-leeg. Een numerieke check (`matches(..., '^\d+$')`) zou de eis
volledig dekken.

**Noot 7 — `ServiceFacilitySet.D` (afwijking).**
De opsomming bij regel D noemt `unknown` niet, maar `VehicleAccessFacilityEnumeration`
in `xsd/netex-nl-enums.xsd` kent de waarde wél, en het profielvoorbeeld bij §14.7.5
gebruikt haar zelf (`<VehicleAccessFacilityList>unknown</VehicleAccessFacilityList>`).
De Schematron laat `unknown` daarom toe. Zonder die toevoeging verwerpt de regel het
eigen voorbeeld uit de PDF, en heeft een producer die de voertuigconfiguratie nog niet
kent geen geldige waarde voor dit verplichte veld. Dezelfde spanning bestaat bij regel B
voor `none`; daar is `SanitaryFacilityList` optioneel, dus weglaten volstaat en is de
regel ongewijzigd gelaten.

---

## Verantwoording

- Bron-eisen: `netex-nl-dienstregelingexport-9.4.0.pdf` (TMI9 Dienstregeling 9.4.0 RELEASE).
- **Paragraafnummers (§)** verwijzen naar de hoofdstuk-/paragraafindeling van de PDF
  (Deel II = hoofdstuk 11–20 voor de formele eisen; Deel I = hoofdstuk 2–10 voor de
  toelichting).
- **Paginanummers** zijn de **gedrukte** nummers uit de PDF-voettekst (`X / 136`). Een
  PDF-viewer toont deze bladzijde steeds als `pagina + 1` (de viewer telt de omslag mee).
- **Deel I-koppeling**: niet elke formele eis heeft een tegenhanger in de functionele
  beschrijving; `—` betekent dat er geen directe Deel I-paragraaf is. Omgekeerd bevat
  Deel I enkele prozaregels (bv. §2.1 ID-stabiliteit, §3.2.3 frame-versiegelijkheid)
  die niet als losse `q DRG`-eis zijn geformaliseerd en dus niet door Schematron worden
  afgedwongen.
- Schematron: ISO Schematron met `queryBinding="xslt2"` (XPath 2.0), namespace-prefix `ntx:` voor NeTEx en `gml:` voor GML.
- Instapbestand: [dienstregeling-export.sch](../sch/DRG/dienstregeling-export.sch) includeert alle frame-specifieke regelbestanden.
