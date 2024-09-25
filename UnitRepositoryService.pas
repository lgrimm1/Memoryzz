(*
Repository service class.
*)
unit UnitRepositoryService;

interface

uses
    System.Classes,
    UnitRepository, UnitPairs, UnitCategories, UnitDefinitionMeaningPair;

type
    TRepositoryService = class(TObject)
        private
            repo: TRepository;
            pairs: TPairs;
            categories: TCategories;

        public

            function Inicialize(dataFolder: string): boolean;

            function GenerateCategoryList: TStringList;

            function GetCategoryCount: integer;

            function GetPairCount: integer;

            //invoke only before freeing the object
            procedure FreeContainers;

            function GetPairsByCategory(category: integer): TPairs;

            function GetPairsByCountRandomly(count: integer): TPairs;
    end;

implementation
    function TRepositoryService.Inicialize(dataFolder: string): boolean;
    var
        categoryCount: integer;
        pairsInStringList: TStringList;
        pair: TDefinitionMeaningPair;
        tabPosition: integer;
        indexInCategories, indexInStringList: integer;
    begin
    repo := TRepository.Create;
    if not repo.SetDataFolder(dataFolder) then
        begin
        Result := false;
        end;
    categories := TCategories.Create;
    categories.AddCategories(repo.ReadCategoryList);
    pairs := TPairs.Create;
    categoryCount := categories.GetCount;
    for indexInCategories := 0 to categoryCount - 1 do
        begin
        pairsInStringList := repo.ReadPairsByCategory(categories.GetCategoryByIndex(indexInCategories));
        for indexInStringList := 0 to pairsInStringList.Count - 1 do
            begin
            tabPosition := Pos(#9, pairsInStringList[indexInStringList]);
            pair := TDefinitionMeaningPair.Create(
                    indexInCategories,
                    Copy(pairsInStringList[indexInStringList], 1, tabPosition - 1),
                    Copy(pairsInStringList[indexInStringList], tabPosition + 1, Length(pairsInStringList[indexInStringList]))
                    );
            pairs.AddUniquePair(pair);
            end;
        pairsInStringList.Free;
        end;
    Result := true;
    end;

    function TRepositoryService.GenerateCategoryList: TStringList;
    var list: TStringList;
    begin
    list := repo.ReadCategoryList;
    //list.Add('[All]');
    list.Insert(0, '[All]');
    Result := list;
    end;

    function TRepositoryService.GetCategoryCount: integer;
    begin
    Result := categories.GetCount;
    end;

    function TRepositoryService.GetPairCount: integer;
    begin
    Result := pairs.GetCount;
    end;

    procedure TRepositoryService.FreeContainers;
    begin
    repo.Free;
    pairs.DeleteAll;
    pairs.Free;
    categories.DeleteAll;
    categories.Free;
    end;

    function TRepositoryService.GetPairsByCategory(category: integer): TPairs;
    begin
    Result := pairs.GetPairsByCategory(category);
    end;

    function TRepositoryService.GetPairsByCountRandomly(count: integer): TPairs;
    begin
    Result := pairs.GetPairsByCountRandomly(count);
    end;
end.
