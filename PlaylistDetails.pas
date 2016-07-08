unit PlaylistDetails;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TPlaylistForm = class(TForm)
    bOk: TButton;
    bCancel: TButton;
    lbCatName: TLabel;
    ePlaylistName: TEdit;
    Bevel1: TBevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ePlaylistNameChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PlaylistForm: TPlaylistForm;

implementation

uses Main, datamod;

{$R *.DFM}

procedure TPlaylistForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if modalresult = mrOk then
  begin
    with MainForm do
    begin
      dmMain.Playlists.Append;
      dmMain.Playlists.FieldByName('Playlist_Name').AsString := ePlaylistName.Text;
      dmMain.Playlists.Post;
    end;
  end;
end;

procedure TPlaylistForm.ePlaylistNameChange(Sender: TObject);
begin
  bOk.Enabled := (length(ePlaylistName.Text) > 0);
end;

procedure TPlaylistForm.FormShow(Sender: TObject);
begin
  PlaylistForm.Font := MainForm.Font;
  ePlaylistName.SetFocus;
end;

procedure TPlaylistForm.FormCreate(Sender: TObject);
begin
  if MainForm.Percents <> 100 then
    MainForm.SetTransparentForm(Handle, (255 * MainForm.Percents) div 100);
end;

end.
