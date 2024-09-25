(*
Education UI class.
*)
unit UnitLearning;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfLearning = class(TForm)
    gbQuestion: TGroupBox;
    gbAnswer: TGroupBox;
    bEvaluate: TButton;
    lPosition: TLabel;
    lOf: TLabel;
    lAll: TLabel;
    bNext: TButton;
    lPercentage: TLabel;
    sCorrect: TShape;
    sMistake: TShape;
    gbCategory: TGroupBox;
    eCategory: TEdit;
    mQuestion: TMemo;
    mAnswer: TMemo;
    gbMistakes: TGroupBox;
    bCloseMistakes: TButton;
    lvMistakes: TListView;
    procedure bNextClick(Sender: TObject);
    procedure bEvaluateClick(Sender: TObject);
    procedure mAnswerKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure bCloseMistakesClick(Sender: TObject);
    procedure ShowMistakes;
    procedure HideMistakes;
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLearning: TfLearning;

implementation

{$R *.dfm}

uses UnitMain;

procedure TfLearning.bCloseMistakesClick(Sender: TObject);
begin
fLearning.ModalResult := 1;
end;

procedure TfLearning.bEvaluateClick(Sender: TObject);
begin
fMain.learningService.Evaluate;
end;

procedure TfLearning.bNextClick(Sender: TObject);
begin
fMain.learningService.Next;
end;

procedure TfLearning.FormCreate(Sender: TObject);
begin
gbMistakes.Left := 8;
gbMistakes.Top := 8;
end;

procedure TfLearning.FormHide(Sender: TObject);
begin
HideMistakes;
end;

procedure TfLearning.mAnswerKeyPress(Sender: TObject; var Key: Char);
begin
if bEvaluate.Enabled and (Key = #13) then begin
        Key := #0;
        fMain.learningService.Evaluate;
        end;
end;

procedure TfLearning.ShowMistakes;
begin
gbCategory.Hide;
gbQuestion.Hide;
gbAnswer.Hide;
sCorrect.Hide;
sMistake.Hide;
bEvaluate.Hide;
bNext.Hide;
gbMistakes.Show;
lvMistakes.SetFocus;
end;

procedure TfLearning.HideMistakes;
begin
gbMistakes.Hide;
gbCategory.Show;
gbQuestion.Show;
gbAnswer.Show;
sCorrect.Show;
sMistake.Show;
bEvaluate.Show;
bNext.Show;
end;

end.
