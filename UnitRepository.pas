(*
On-storage repository class.
*)
unit UnitRepository;

interface
    uses
        System.IOUtils, System.SysUtils, System.Classes;

    type
        TRepository = class(TObject)
            private
                dataFolder: string;

            public
                constructor Create;

                //after creation, this function must be called first with true result
                function SetDataFolder(folderName: string) : boolean;

                //returns empty list when dataFolder was not specified
                function ReadCategoryList: TStringList;

                //returns empty list when category does not exist
                function ReadPairsByCategory(category: string): TStringList;
        end;

implementation

    constructor TRepository.Create;
    begin
    dataFolder := '';
    end;

    function TRepository.SetDataFolder(folderName: string) : boolean;
    begin
    if not TPath.HasValidPathChars(folderName, false) then
        Result := false;
    if folderName[Length(folderName)] <> TPath.DirectorySeparatorChar then
        folderName := folderName + TPath.DirectorySeparatorChar;
    if not TDirectory.Exists(folderName) then
        try
            TDirectory.CreateDirectory(folderName);
        finally
            if not TDirectory.Exists(folderName) then
                Result := false;
        end;
    dataFolder := folderName;
    Result := true;
    end;

    function TRepository.ReadCategoryList: TStringList;
    var
        categories: TStringList;
        searchRec: TSearchRec;
        searchResult: integer;
    begin
    categories := TStringList.Create;
    if Length(dataFolder) = 0 then
        Result := categories;
    categories.BeginUpdate;
    searchResult := FindFirst(dataFolder+'*.txt', 0, searchRec);
    while searchResult = 0 do
        begin
        categories.Add(TPath.GetFileNameWithoutExtension(searchRec.Name));
        searchResult := FindNext(searchRec);
        end;
    FindClose(searchRec);
    categories.Sort;
    categories.EndUpdate;
    Result := categories;
    end;

    function TRepository.ReadPairsByCategory(category: string): TStringList;
    var
        list: TStringList;
        index: integer;
    begin
    list := TStringList.Create;
    if TFile.Exists(dataFolder + category + '.txt') then
        begin
        list.LoadFromFile(dataFolder + category + '.txt');
        index := 0;
        while index < list.Count do
            if string.IsNullOrWhiteSpace(list[index]) or
                    (Pos(#9, list[index]) = 0) and (Pos(';', list[index]) = 0) then
                list.Delete(index)
            else
                index := index + 1;
        end;
    Result := list;
    end;
end.
