object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 224
  ClientWidth = 224
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 45
    Width = 25
    Height = 13
    Caption = 'Login'
  end
  object Label2: TLabel
    Left = 24
    Top = 101
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object txtSenha: TEdit
    Left = 24
    Top = 120
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object txtLogin: TEdit
    Left = 24
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object btAcessar: TButton
    Left = 48
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Acessar'
    TabOrder = 2
    OnClick = btAcessarClick
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=contatos'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 168
    Top = 96
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM usuarios')
    Left = 168
    Top = 160
  end
end
