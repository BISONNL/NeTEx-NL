<!-- Profile selection is based on Extensions/ProfileMarker (urn:bison:profile namespace),
     not on TypeOfFrameRef. This pattern validates that each frame in the NL BISON timetable
     profile carries a correct local profile marker. -->
<sch:pattern id="DRG.ProfileMarker" xmlns:sch="http://purl.oclc.org/dsdl/schematron">

    <!-- CompositeFrame must carry the NL-BISON-TIMETABLE profile marker -->
    <sch:rule context="ntx:CompositeFrame">
        <sch:assert test="ntx:Extensions/bpf:ProfileMarker/bpf:ProfileCode='NL-BISON-TIMETABLE'">CompositeFrame moet een Extensions/ProfileMarker bevatten met ProfileCode 'NL-BISON-TIMETABLE' (urn:bison:profile namespace).</sch:assert>
        <sch:assert test="ntx:Extensions/bpf:ProfileMarker/bpf:ProfileVersion='9.4.0'">CompositeFrame moet een Extensions/ProfileMarker bevatten met ProfileVersion '9.4.0'.</sch:assert>
    </sch:rule>

    <!-- Each child frame inside a profiled CompositeFrame must also carry the profile marker -->
    <sch:rule context="ntx:CompositeFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:frames/ntx:ResourceFrame |
                       ntx:CompositeFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:frames/ntx:ServiceCalendarFrame |
                       ntx:CompositeFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:frames/ntx:ServiceFrame |
                       ntx:CompositeFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:frames/ntx:TimetableFrame |
                       ntx:CompositeFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:frames/ntx:InfrastructureFrame |
                       ntx:CompositeFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:frames/ntx:VehicleScheduleFrame">
        <sch:assert test="ntx:Extensions/bpf:ProfileMarker/bpf:ProfileCode='NL-BISON-TIMETABLE'">Elk frame binnen een NL-BISON-TIMETABLE CompositeFrame moet een Extensions/ProfileMarker bevatten met ProfileCode 'NL-BISON-TIMETABLE'.</sch:assert>
        <sch:assert test="ntx:Extensions/bpf:ProfileMarker/bpf:ProfileVersion='9.4.0'">Elk frame binnen een NL-BISON-TIMETABLE CompositeFrame moet een Extensions/ProfileMarker bevatten met ProfileVersion '9.4.0'.</sch:assert>
    </sch:rule>

</sch:pattern>
