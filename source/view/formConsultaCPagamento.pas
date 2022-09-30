unit formConsultaCPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formConsultaBase, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, HEdit, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmConsultaCPagamento = class(TfrmConsultaBase)
    queryConsultaCODCPAGTO: TSmallintField;
    queryConsultaDESCRICAO: TStringField;
    queryConsultaNROPARCELAS: TSmallintField;
    queryConsultaDIASPARCELAS: TSmallintField;
    queryConsultaDIASPRIMPARC: TSmallintField;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaCPagamento: TfrmConsultaCPagamento;

implementation

{$R *.dfm}

procedure TfrmConsultaCPagamento.FormShow(Sender: TObject);
begin
  inherited;
  self.FieldReturn := 'CODCPAGTO';
end;

end.
