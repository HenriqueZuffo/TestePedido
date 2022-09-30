unit formLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, HEdit, Vcl.ExtCtrls,
  Vcl.Buttons, dataModuleConexaoBanco, uUtils, IdHashMessageDigest;

type
  TfrmLogin = class(TForm)
    pnUsuario: TPanel;
    lbl_edtUsuario: TLabel;
    pnSenha: TPanel;
    lbl_edtSenha: TLabel;
    edtUsuario: THedit;
    edtSenha: THedit;
    btnEntrar: TSpeedButton;
    btnSair: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    FusuarioLogado: string;
    procedure SetusuarioLogado(const Value: string);
    { Private declarations }
  public
    property usuarioLogado: string read FusuarioLogado write SetusuarioLogado;
    function MD5(const texto:string):string;
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
var
  senhaDigitadaComMd5: string;
  encontrouUsuario: Boolean;
begin
  try
    dmConexaoBanco.query.Close;
    dmConexaoBanco.query.SQL.Clear;
    dmConexaoBanco.query.SQL.Add('select NOME, SENHA from USUARIOS where upper(LOGIN) like upper(''%' + edtUsuario.Text + '%'') ');
    dmConexaoBanco.query.Open;

    if dmConexaoBanco.query.IsEmpty then begin
      TMessageBox.informar('Usuário ou senha incorreto!');
      Abort;
    end;
    senhaDigitadaComMd5 := MD5(edtSenha.Text);
    encontrouUsuario := false;
    dmConexaoBanco.query.First;
    while not dmConexaoBanco.query.Eof do begin
      if UpperCase(senhaDigitadaComMd5) = UpperCase(dmConexaoBanco.query.FieldByName('SENHA').AsString) then begin
        encontrouUsuario := true;
        break;
      end;
      dmConexaoBanco.query.Next;
    end;

    if encontrouUsuario then begin
      self.usuarioLogado := dmConexaoBanco.query.FieldByName('NOME').AsString;
      self.Close;
    end else begin
      TMessageBox.informar('Usuário ou senha incorreto!');
      Abort;
    end;

  finally
    dmConexaoBanco.query.Close;
    dmConexaoBanco.query.SQL.Clear;
  end;
end;

procedure TfrmLogin.btnSairClick(Sender: TObject);
begin
  self.usuarioLogado := '';
  Self.Close;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if self.usuarioLogado = '' then
    Application.Terminate;
end;

function TfrmLogin.MD5(const texto: string): string;
var
  idmd5 : TIdHashMessageDigest5;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  try
    result := idmd5.HashStringAsHex(texto);
  finally
    idmd5.Free;
  end;
end;

procedure TfrmLogin.SetusuarioLogado(const Value: string);
begin
  FusuarioLogado := Value;
end;

end.
