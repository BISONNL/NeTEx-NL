<!-- Profile selection migrated from TypeOfFrameRef to Extensions/ProfileMarker.
     Frame composition rules now check for the presence of the correct frame element types,
     not for TypeOfFrameRef values on child frames. -->
<sch:pattern id="DRG.CompositeFrame.frames" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:CompositeFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:frames">
        <sch:assert test="count(ntx:ResourceFrame)=1">Er moet exact 1 ResourceFrame worden geleverd als onderdeel van de dienstregeling</sch:assert>
        <sch:assert test="count(ntx:InfrastructureFrame) &lt; 2">Er moet 0 of 1 InfrastructureFrames worden geleverd als onderdeel van de dienstregeling</sch:assert>
        <sch:assert test="count(ntx:ServiceFrame)=1">Er moet exact 1 ServiceFrame worden geleverd als onderdeel van de dienstregeling</sch:assert>
        <sch:assert test="count(ntx:TimetableFrame) &gt; 0">Er moet minimaal 1 TimetableFrame worden geleverd als onderdeel van de dienstregeling</sch:assert>
        <sch:assert test="count(ntx:ServiceCalendarFrame)=1">Er moet exact 1 ServiceCalendarFrame worden geleverd als onderdeel van de dienstregeling</sch:assert>
        <sch:assert test="count(ntx:VehicleScheduleFrame)=1">Er moet exact 1 VehicleScheduleFrame worden geleverd als onderdeel van de dienstregeling</sch:assert>
    </sch:rule>
</sch:pattern>
