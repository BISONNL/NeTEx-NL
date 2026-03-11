<sch:pattern id="DRG.ServiceFrame.JourneyRunTime" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:timeDemandTypes/ntx:TimeDemandType/ntx:runtimes/ntx:JourneyRunTime">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="ntx:TimingLinkRef">TimingLinkRef is verplicht</sch:assert>
        <sch:assert test="ntx:RunTime">RunTime is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <!-- TODO Alle TimingLinkRefs in de JourneyRunTimes van een TimeDemandType dienen uniek te zijn binnen de rit. -->

        <!-- B -->
        <!-- TODO De RunTime moet groter zijn dan 0 seconden en kleiner dan 24 uur. -->
    </sch:rule>
</sch:pattern>