unit MergeDocuments;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Db, DBISAMTb, ShellAPI;

type
  TMergeDocumentsForm = class(TForm)
    bRun: TButton;
    bClose: TButton;
    bNew: TButton;
    bDelete: TButton;
    dbgMergeDocuments: TwwDBGrid;
    dsdsqMergeDocs: TDataSource;
    dsqMergeDocs: TDBISAMQuery;
    dsqMergeDocsID: TIntegerField;
    dsqMergeDocsMergeName: TStringField;
    dsqMergeDocsMergeTemplate: TStringField;
    dsqMergeDocsMergeQuery: TIntegerField;
    DataSource1: TDataSource;
    Merge: TDBISAMTable;
    procedure bNewClick(Sender: TObject);
    procedure bCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bRunClick(Sender: TObject);
    procedure bDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MergeDocumentsForm: TMergeDocumentsForm;

implementation

uses NewMergeDocument, repCatalogues, repAlbums, repArtists,
  repFullAlbumDetails, repLyrics;

{$R *.DFM}

procedure TMergeDocumentsForm.bNewClick(Sender: TObject);
begin
  NewMergeDocForm := TNewMergeDocForm.create(self);
  NewMergeDocForm.ShowModal;
  NewMergeDocForm.Free;
end;

procedure TMergeDocumentsForm.bCloseClick(Sender: TObject);
begin
  close;
end;

procedure TMergeDocumentsForm.FormCreate(Sender: TObject);
begin
  dsqMergeDocs.Active := True;
end;

procedure TMergeDocumentsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dsqMergeDocs.Active := False;
end;

procedure TMergeDocumentsForm.bRunClick(Sender: TObject);
var AppPath : String;
begin
  AppPath := ExtractFilePath(Application.exename);
  case dsqMergeDocs.FieldByName('MergeQuery').AsInteger of
    0 : begin
          rpFullAlbumDetails := TrpFullAlbumDetails.create(self);
          rpFullAlbumDetails.CreateMergeFile(AppPath+'datasource.doc');
          rpFullAlbumDetails.Free;
        end;
    1 : begin
          rpArtists := TrpArtists.create(self);
          rpArtists.CreateMergeFile(AppPath+'datasource.doc');
          rpArtists.Free;
        end;
    2 : begin
          rpCatalogues := TrpCatalogues.create(self);
          rpCatalogues.CreateMergeFile(AppPath+'datasource.doc');
          rpCatalogues.Free;
        end;
    3 : begin
          rpLyrics := TrpLyrics.create(self);
          rpLyrics.CreateMergeFile(AppPath+'datasource.doc');
          rpLyrics.Free;
        end;
  end;
  ShellExecute(Handle, 'OPEN', PChar(dsqMergeDocs.FieldByName('MergeTemplate').AsString), nil, nil, sw_shownormal);
end;

procedure TMergeDocumentsForm.bDeleteClick(Sender: TObject);
begin
  Merge.Open;
  if Merge.Locate('ID', dsqMergeDocs.FieldByName('ID').AsInteger, []) then
  begin
    Merge.Delete;
    dsqMergeDocs.DisableControls;
    dsqMergeDocs.Active := False;
    dsqMergeDocs.Active := True;
    dsqMergeDocs.EnableControls;
  end;
  Merge.Close;
end;

end.
