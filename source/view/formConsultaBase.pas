unit formConsultaBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, dataModuleConexaoBanco, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, HEdit, uUtils;

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
    procedure btnImportarClick(Sender: TObject);
    procedure dbGridConsultaDblClick(Sender: TObject);
    procedure dbGridConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edt_descChange(Sender: TObject);
  private
    FValueReturn: Variant;
    FFieldReturn: string;
    FFiltroConsulta: string;
    FCommandText: string;
    procedure retornaValor;

    function montaFiltroConsulta: string;
    property filtroConsulta: string read FFiltroConsulta write FFiltroConsulta;
    property CommandText: string read FCommandText write FCommandText;

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

procedure TfrmConsultaBase.dbGridConsultaDblClick(Sender: TObject);
begin
  retornaValor;
end;

procedure TfrmConsultaBase.dbGridConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then retornaValor;
end;

procedure TfrmConsultaBase.edt_descChange(Sender: TObject);
begin
  montaFiltroConsulta;
end;

procedure TfrmConsultaBase.FormShow(Sender: TObject);
begin
  self.queryConsulta.Close;
  Self.CommandText := string(self.queryConsulta.SQL);
  self.queryConsulta.Open;
end;

function TfrmConsultaBase.montaFiltroConsulta: string;
var
  Thread: TThread;
begin
  if self.edt_desc.Text = '' then begin
    Self.queryConsulta.close;
    Self.queryConsulta.SQL.Clear;
    Self.queryConsulta.Sql.Add(Self.CommandText);
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
        filtro := iif(filtro = '', 'where ', ' and ') + self.queryConsulta.Fields[i].Name + ' like % ''' + self.edt_desc.Text + '% ''';
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
