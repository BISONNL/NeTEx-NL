<sch:pattern id="DRG.ServiceFrame.RouteLink" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="ntx:ServiceFrame[ntx:Extensions/bpf:ProfileMarker[bpf:ProfileCode='NL-BISON-TIMETABLE']]/ntx:routeLinks/ntx:RouteLink">
        <!-- Variables for use in business rule -->

        <!-- Cardinality and data-type constraints -->
        <sch:assert test="gml:LineString">LineString is verplicht</sch:assert>

        <!-- Other business rules -->
        <!-- A -->
        <!-- De DistanceFromStart van een PointOnLink is kleiner dan de Distance van de bijbehorende RouteLink. -->

        <!-- B -->
        <!-- Het geografisch pad dat gegeven is in de LineString begint op de coördinaat van de FromPointRef en eindigt op de coördinaat van de ToPointRef. -->
    </sch:rule>
</sch:pattern>