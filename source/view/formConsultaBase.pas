unit formConsultaBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, dataModuleConexaoBanco, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, HEdit, uUtils, Vcl.Buttons;

type
  TfrmConsultaBase = class(TForm)
    pnTop: TPanel;
    lbl_descricao: TLabel;
    DataSource1: TDataSource;
    queryConsulta: TFDQuery;
    pnGrid: TPanel;
    pnRodaPe: TPanel;
    dbGridConsulta: TDBGrid;
    btnImportar: TButton;
    edt_desc: THedit;
    btnPesquisar: TSpeedButton;
    procedure btnImportarClick(Sender: TObject);
    procedure dbGridConsultaDblClick(Sender: TObject);
    procedure dbGridConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edt_descKeyPress(Sender: TObject; var Key: Char);
  private
    FValueReturn: Variant;
    FFieldReturn: string;
    FFiltroConsulta: string;
    FCommandText: string;
    FWhereOriginal: string;
    procedure retornaValor;

    function montaFiltroConsulta: string;
    property filtroConsulta: string read FFiltroConsulta write FFiltroConsulta;
    property CommandText: string read FCommandText write FCommandText;
    property WhereOriginal: string read FWhereOriginal write FWhereOriginal;

    procedure OnTerminateThread(Sender: TObject);

    { Private declarations }
  public
    property FieldReturn: string read FFieldReturn write FFieldReturn;
    property ValueReturn: Variant read FValueReturn write FValueReturn;
    { Public declarations }
  end;

var
  frmConsultaBase: TfrmConsultaBase;

implementation

{$R *.dfm}

procedure TfrmConsultaBase.btnImportarClick(Sender: TObject);
begin
  retornaValor;
end;

procedure TfrmConsultaBase.btnPesquisarClick(Sender: TObject);
begin
  montaFiltroConsulta;
end;

procedure TfrmConsultaBase.dbGridConsultaDblClick(Sender: TObject);
begin
  retornaValor;
end;

procedure TfrmConsultaBase.dbGridConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then retornaValor;
end;

procedure TfrmConsultaBase.edt_descKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    montaFiltroConsulta;
end;

procedure TfrmConsultaBase.FormShow(Sender: TObject);
var
  i: integer;
begin
  WhereOriginal := '';
  CommandText := '';

  self.queryConsulta.Close;
  for I := 0 to Self.queryConsulta.SQL.Count-1 do begin
    if ((WhereOriginal <> '') or (Pos('WHERE', UpperCase(Self.queryConsulta.SQL[i])) > 0)) then begin
      WhereOriginal := WhereOriginal + Self.queryConsulta.SQL[i];
    end else begin
      CommandText := CommandText + Self.queryConsulta.SQL[i];
    end;
  end;
  self.queryConsulta.Open;
end;

function TfrmConsultaBase.montaFiltroConsulta: string;
var
  Thread: TThread;
  i: integer;
begin
  if self.edt_desc.Text = '' then begin
    Self.queryConsulta.close;
    Self.queryConsulta.SQL.Clear;
    Self.queryConsulta.Sql.Add(Self.CommandText + sLineBreak + Self.WhereOriginal);
    Self.queryConsulta.Open;
    Exit;
  end;

  Thread := TThread.CreateAnonymousThread(
    procedure
    var
      i: integer;
      filtro: string;
    begin
      filtro := '';
      for I := 0 to self.queryConsulta.Fields.Count-1 do begin
        filtro := filtro + iif(filtro = '', ' where ', ' or ') + ' upper(' +self.queryConsulta.Fields[i].FieldName + ') like upper(''%' + self.edt_desc.Text + '%'') ';
      end;

      TThread.Synchronize(Thread,
        procedure
        begin
          self.filtroConsulta := filtro;
        end)
    end
  );
  Thread.OnTerminate := self.OnTerminateThread;
  Thread.Start;
end;

procedure TfrmConsultaBase.OnTerminateThread(Sender: TObject);
begin
  Self.queryConsulta.close;
  Self.queryConsulta.SQL.Clear;
  Self.queryConsulta.Sql.Add(self.CommandText + sLineBreak + self.filtroConsulta);
  Self.queryConsulta.Open;
end;

procedure TfrmConsultaBase.retornaValor;
begin
  self.ValueReturn := self.queryConsulta.FieldByName(self.FieldReturn).Value;
  Self.Close;
end;

end.
