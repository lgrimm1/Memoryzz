object fMain: TfMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Memorizz?'
  ClientHeight = 229
  ClientWidth = 591
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Roboto'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gbCategory: TGroupBox
    Left = 8
    Top = 8
    Width = 288
    Height = 118
    Caption = ' Category '
    TabOrder = 0
    object lbCategories: TListBox
      Left = 16
      Top = 18
      Width = 260
      Height = 88
      DoubleBuffered = True
      ExtendedSelect = False
      ItemHeight = 13
      ParentDoubleBuffered = False
      TabOrder = 0
    end
  end
  object GBNumberOfQuestions: TGroupBox
    Left = 302
    Top = 8
    Width = 134
    Height = 118
    Caption = ' Number of Questions '
    TabOrder = 1
    object rbTwentyFive: TRadioButton
      Left = 10
      Top = 20
      Width = 113
      Height = 17
      Caption = '25'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rbFifty: TRadioButton
      Left = 10
      Top = 43
      Width = 113
      Height = 17
      Caption = '50'
      TabOrder = 1
    end
    object rbSeventyFive: TRadioButton
      Left = 10
      Top = 66
      Width = 113
      Height = 17
      Caption = '75'
      TabOrder = 2
    end
    object rbHundred: TRadioButton
      Left = 10
      Top = 89
      Width = 113
      Height = 17
      Caption = '100'
      TabOrder = 3
    end
  end
  object gbMode: TGroupBox
    Left = 442
    Top = 8
    Width = 134
    Height = 118
    Caption = ' Mode '
    TabOrder = 2
    object rbShowThePairs: TRadioButton
      Left = 10
      Top = 20
      Width = 113
      Height = 17
      Caption = 'Show the Pairs'
      TabOrder = 0
    end
    object rbAskDefinitions: TRadioButton
      Left = 10
      Top = 43
      Width = 113
      Height = 17
      Caption = 'Ask Definitions'
      TabOrder = 1
    end
    object rbAskMeanings: TRadioButton
      Left = 10
      Top = 66
      Width = 113
      Height = 17
      Caption = 'Ask Meanings'
      TabOrder = 2
    end
    object rbAskBoth: TRadioButton
      Left = 10
      Top = 89
      Width = 113
      Height = 17
      Caption = 'Ask Both'
      Checked = True
      TabOrder = 3
      TabStop = True
    end
  end
  object bStart: TButton
    Left = 23
    Top = 137
    Width = 542
    Height = 50
    Caption = 'START! :-)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = bStartClick
  end
  object bStat: TButton
    Left = 24
    Top = 193
    Width = 541
    Height = 25
    Caption = 'Show Statistics'
    TabOrder = 4
    OnClick = bStatClick
  end
  object tAnimator: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tAnimatorTimer
    Top = 115
  end
end
