unit formBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, dataModuleBase, dataModuleConexaoBanco,
  uUtils;

type
  TTipoTela = (ttInserir, ttEditar);

  TfrmBase = class(TForm)
    pnTop: TPanel;
    pnGeral: TPanel;
    btnCancelar: TSpeedButton;
    btnConfirmar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnSair: TSpeedButton;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
  private
    FDm: TDmBase;
    FTipoTela: TTipoTela;
    FParametros: TArray<string>;
    FValueParams: TArray<Variant>;
    procedure SetTipoTela(const Value: TTipoTela);
    procedure AjustaTelaInserir;
    procedure AjustaTelaEditar;
    { Private declarations }
  public
    property Dm: TDmBase read FDm write FDm;
    property Parametros: TArray<string> read FParametros write FParametros;
    property ValueParams: TArray<Variant> read FValueParams write FValueParams;
    property TipoTela: TTipoTela read FTipoTela write SetTipoTela;
    { Public declarations }
  end;

var
  frmBase: TfrmBase;

implementation

uses
  Vcl.StdCtrls;

{$R *.dfm}



procedure TfrmBase.AjustaTelaEditar;
var
  i: integer;
begin
  for I := 0 to Self.Dm.queryCadastro.Params.Count-1 do begin
    Self.Dm.queryCadastro.Params[i].Clear;
  end;

  for I := 0 to Length(Parametros)-1 do begin
    Self.Dm.queryCadastro.ParamByName(Parametros[i]).Value := ValueParams[i];
  end;

  Self.Dm.queryCadastro.Open;
end;

procedure TfrmBase.AjustaTelaInserir;
var
  i: integer;
begin
  for I := 0 to Self.Dm.queryCadastro.Params.Count-1 do begin
    Self.Dm.queryCadastro.Params[i].Clear;
  end;
  Self.Dm.queryCadastro.Open;
  Self.Dm.queryCadastro.Append;
end;

procedure TfrmBase.btnCancelarClick(Sender: TObject);
begin
  if TMessageBox.confirmar('Deseja cancelar as alterações deste registro?', moNao, miPergunta) = moNao then Exit;

  Self.Dm.queryCadastro.Close;
  Self.Close;
end;

procedure TfrmBase.btnConfirmarClick(Sender: TObject);
begin
  if TMessageBox.confirmar('Deseja salvar este registro?', moNao, miPergunta) = moNao then Exit;

  try
    self.Dm.Salvar;
  except
    on e: exception do begin
      TMessageBox.informar('Ocorreu um erro ao tentar salvar o registro: ' + slineBreak + e.Message);
      abort;
    end;
  end;
  TMessageBox.informar('Registro salvo com sucesso');
  Self.Dm.queryCadastro.Close;
  self.close;
end;

procedure TfrmBase.btnExcluirClick(Sender: TObject);
begin
  if TMessageBox.confirmar('Deseja excluir este registro?', moNao, miPergunta) = moNao then Exit;

  try
    self.Dm.Excluir;
  except
    on e: exception do begin
      TMessageBox.informar('Ocorreu um erro ao tentar excluir o registro: ' + slineBreak + e.Message);
      abort;
    end;
  end;

  TMessageBox.informar('Registro excluído com sucesso');

  Self.Dm.queryCadastro.Close;
  self.close;
end;

procedure TfrmBase.btnSairClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
  Release;
end;

procedure TfrmBase.FormDestroy(Sender: TObject);
begin
  FreeAndNil(self.Dm);
end;

procedure TfrmBase.SetTipoTela(const Value: TTipoTela);
begin
  FTipoTela := Value;

  case Value of
    ttInserir: AjustaTelaInserir;
    ttEditar: AjustaTelaEditar;
  end;
end;

end.
