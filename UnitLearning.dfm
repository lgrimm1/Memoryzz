object fLearning: TfLearning
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Memorizz? - Learning!'
  ClientHeight = 295
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Roboto'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ScreenSnap = True
  OnCreate = FormCreate
  OnHide = FormHide
  PixelsPerInch = 96
  TextHeight = 13
  object lPosition: TLabel
    Left = 219
    Top = 247
    Width = 51
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'xxxx'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object lOf: TLabel
    Left = 276
    Top = 247
    Width = 31
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'of'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object lAll: TLabel
    Left = 313
    Top = 247
    Width = 51
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'xxxx'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object lPercentage: TLabel
    Left = 267
    Top = 266
    Width = 53
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'xx%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object sCorrect: TShape
    Left = 298
    Top = 161
    Width = 135
    Height = 11
    Brush.Color = clSilver
  end
  object sMistake: TShape
    Left = 441
    Top = 161
    Width = 135
    Height = 11
    Brush.Color = clSilver
  end
  object gbQuestion: TGroupBox
    Left = 8
    Top = 72
    Width = 278
    Height = 83
    Caption = ' Question '
    TabOrder = 1
    object mQuestion: TMemo
      Left = 11
      Top = 20
      Width = 256
      Height = 50
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      Lines.Strings = (
        'mQuestion')
      ParentFont = False
      TabOrder = 0
    end
  end
  object gbAnswer: TGroupBox
    Left = 298
    Top = 72
    Width = 278
    Height = 83
    Caption = ' Answer '
    TabOrder = 0
    object mAnswer: TMemo
      Left = 10
      Top = 20
      Width = 256
      Height = 50
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      Lines.Strings = (
        'mAnswer')
      ParentFont = False
      TabOrder = 0
      OnKeyPress = mAnswerKeyPress
    end
  end
  object bEvaluate: TButton
    Left = 140
    Top = 186
    Width = 146
    Height = 50
    Caption = 'Evaluate! 8-)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = bEvaluateClick
  end
  object bNext: TButton
    Left = 298
    Top = 186
    Width = 146
    Height = 50
    Caption = 'Next! >>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = bNextClick
  end
  object gbCategory: TGroupBox
    Left = 8
    Top = 8
    Width = 568
    Height = 58
    Caption = ' Category '
    TabOrder = 4
    object eCategory: TEdit
      Left = 11
      Top = 20
      Width = 545
      Height = 26
      TabStop = False
      Alignment = taCenter
      AutoSelect = False
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = 'eCategory'
    end
  end
  object gbMistakes: TGroupBox
    Left = 460
    Top = 198
    Width = 568
    Height = 233
    Caption = ' Mistaken Pairs '
    TabOrder = 5
    Visible = False
    object bCloseMistakes: TButton
      Left = 11
      Top = 192
      Width = 545
      Height = 25
      Caption = 'Close Mistakes'
      TabOrder = 1
      OnClick = bCloseMistakesClick
    end
    object lvMistakes: TListView
      Left = 11
      Top = 22
      Width = 545
      Height = 159
      Columns = <
        item
          Caption = 'Definition'
          Width = 260
        end
        item
          Caption = 'Meaning'
          Width = 260
        end>
      ColumnClick = False
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      GridLines = True
      ReadOnly = True
      RowSelect = True
      ParentDoubleBuffered = False
      ParentFont = False
      ShowColumnHeaders = False
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
end
