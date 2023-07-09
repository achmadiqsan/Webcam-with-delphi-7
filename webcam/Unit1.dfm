object Form1: TForm1
  Left = 336
  Top = 193
  Width = 768
  Height = 451
  BorderIcons = [biSystemMenu]
  Caption = 'Capture Webcam'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 8
    Top = 8
    Width = 385
    Height = 345
  end
  object Image1: TImage
    Left = 16
    Top = 16
    Width = 369
    Height = 329
    Stretch = True
  end
  object Panel1: TPanel
    Left = 403
    Top = 0
    Width = 349
    Height = 412
    Align = alRight
    Caption = 'Panel1'
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 359
      Width = 347
      Height = 52
      Align = alBottom
      TabOrder = 0
      object Button1: TButton
        Left = 208
        Top = 10
        Width = 113
        Height = 33
        Caption = 'Capture'
        TabOrder = 0
        OnClick = Button1Click
      end
      object ComboBox1: TComboBox
        Left = 19
        Top = 15
        Width = 174
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 1
        Text = ' -- Pilih --'
        OnSelect = ComboBox1Click
      end
    end
    object VideoWindow1: TVideoWindow
      Left = 1
      Top = 1
      Width = 347
      Height = 358
      FilterGraph = FilterGraph1
      VMROptions.Mode = vmrWindowed
      Color = clBlack
      Align = alClient
    end
  end
  object Button2: TButton
    Left = 54
    Top = 363
    Width = 121
    Height = 41
    Caption = 'Simpan Jadi JPEG'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 206
    Top = 363
    Width = 121
    Height = 41
    Caption = 'Simpan Jadi PNG'
    TabOrder = 2
    OnClick = Button3Click
  end
  object FilterGraph1: TFilterGraph
    Mode = gmCapture
    GraphEdit = True
    LinearVolume = True
    Left = 440
    Top = 24
  end
  object SampleGrabber1: TSampleGrabber
    FilterGraph = FilterGraph1
    MediaType.data = {
      7669647300001000800000AA00389B717DEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 480
    Top = 24
  end
  object Filter1: TFilter
    BaseFilter.data = {00000000}
    FilterGraph = FilterGraph1
    Left = 520
    Top = 24
  end
  object SavePictureDialog1: TSavePictureDialog
    DefaultExt = 'JPG'
    Left = 136
    Top = 248
  end
end
