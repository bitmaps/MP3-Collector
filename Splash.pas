unit Splash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, PJVersionInfo;

type
  TSplashForm = class(TForm)
    Panel1: TPanel;
    pLeft: TPanel;
    Panel3: TPanel;
    pTop: TPanel;
    lTitle: TLabel;
    AppIcon: TImage;
    pMain: TPanel;
    PJVersionInfo: TPJVersionInfo;
    lWebsite: TLabel;
    lDescription: TLabel;
    lCompanyName: TLabel;
    lVersion: TLabel;
    lComments: TLabel;
    lWebsiteInstructions: TLabel;
    bClose: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pMainClick(Sender: TObject);
    procedure DoCloseCheck;
    procedure pTopClick(Sender: TObject);
    procedure pLeftClick(Sender: TObject);
    procedure lWebsiteClick(Sender: TObject);
    procedure bCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Splashmode : Boolean;
  end;

var
  SplashForm: TSplashForm;

implementation

uses Main;

{$R *.DFM}

procedure TSplashForm.FormShow(Sender: TObject);
begin
  SplashForm.Font := MainForm.Font;
  lTitle.Font := MainForm.Font;
  lTitle.Font.Style := [fsBold];
  lWebsite.Font := MainForm.Font;
  lWebsite.Font.Style := [fsBold];
end;

procedure TSplashForm.FormCreate(Sender: TObject);
begin
  if MainForm.Percents <> 100 then
    MainForm.SetTransparentForm(Handle, (255 * MainForm.Percents) div 100);
  AppIcon.Picture.Icon := Application.Icon;
  PJVersionInfo.FileName := application.ExeName;
  if PJVersionInfo.SpecialBuild <> '' then
    lVersion.Caption := PJVersionInfo.FileVersion + '(' + PJVersionInfo.SpecialBuild + ')'
  else
    lVersion.Caption := PJVersionInfo.FileVersion;

  lComments.Caption := PJVersionInfo.Comments;
  lCompanyName.Caption := PJVersionInfo.CompanyName;
  lTitle.Caption := PJVersionInfo.ProductName;
  lWebsite.Caption := Homepage;
  lDescription.Caption := PJVersionInfo.FileDescription;

//  lWebsiteInstructions.Visible := False;
end;

procedure TSplashForm.pMainClick(Sender: TObject);
begin
//  DoCloseCheck;
end;

procedure TSplashForm.DoCloseCheck;
begin
  if Splashmode = False then Close;
end;

procedure TSplashForm.pTopClick(Sender: TObject);
begin
//  DoCloseCheck;
end;

procedure TSplashForm.pLeftClick(Sender: TObject);
begin
//  DoCloseCheck;
end;

procedure TSplashForm.lWebsiteClick(Sender: TObject);
begin
  MainForm.tbxiHomepageClick(nil);
end;

procedure TSplashForm.bCloseClick(Sender: TObject);
begin
  Close;
end;

end.
