(*
Application runner and main UI class.
*)
unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus,
  UnitRepositoryService, UnitLearningService, Vcl.ExtCtrls;

type
  TfMain = class(TForm)
    gbCategory: TGroupBox;
    bStart: TButton;
    bStat: TButton;
    GBNumberOfQuestions: TGroupBox;
    rbTwentyFive: TRadioButton;
    rbFifty: TRadioButton;
    rbSeventyFive: TRadioButton;
    rbHundred: TRadioButton;
    gbMode: TGroupBox;
    rbShowThePairs: TRadioButton;
    rbAskDefinitions: TRadioButton;
    rbAskMeanings: TRadioButton;
    rbAskBoth: TRadioButton;
    tAnimator: TTimer;
    lbCategories: TListBox;
    procedure FormShow(Sender: TObject);
    procedure bStatClick(Sender: TObject);
    procedure bStartClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tAnimatorTimer(Sender: TObject);
  private
        animStep: integer;
  public
        repoService: TRepositoryService;
        learningService: TLearningService;
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

uses UnitLearning;

procedure TfMain.bStartClick(Sender: TObject);
var category, questions, mode: integer;
begin
if lbCategories.ItemIndex = 0 then
    category := -1
else
    category := lbCategories.ItemIndex - 1;
if rbTwentyFive.Checked then
    questions := 25
else
    if rbFifty.Checked then
        questions := 50
    else
        if rbSeventyFive.Checked then
            questions := 75
        else
            questions := 100;
if rbShowThePairs.Checked then
    mode := 1
else
    if rbAskDefinitions.Checked then
        mode := 2
    else
        if rbAskMeanings.Checked then
            mode := 3
        else
            mode := 4;
learningService.PrepareLearning(repoService.GetPairsByCategory(category).GetPairsByCountRandomly(questions), lbCategories.Items[lbCategories.ItemIndex], mode);
fLearning.ShowModal;
end;

procedure TfMain.bStatClick(Sender: TObject);
begin
MessageDlg(
        'There are '#10 +
        IntToStr(repoService.GetPairCount) + ' definition-meaning pairs'#10'in'#10 +
        IntToStr(repoService.GetCategoryCount) + ' categories.',
        mtInformation, [mbOk], 0);
end;

procedure TfMain.FormDestroy(Sender: TObject);
begin
learningService.FreeContainers;
learningService.Free;
repoService.FreeContainers;
repoService.Free;
end;

procedure TfMain.FormShow(Sender: TObject);
begin
Randomize;
repoService := TRepositoryService.Create;
learningService := TLearningService.Create;
if not repoService.Inicialize(ExtractFilePath(Application.ExeName) + 'data') then
    begin
    MessageDlg('Unable to access data folder. The application exits now.', mtError, [mbOk], 0);
    fMain.Close;
    end;
lbCategories.Items := repoService.GenerateCategoryList;
lbCategories.ItemIndex := 0;
if tAnimator.Tag = 0 then
    begin
    gbCategory.Left := 8 - 100;
    gbNumberOfQuestions.Top := 8 - 100;
    gbMode.Left := 442 + 100;
    bStart.Top := 137 + 100;
    bStat.Top := 193 + 100;
    animStep := 5;
    tAnimator.Enabled := true;
    end;
end;

procedure TfMain.tAnimatorTimer(Sender: TObject);
begin
if tAnimator.tag = 0 then
    begin
    tAnimator.Enabled := false;
    tAnimator.Tag := 1;
    tAnimator.Interval := 10;
    tAnimator.Enabled := true;
    end
else
    begin
    tAnimator.Enabled := false;
    gbCategory.Left := gbCategory.Left + animStep;
    gbNumberOfQuestions.Top := gbNumberOfQuestions.Top + animStep;
    gbMode.Left := gbMode.Left - animStep;
    bStart.Top := bStart.Top - animStep;
    bStat.Top := bStat.Top - animStep;
    tAnimator.Tag := tAnimator.Tag + animStep;
    if tAnimator.Tag < 100 then
        tAnimator.Enabled := true;
    end;
end;

end.
