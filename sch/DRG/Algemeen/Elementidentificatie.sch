<!-- ID naming convention -->
<sch:pattern id="IdNamingConvention" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:rule context="//ntx:CompositeFrame">
        <sch:assert test=".[matches(@id, '^NL:[a-zA-Z0-9]+:CompositeFrame:[a-zA-Z0-9\-_]+$')]">CompositeFrame voldoet niet aan naamgevingseisen. Het id attribuut moet een waarde hebben van de vorm: NL:[Codespace]:CompositeFrame:[UniqueValue]</sch:assert>
    </sch:rule>
    <sch:rule context="//ntx:GeneralFrame">
        <sch:assert test=".[matches(@id, '^NL:[a-zA-Z0-9]+:GeneralFrame:[a-zA-Z0-9\-_]+$')]">GeneralFrame voldoet niet aan naamgevingseisen. Het id attribuut moet een waarde hebben van de vorm: NL:[Codespace]:GeneralFrame:[UniqueValue]</sch:assert>
    </sch:rule>
    <sch:rule context="//ntx:Codespace">
        <sch:assert test=".[matches(@id, '^NL:BISON:Codespace:[a-zA-Z0-9\-_]+$')]">Codespace voldoet niet aan naamgevingseisen. Het id attribuut moet een waarde hebben van de vorm: NL:BISON:Codespace:[UniqueValue]</sch:assert>
    </sch:rule>
    <sch:rule context="//ntx:ValueSet">
        <sch:assert test=".[matches(@id, '^NL:[a-zA-Z0-9]+:ValueSet:[a-zA-Z0-9\-_]+$')]">CompositeFrame voldoet niet aan naamgevingseisen. Het id attribuut moet een waarde hebben van de vorm: NL:BISON:Codespace:[UniqueValue]</sch:assert>
    </sch:rule>
    <sch:rule context="//ntx:TypeOfFrame">
        <sch:assert test=".[matches(@id, '^NL:BISON:TypeOfFrame:[a-zA-Z0-9\-_]+$')]">TypeOfFrame voldoet niet aan naamgevingseisen. Het id attribuut moet een waarde hebben van de vorm: NL:BISON:TypeOfFrame:[UniqueValue]</sch:assert>
    </sch:rule>
    <sch:rule context="//*[matches(@id,'^NL:(DOVA|BISON):.*$')]">
        <sch:assert test=".[matches(@id, '^NL:[a-zA-Z0-9]+:[a-zA-Z0-9]+:[a-zA-Z0-9\-_]+$')]">Element uit DOVA-lijsten of BISON-enumeraties voldoet niet aan naamgevingseisen. Het id attribuut moet een waarde hebben van de vorm: NL:[Codespace]:[ObjectType]:[UniqueValue]</sch:assert>
        <sch:assert test="@version='any'">Het version attribuut van een element uit de DOVA-lijsten moet waarde 'any' hebben.</sch:assert>
    </sch:rule>
    <sch:rule context="ntx:PublicationDelivery//*[@id]">
        <sch:assert test=".[matches(@id, '^NL:[a-zA-Z0-9]+:[a-zA-Z0-9]+:[a-zA-Z0-9\-_]+$')] and .[not(matches(@id, '^NL:(DOVA|BISON):.+$'))]">Element voldoet niet aan naamgevingseisen. Het id attribuut moet een waarde hebben van de vorm: NL:[Codespace]:[ObjectType]:[UniqueValue]. De waarde voor [Codespace] mag daarbij niet gelijk zijn aan DOVA of BISON.</sch:assert>
        <sch:assert test="not(@version) or .[matches(@version, '^\d+$')]">Het version attribuut moet een getal zijn.</sch:assert>
    </sch:rule>
</sch:pattern>
