(*
Learning service class.
*)
unit UnitLearningService;

interface

uses
    System.Classes, Vcl.Graphics, Vcl.ComCtrls, System.SysUtils,
    UnitLearning,
    UnitPairs, UnitCategories;

type
    TLearningService = class(TObject)
        private
            pairs: TPairs;
            numberOfPairs: integer;
            actualPair: integer;
            rightAnswers: integer;
            mode: integer;
            definitionIsInQuestionField: boolean;

            procedure SetPercentage;

        public
            constructor Create;

            //invoke it only before freeing the object.
            procedure FreeContainers;

            procedure Next;

            procedure Evaluate;

            procedure PrepareLearning(givenPairs: TPairs; givenCategory: string; givenMode: integer);
    end;

implementation

    constructor TLearningService.Create;
    begin
    pairs := TPairs.Create;
    actualPair := -1;
    rightAnswers := 0;
    end;

    procedure TLearningService.SetPercentage;
    begin
    fLearning.lPercentage.Caption := IntToStr(Round((rightAnswers / numberOfPairs * 100))) + '%';
    end;

    procedure TLearningService.FreeContainers;
    begin
    pairs.Free;
    end;

    procedure TLearningService.Next;
    begin
    actualPair := actualPair + 1;
    fLearning.lPosition.Caption := IntToStr(actualPair);
    fLearning.bNext.Enabled := actualPair < numberOfPairs;
    if mode > 1 then
        fLearning.bEvaluate.Enabled := actualPair <= numberOfPairs;
    if actualPair = numberOfPairs + 1 then
        begin
        fLearning.eCategory.Text := '';
        fLearning.mQuestion.Text := '';
        fLearning.mAnswer.Text := '';
        fLearning.ShowMistakes;
        end
    else
        begin
        case mode of
            1: begin
               fLearning.mQuestion.Text := pairs.GetPair(actualPair - 1).GetDefinition;
               fLearning.mAnswer.Text := pairs.GetPair(actualPair - 1).GetMeaning;
               end;
            2: begin
               fLearning.mQuestion.Text := pairs.GetPair(actualPair - 1).GetDefinition;
               fLearning.mAnswer.Text := '';
               definitionIsInQuestionField := true;
               end;
            3: begin
               fLearning.mQuestion.Text := pairs.GetPair(actualPair - 1).GetMeaning;
               fLearning.mAnswer.Text := '';
               definitionIsInQuestionField := false;
               end;
            4: begin
               definitionIsInQuestionField := Random(2) = 1;
               if definitionIsInQuestionField then
                    fLearning.mQuestion.Text := pairs.GetPair(actualPair - 1).GetDefinition
               else
                    fLearning.mQuestion.Text := pairs.GetPair(actualPair - 1).GetMeaning;
               fLearning.mAnswer.Text := '';
               end;
            end;
        if mode > 1 then
            begin
            fLearning.sCorrect.Brush.Color := clSilver;
            fLearning.sMistake.Brush.Color := clSilver;
            SetPercentage;
            if (mode > 1) and (fLearning.Visible) then
                fLearning.mAnswer.SetFocus;
            end;
        end;
    end;

    procedure TLearningService.Evaluate;
    var
        answer: string;
        li: TListItem;
    begin
    answer := UpperCase(fLearning.mAnswer.Text);
    if (definitionIsInQuestionField and (Pos(answer, UpperCase(pairs.GetPair(actualPair - 1).GetMeaning)) > 0)) or
            (not definitionIsInQuestionField and (Pos(answer, UpperCase(pairs.GetPair(actualPair - 1).GetDefinition)) > 0)) then
        begin
        fLearning.sCorrect.Brush.Color := clLime;
        fLearning.sMistake.Brush.Color := clSilver;
        if fLearning.bEvaluate.Enabled then
            rightAnswers := rightAnswers + 1;
        SetPercentage;
        fLearning.bEvaluate.Enabled := false;
        if fLearning.bNext.Enabled then
            fLearning.bNext.SetFocus
        else
            fLearning.ShowMistakes;
        end
    else
        begin
        fLearning.sCorrect.Brush.Color := clSilver;
        if fLearning.sMistake.Brush.Color = clSilver then
            begin
            fLearning.sMistake.Brush.Color := clYellow;
            fLearning.mAnswer.SetFocus;
            end
        else
            if fLearning.sMistake.Brush.Color = clYellow then
                begin
                fLearning.sMistake.Brush.Color := clWebOrange;
                fLearning.mAnswer.SetFocus;
                end
            else
                begin
                fLearning.sMistake.Brush.Color := clRed;
                fLearning.bEvaluate.Enabled := false;
                li := fLearning.lvMistakes.Items.Add;
                li.Caption := pairs.GetPair(actualPair - 1).GetDefinition;
                li.SubItems.Add(pairs.GetPair(actualPair - 1).GetMeaning);
                if definitionIsInQuestionField then
                    fLearning.mAnswer.Text := pairs.GetPair(actualPair - 1).GetMeaning
                else
                    fLearning.mAnswer.Text := pairs.GetPair(actualPair - 1).GetDefinition;
                SetPercentage;
                if fLearning.bNext.Enabled then
                    fLearning.bNext.SetFocus
                else
                    fLearning.ShowMistakes;
                end;
        end;
    end;

    procedure TLearningService.PrepareLearning(givenPairs: TPairs; givenCategory: string; givenMode: integer);
    begin
    pairs := givenPairs;
    numberOfPairs := pairs.GetCount;
    mode := givenMode;
    actualPair := 0;
    rightAnswers := 0;
    fLearning.eCategory.Text := givenCategory;
    fLearning.lvMistakes.Clear;
    fLearning.lAll.Caption := IntToStr(numberOfPairs);
    fLearning.mAnswer.ReadOnly := mode = 1;
    if mode = 1 then
        fLearning.lPercentage.Caption := '---';
    fLearning.sCorrect.Brush.Color := clSilver;
    fLearning.sMistake.Brush.Color := clSilver;
    if mode = 1 then
        fLearning.bEvaluate.Enabled := false;
    Next;
    end;
end.
