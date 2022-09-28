unit formBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, dataModuleBase, dataModuleConexaoBanco,
  uUtils;

type
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
    { Private declarations }
  public
    property Dm: TDmBase read FDm write FDm;
    { Public declarations }
  end;

var
  frmBase: TfrmBase;

implementation

{$R *.dfm}

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

  Self.Dm.queryCadastro.Close;
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

  Self.Dm.queryCadastro.Close;
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

end.
