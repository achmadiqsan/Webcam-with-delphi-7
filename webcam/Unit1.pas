unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DirectShow9, DsUtil, DSPack, ExtCtrls, StdCtrls, Menus, ExtDlgs, DB,
  ADODB;

type
  TForm1 = class(TForm)
    FilterGraph1: TFilterGraph;
    SampleGrabber1: TSampleGrabber;
    Filter1: TFilter;
    SavePictureDialog1: TSavePictureDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    VideoWindow1: TVideoWindow;
    Button1: TButton;
    ComboBox1: TComboBox;
    Button2: TButton;
    Shape1: TShape;
    Image1: TImage;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure listingDevice;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  CapEnum: TSySDevEnum;

implementation

//uses Utest;

//uses
//  Utest;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  samplegrabber1.GetBitmap(Image1.Picture.Bitmap);
end;

procedure TForm1.ComboBox1Click(Sender: TObject);
begin
  FilterGraph1.ClearGraph;
  FilterGraph1.Active := false;
  Filter1.BaseFilter.Moniker :=
  capenum.GetMoniker(combobox1.ItemIndex);
  FilterGraph1.Active := true;
  with FilterGraph1 as ICaptureGraphBuilder2 do
    RenderStream(@PIN_CATEGORY_PREVIEW,nil, Filter1 as IBaseFilter, SampleGrabber1 as IBaseFilter, VideoWindow1 as IbaseFilter);
  FilterGraph1.Play;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  capenum.Free;
  FilterGraph1.ClearGraph;
  FilterGraph1.Active := false;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  listingDevice;
end;

procedure TForm1.listingDevice;
var i: integer;
begin
  CapEnum:=TSysDevEnum.Create(CLSID_VideoInputDeviceCategory);
  For i:=0 to CapEnum.CountFilters-1 do
  begin
    combobox1.Items.Add(CapEnum.Filters[i].FriendlyName);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
SavePictureDialog1.FileName:=FormatDateTime('yyyymmddhms',Now)+'.JPG';
Image1.Picture.SaveToFile(SavePictureDialog1.FileName);
// WITH LOCATION STATIC :
//Image1.Picture.SaveToFile('C:\Users\DevOps\Downloads\webcam\foto\'SavePictureDialog1.FileName);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
SavePictureDialog1.FileName:=FormatDateTime('yyyymmddhms',Now)+'.PNG';
Image1.Picture.SaveToFile(SavePictureDialog1.FileName);
//Form2.Label1.caption := SavePictureDialog1.FileName;
// SAVE PCTURE WITH DINAMIC LOCATION :
// Image1.Picture.SaveToFile('foto\'+SavePictureDialog1.FileName);
end;

end.

