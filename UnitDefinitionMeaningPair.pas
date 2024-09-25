(*
Domain class for definition-meaning pairs.
*)
unit UnitDefinitionMeaningPair;

interface
    type
        TDefinitionMeaningPair = class(TObject)
            private
                category: integer;
                definition, meaning: String;

            public
                constructor Create(categoryOfNewPair: integer; definitionOfNewPair, meaningOfNewPair: string);

                function GetCategory: integer;

                function GetDefinition: string;

                function GetMeaning: string;
        end;

implementation
    constructor TDefinitionMeaningPair.Create(categoryOfNewPair: integer; definitionOfNewPair, meaningOfNewPair: string);
    begin
    category := categoryOfNewPair;
    definition := definitionOfNewPair;
    meaning := meaningOfNewPair;
    end;

    function TDefinitionMeaningPair.GetCategory: integer;
    begin
    Result := category;
    end;

    function TDefinitionMeaningPair.GetDefinition;
    begin
    Result := definition;
    end;

    function TDefinitionMeaningPair.GetMeaning;
    begin
    Result := meaning;
    end;
end.
