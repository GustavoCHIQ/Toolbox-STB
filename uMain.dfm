object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'ToolBox for Android STB - Beta'
  ClientHeight = 733
  ClientWidth = 876
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 15
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 876
    Height = 733
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 874
    ExplicitHeight = 725
    object pnlMeio: TPanel
      Left = 1
      Top = 121
      Width = 874
      Height = 376
      Align = alTop
      Locked = True
      TabOrder = 1
      Visible = False
      ExplicitWidth = 872
      object pnlFuncoes: TPanel
        Left = 1
        Top = 1
        Width = 872
        Height = 152
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 870
        object gpBoxFuncoes: TGroupBox
          Left = 1
          Top = 1
          Width = 870
          Height = 398
          Align = alTop
          Caption = 'Fun'#231#245'es'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 868
          object btnReiniciarBox: TButton
            Left = 15
            Top = 32
            Width = 186
            Height = 41
            Caption = 'Reiniciar TV BOX'
            TabOrder = 0
            StyleName = 'Windows'
            OnClick = btnReiniciarBoxClick
          end
          object btnTirarPrint: TButton
            Left = 15
            Top = 81
            Width = 186
            Height = 41
            Caption = 'Tirar Print da Tela'
            TabOrder = 1
            StyleName = 'Windows'
            OnClick = btnTirarPrintClick
          end
          object bntLimparDados: TButton
            Left = 207
            Top = 32
            Width = 186
            Height = 41
            Caption = 'Limpar Dados do APP'
            TabOrder = 2
            StyleName = 'Windows'
            OnClick = bntLimparDadosClick
          end
          object btnInput: TButton
            Left = 207
            Top = 81
            Width = 186
            Height = 41
            Caption = 'Inserir Texto'
            TabOrder = 3
            StyleName = 'Windows'
            OnClick = btnInputClick
          end
          object edtTexto: TEdit
            Left = 416
            Top = 86
            Width = 260
            Height = 31
            TabOrder = 4
          end
        end
        object cbbPacotes: TComboBox
          Left = 417
          Top = 40
          Width = 265
          Height = 28
          AutoComplete = False
          DropDownCount = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          StyleName = 'Windows'
        end
      end
      object pnlControles: TPanel
        Left = 1
        Top = 153
        Width = 872
        Height = 222
        Align = alClient
        TabOrder = 1
        ExplicitWidth = 870
        object gpBoxControles: TGroupBox
          Left = 1
          Top = 1
          Width = 870
          Height = 216
          Align = alTop
          Caption = 'Controles'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 868
          object btnCima: TButton
            Left = 134
            Top = 48
            Width = 97
            Height = 41
            Caption = 'CIMA'
            TabOrder = 0
            StyleName = 'Windows'
            OnClick = btnCimaClick
          end
          object btnBaixo: TButton
            Left = 134
            Top = 142
            Width = 97
            Height = 41
            Caption = 'BAIXO'
            TabOrder = 1
            StyleName = 'Windows'
            OnClick = btnBaixoClick
          end
          object btnEsqueda: TButton
            Left = 31
            Top = 95
            Width = 97
            Height = 41
            Caption = 'ESQUERDA'
            TabOrder = 2
            StyleName = 'Windows'
            OnClick = btnEsquedaClick
          end
          object btnDireita: TButton
            Left = 237
            Top = 95
            Width = 97
            Height = 41
            Caption = 'DIREITA'
            TabOrder = 3
            StyleName = 'Windows'
            OnClick = btnDireitaClick
          end
          object bntVoltar: TButton
            Left = 463
            Top = 56
            Width = 97
            Height = 41
            Caption = 'VOLTAR'
            TabOrder = 4
            StyleName = 'Windows'
            OnClick = bntVoltarClick
          end
          object btnOK: TButton
            Left = 134
            Top = 95
            Width = 97
            Height = 41
            Caption = 'OK'
            TabOrder = 5
            StyleName = 'Windows'
            OnClick = btnOKClick
          end
          object btnInicio: TButton
            Left = 360
            Top = 56
            Width = 97
            Height = 41
            Caption = 'INICIO'
            TabOrder = 6
            StyleName = 'Windows'
            OnClick = btnInicioClick
          end
          object btnProximo: TButton
            Left = 463
            Top = 134
            Width = 97
            Height = 41
            Caption = 'PROXIMO'
            TabOrder = 7
            StyleName = 'Windows'
            OnClick = btnProximoClick
          end
          object btnIr: TButton
            Left = 360
            Top = 134
            Width = 97
            Height = 41
            Caption = 'IR'
            TabOrder = 8
            StyleName = 'Windows'
            OnClick = btnIrClick
          end
          object btnVolumeMais: TButton
            Left = 570
            Top = 56
            Width = 166
            Height = 41
            Caption = 'Aumentar Volume'
            TabOrder = 9
            StyleName = 'Windows'
            OnClick = btnVolumeMaisClick
          end
          object btnVolumesMenos: TButton
            Left = 570
            Top = 134
            Width = 166
            Height = 41
            Caption = 'Diminuir Volume'
            TabOrder = 10
            StyleName = 'Windows'
            OnClick = btnVolumesMenosClick
          end
          object Button1: TButton
            Left = 616
            Top = 96
            Width = 75
            Height = 39
            Caption = 'Mutar'
            TabOrder = 11
            StyleName = 'Windows'
            OnClick = Button1Click
          end
        end
      end
    end
    object pnlTopo: TPanel
      Left = 1
      Top = 1
      Width = 874
      Height = 120
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 872
      object GroupBox2: TGroupBox
        Left = 1
        Top = 1
        Width = 872
        Height = 118
        Align = alClient
        Caption = 'Conex'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitWidth = 870
        object edtIPBOX: TEdit
          Left = 31
          Top = 38
          Width = 329
          Height = 49
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -30
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TextHint = 'IP de Acesso'
          StyleName = 'Windows'
          OnChange = edtIPBOXChange
        end
        object btnConectar: TButton
          Left = 439
          Top = 38
          Width = 122
          Height = 49
          Caption = 'Conectar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          StyleName = 'Windows'
          OnClick = btnConectarClick
        end
        object btnDesconectar: TButton
          Left = 608
          Top = 38
          Width = 129
          Height = 49
          Caption = 'Desconectar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -18
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          StyleName = 'Windows'
          OnClick = btnDesconectarClick
        end
      end
    end
    object pnlInferior: TPanel
      Left = 1
      Top = 497
      Width = 874
      Height = 235
      Align = alClient
      TabOrder = 2
      ExplicitWidth = 872
      ExplicitHeight = 227
      object StatusBar1: TStatusBar
        Left = 1
        Top = 208
        Width = 872
        Height = 26
        Panels = <
          item
            Alignment = taRightJustify
            Width = 200
          end>
        ExplicitTop = 200
        ExplicitWidth = 870
      end
      object mmoLog: TMemo
        Left = 1
        Top = 1
        Width = 872
        Height = 207
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
        StyleName = 'Windows'
        ExplicitWidth = 870
        ExplicitHeight = 199
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 794
    Top = 58
  end
end
