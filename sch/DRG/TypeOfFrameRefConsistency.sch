<!-- Optional TypeOfFrameRef consistency checks.
     TypeOfFrameRef is no longer required for NL profile selection (that role is now
     fulfilled by Extensions/ProfileMarker). However, when TypeOfFrameRef IS present,
     its value must be consistent with the frame type and the declared profile. -->
<sch:pattern id="DRG.TypeOfFrameRefConsistency" xmlns:sch="http://purl.oclc.org/dsdl/schematron">

    <!-- CompositeFrame: if TypeOfFrameRef is present, it must match NL_TT_BASELINE -->
    <sch:rule context="ntx:CompositeFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:TypeOfFrameRef">
        <sch:assert test="normalize-space(@ref)='NL:BISON:TypeOfFrame:NL_TT_BASELINE'">TypeOfFrameRef is optioneel, maar indien aanwezig moet ref="NL:BISON:TypeOfFrame:NL_TT_BASELINE" zijn voor een NL-BISON-TIMETABLE CompositeFrame.</sch:assert>
        <sch:assert test="normalize-space(@version)='9.4.0'">TypeOfFrameRef is optioneel, maar indien aanwezig moet version="9.4.0" zijn.</sch:assert>
    </sch:rule>

    <!-- ResourceFrame: if TypeOfFrameRef is present, it must match NL_TT_RESOURCE -->
    <sch:rule context="ntx:ResourceFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:TypeOfFrameRef">
        <sch:assert test="normalize-space(@ref)='NL:BISON:TypeOfFrame:NL_TT_RESOURCE'">TypeOfFrameRef is optioneel, maar indien aanwezig moet ref="NL:BISON:TypeOfFrame:NL_TT_RESOURCE" zijn voor een ResourceFrame in het NL-BISON-TIMETABLE profiel.</sch:assert>
        <sch:assert test="normalize-space(@version)='9.4.0'">TypeOfFrameRef is optioneel, maar indien aanwezig moet version="9.4.0" zijn.</sch:assert>
    </sch:rule>

    <!-- ServiceCalendarFrame: if TypeOfFrameRef is present, it must match NL_TT_CALENDAR -->
    <sch:rule context="ntx:ServiceCalendarFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:TypeOfFrameRef">
        <sch:assert test="normalize-space(@ref)='NL:BISON:TypeOfFrame:NL_TT_CALENDAR'">TypeOfFrameRef is optioneel, maar indien aanwezig moet ref="NL:BISON:TypeOfFrame:NL_TT_CALENDAR" zijn voor een ServiceCalendarFrame in het NL-BISON-TIMETABLE profiel.</sch:assert>
        <sch:assert test="normalize-space(@version)='9.4.0'">TypeOfFrameRef is optioneel, maar indien aanwezig moet version="9.4.0" zijn.</sch:assert>
    </sch:rule>

    <!-- ServiceFrame: if TypeOfFrameRef is present, it must match NL_TT_SERVICE -->
    <sch:rule context="ntx:ServiceFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:TypeOfFrameRef">
        <sch:assert test="normalize-space(@ref)='NL:BISON:TypeOfFrame:NL_TT_SERVICE'">TypeOfFrameRef is optioneel, maar indien aanwezig moet ref="NL:BISON:TypeOfFrame:NL_TT_SERVICE" zijn voor een ServiceFrame in het NL-BISON-TIMETABLE profiel.</sch:assert>
        <sch:assert test="normalize-space(@version)='9.4.0'">TypeOfFrameRef is optioneel, maar indien aanwezig moet version="9.4.0" zijn.</sch:assert>
    </sch:rule>

    <!-- TimetableFrame: if TypeOfFrameRef is present, it must match NL_TT_TIMETABLE -->
    <sch:rule context="ntx:TimetableFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:TypeOfFrameRef">
        <sch:assert test="normalize-space(@ref)='NL:BISON:TypeOfFrame:NL_TT_TIMETABLE'">TypeOfFrameRef is optioneel, maar indien aanwezig moet ref="NL:BISON:TypeOfFrame:NL_TT_TIMETABLE" zijn voor een TimetableFrame in het NL-BISON-TIMETABLE profiel.</sch:assert>
        <sch:assert test="normalize-space(@version)='9.4.0'">TypeOfFrameRef is optioneel, maar indien aanwezig moet version="9.4.0" zijn.</sch:assert>
    </sch:rule>

    <!-- InfrastructureFrame: if TypeOfFrameRef is present, it must match NL_TT_INFRA -->
    <sch:rule context="ntx:InfrastructureFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:TypeOfFrameRef">
        <sch:assert test="normalize-space(@ref)='NL:BISON:TypeOfFrame:NL_TT_INFRA'">TypeOfFrameRef is optioneel, maar indien aanwezig moet ref="NL:BISON:TypeOfFrame:NL_TT_INFRA" zijn voor een InfrastructureFrame in het NL-BISON-TIMETABLE profiel.</sch:assert>
        <sch:assert test="normalize-space(@version)='9.4.0'">TypeOfFrameRef is optioneel, maar indien aanwezig moet version="9.4.0" zijn.</sch:assert>
    </sch:rule>

    <!-- VehicleScheduleFrame: if TypeOfFrameRef is present, it must match NL_TT_VEHICLE -->
    <sch:rule context="ntx:VehicleScheduleFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:TypeOfFrameRef">
        <sch:assert test="normalize-space(@ref)='NL:BISON:TypeOfFrame:NL_TT_VEHICLE'">TypeOfFrameRef is optioneel, maar indien aanwezig moet ref="NL:BISON:TypeOfFrame:NL_TT_VEHICLE" zijn voor een VehicleScheduleFrame in het NL-BISON-TIMETABLE profiel.</sch:assert>
        <sch:assert test="normalize-space(@version)='9.4.0'">TypeOfFrameRef is optioneel, maar indien aanwezig moet version="9.4.0" zijn.</sch:assert>
    </sch:rule>

</sch:pattern>
