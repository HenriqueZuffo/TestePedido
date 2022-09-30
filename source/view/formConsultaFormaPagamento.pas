unit formConsultaFormaPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formConsultaBase, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, HEdit, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmConsultaFormaPagamento = class(TfrmConsultaBase)
    queryConsultaCODFORMAPAGTO: TSmallintField;
    queryConsultaDESCRICAO: TStringField;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaFormaPagamento: TfrmConsultaFormaPagamento;

implementation

{$R *.dfm}

procedure TfrmConsultaFormaPagamento.FormShow(Sender: TObject);
begin
  inherited;
  self.FieldReturn := 'CODFORMAPAGTO';
end;

end.
