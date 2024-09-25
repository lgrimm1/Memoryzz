(*
Domain class for categories.
*)
unit UnitCategories;

interface
    uses
        System.Classes;

    type
        TCategories = class(TObject)
            private
                categoryList: TStringList;

            public
                constructor Create;

                //returns -1 when category already exists, otherwise returns the amount of categories
                function AddCategory(categoryName: string): integer;

                //returns number of added categories
                function AddCategories(categories: TStringList): integer;

                //returns -1 when index does not exists
                function GetCategory(categoryName: string): integer;

                //returns empty string when there is no such category
                function GetCategoryByIndex(index: integer): string;

                function ModifyCategory(categoryName, newCategoryName: string): boolean;

                function ModifyCategoryByIndex(index: integer; newCategoryName: string): boolean;

                function DeleteCategory(categoryName: string): boolean;

                function DeleteCategorybyIndex(index: integer): boolean;

                procedure DeleteAll;

                function GetCount: integer;
        end;

implementation
    constructor TCategories.Create;
    begin
    categoryList := TStringList.create;
    categoryList.Sorted := true;
    categoryList.CaseSensitive := false;
    end;

    function TCategories.AddCategory(categoryName: string): integer;
    begin
    if categoryList.IndexOf(categoryName) = -1 then
        begin
        categoryList.Add(categoryName);
        Result := categoryList.Count;
        end;
    Result := -1;
    end;

    function TCategories.AddCategories(categories: TStringList): integer;
    var
        index: integer;
        added: integer;
    begin
    if (categories = nil) or (categories.Count = 0) then
        Result := 0;
    added := 0;
    for index := 0 to categories.Count - 1 do
        if categoryList.IndexOf(categories[index]) = -1 then
            begin
            categoryList.Add(categories[index]);
            added := added + 1;
            end;
    Result := added;
    end;

    function TCategories.GetCategory(categoryName: string): integer;
    begin
    Result := categoryList.IndexOf(categoryName);
    end;

    function TCategories.GetCategoryByIndex(index: integer): string;
    begin
    if (index > categoryList.Count - 1) or (index < 0) then
        Result := '';
    Result := categoryList[index];
    end;

    function TCategories.ModifyCategory(categoryName, newCategoryName: string): boolean;
    var index: integer;
    begin
    index := categoryList.IndexOf(categoryName);
    if index = -1 then
        Result := false;
    if categoryList.IndexOf(newCategoryName) > -1 then
        Result := false;
    categoryList[index] := newCategoryName;
    Result := true;
    end;

    function TCategories.ModifyCategoryByIndex(index: integer; newCategoryName: string): boolean;
    begin
    if (index > categoryList.Count - 1) or (index < 0) then
        Result := false;
    if categoryList.IndexOf(newCategoryName) > -1 then
        Result := false;
    categoryList[index] := newCategoryName;
    Result := true;
    end;

    function TCategories.DeleteCategory(categoryName: string): boolean;
    var index: integer;
    begin
    index := categoryList.IndexOf(categoryName);
    if index < 0 then
        Result := false;
    categoryList.Delete(index);
    Result := true;
    end;

    function TCategories.DeleteCategorybyIndex(index: integer): boolean;
    begin
    if (index > categoryList.Count - 1) or (index < 0) then
        Result := false;
    categoryList.Delete(index);
    Result := true;
    end;

    procedure TCategories.DeleteAll;
    begin
    categoryList.Clear;
    end;

    function TCategories.GetCount: integer;
    begin
    Result := categoryList.Count;
    end;
end.
