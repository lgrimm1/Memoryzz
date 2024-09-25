(*
In-memory database class for definition-meaning pairs.
*)
unit UnitPairs;

interface
    uses
        System.SysUtils, System.Classes,
        UnitCategories, UnitDefinitionMeaningPair;

    type
        TPairs = class(TObject)
            private
                pairList: TList;

            public
                constructor Create;

                //returns -1 when definition already exists
                function AddUniquePair(pair: TDefinitionMeaningPair): integer;

                function AddPair(pair: TDefinitionMeaningPair): integer;

                //returns nil when index is not proper
                function GetPair(index: integer): TDefinitionMeaningPair;

                //returns -1 when index is not proper
                function IndexOf(definition: string): integer;

                //returns false when index is not proper
                function ModifyPair(index: integer; newPair: TDefinitionMeaningPair): boolean;

                function DeletePair(index: integer): boolean;

                procedure DeleteAll;

                //returns empty TPairs when there is no such category, returns all when category is -1
                function GetPairsByCategory(category: integer): TPairs;

                //returns empty TPairs when count is below 1
                function GetPairsByCountRandomly(count: integer): TPairs;

                function GetCount: integer;
        end;

implementation
    constructor TPairs.Create;
    begin
    pairList := TList.Create;
    end;

    function TPairs.AddUniquePair(pair: TDefinitionMeaningPair): integer;
    var
        index: integer;
        newDefinitionCapital: string;
    begin
    newDefinitionCapital := UpperCase(pair.GetDefinition);
    index := 0;
    while (index < pairList.Count) and (UpperCase(TDefinitionMeaningPair(pairList.Items[index]).GetDefinition) <> newDefinitionCapital) do
        index := index+1;
    if index = pairList.Count then
        Result := pairList.Add(pair)
    else
        Result := -1;
    end;

    function TPairs.AddPair(pair: TDefinitionMeaningPair): integer;
    begin
    Result := pairList.Add(pair)
    end;

    function TPairs.GetPair(index: Integer): TDefinitionMeaningPair;
    begin
    if (index < 0) or (index > pairList.Count) then
        Result := nil;
    Result := TDefinitionMeaningPair(pairList.Items[index]);
    end;

    function TPairs.IndexOf(definition: string): integer;
    var
        index: integer;
        definitionCapital: string;
    begin
    definitionCapital := UpperCase(definition);
    index := 0;
    while (index < pairList.Count) and (UpperCase(TDefinitionMeaningPair(pairList.Items[index]).GetDefinition) <> definitionCapital) do
        index := index + 1;
    if index = pairList.Count then
        Result := -1
    else
        Result := index;
    end;

    function TPairs.ModifyPair(index: Integer; newPair: TDefinitionMeaningPair): boolean;
    begin
    if (index < 0) or (index > pairList.Count) then
        Result := false;
    TDefinitionMeaningPair(pairList.Items[index]).Free;
    pairList.Items[index] := newPair;
    Result := true;
    end;

    function TPairs.DeletePair(index: Integer): boolean;
    begin
    if (index < 0) or (index > pairList.Count - 1) then
        Result := false;
    TDefinitionMeaningPair(pairList.Items[index]).Free;
    pairList.Delete(index);
    Result := true;
    end;

    procedure TPairs.DeleteAll;
    var index: integer;
    begin
    for index := 0 to pairList.Count - 1 do
        TDefinitionMeaningPair(pairList.Items[index]).Free;
    pairList.Clear;
    end;

    function TPairs.GetPairsByCategory(category: integer): TPairs;
    var
        filteredPairs: TPairs;
        index: integer;
    begin
    filteredPairs := TPairs.Create;
    for index := 0 to pairList.Count - 1 do
        if (category = -1) or (TDefinitionMeaningPair(pairList[index]).GetCategory = category) then
            filteredPairs.AddUniquePair(TDefinitionMeaningPair(pairList[index]));
    Result := filteredPairs;
    end;

    function TPairs.GetPairsByCountRandomly(count: integer): TPairs;
    var
        actualCount: integer;
        filteredPairs: TPairs;
        pairsSize: integer;
    begin
    filteredPairs := TPairs.Create;
    pairsSize := pairList.Count;
    for actualCount := 1 to count do
        filteredPairs.AddPair(pairList.Items[Random(pairsSize)]);
    Result := filteredPairs;
    end;

    function TPairs.GetCount: integer;
    begin
    Result := pairList.Count;
    end;
end.
