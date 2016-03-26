unit UMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  UMetaData, UDirectory;

type

  { TMain }

  TMain = class(TForm)
    MainMenu1: TMainMenu;
    MHelpAbout: TMenuItem;
    MHelp: TMenuItem;
    MFile: TMenuItem;
    MTables: TMenuItem;
    MFileExit: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MFileExitClick(Sender: TObject);
    procedure MHelpAboutClick(Sender: TObject);
    procedure MTablesItemClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.lfm}

{ TMain }


procedure TMain.MHelpAboutClick(Sender: TObject);
begin
  ShowMessage('Б8103а, Терехов Дмитрий.');
end;

procedure TMain.MTablesItemClick(Sender: TObject);
var
  newForm: TTableForm;
begin
  newForm := TTableForm.Create(Main);
  newForm.Caption := (Sender as TMenuItem).Caption;
  newForm.Tag := (Sender as TMenuItem).Tag;
  newForm.ShowDefaultTable;
  newForm.SQLQuery1.Active := True;
  newForm.Show;
end;

procedure TMain.MFileExitClick(Sender: TObject);
begin
  Main.Close;
end;

procedure TMain.FormCreate(Sender: TObject);
var
  m: TMenuItem;
  i: integer;
begin
  for i := 0 to High(MetaData.FTables) do
    begin
      m := TMenuItem.Create(Main);
      m.Caption := MetaData.FTables[i].FDisplayName;
      m.Tag := i;
      m.OnClick := @MTablesItemClick;
      MTables.Add(m);
    end;
end;

end.
