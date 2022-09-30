unit formConsultaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formConsultaBase, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, HEdit, Vcl.ExtCtrls, dataModuleConexaoBanco,
  Vcl.Buttons;

type
  TfrmConsultaProduto = class(TfrmConsultaBase)
    queryConsultaCODPRODUTO: TStringField;
    queryConsultaPRECOCUSTO: TFloatField;
    queryConsultaPRECOVENDA: TFloatField;
    queryConsultaUN: TStringField;
    queryConsultaESTOQUEATUAL: TFloatField;
    queryConsultaPERCICMS: TFloatField;
    queryConsultaPRODUTO: TStringField;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaProduto: TfrmConsultaProduto;

implementation

{$R *.dfm}

procedure TfrmConsultaProduto.FormShow(Sender: TObject);
begin
  inherited;
  self.FieldReturn := 'CODPRODUTO';
end;

end.
