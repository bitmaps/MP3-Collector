unit About;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, VersInfo, PJVersionInfo;

type
  TAboutForm = class(TForm)
    bClose: TButton;
    Bevel1: TBevel;
    Panel1: TPanel;
    Bevel2: TBevel;
    lProgramTitle: TLabel;
    mThanks: TMemo;
    lVersion: TLabel;
    PJVersionInfo: TPJVersionInfo;
    lWebsite: TLabel;
    procedure bCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lWebsiteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutForm: TAboutForm;

implementation

uses Main;

{$R *.DFM}

procedure TAboutForm.bCloseClick(Sender: TObject);
begin
  close;
end;

procedure TAboutForm.FormCreate(Sender: TObject);
begin
//  MainForm.SetTransparentForm(Handle, (255 * MainForm.Percents) div 100);
//  dfsVersionInfoResource.Filename := application.ExeName;
  PJVersionInfo.FileName := application.ExeName;
  lVersion.Caption := PJVersionInfo.FileVersion;
  lWebsite.Caption := Homepage;
end;

procedure TAboutForm.FormShow(Sender: TObject);
begin
  AboutForm.Font := MainForm.Font;
end;

procedure TAboutForm.lWebsiteClick(Sender: TObject);
begin
  MainForm.tbxiHomepageClick(nil);
end;

end.
