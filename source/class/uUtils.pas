unit uUtils;

interface

function iif(const AExpressao: boolean; const returnTrue: Variant; const returnElse: variant): Variant;
function montarMsgCampoObrigatorio(const campo: string; const MsgPersonalizada: string = ''): string;


type
  TMessageBoxOption = (moSim, moNao, moCancelar, moSimParaTodos, moNaoParaTodos);
  TMessageBoxIcone = (miErro, miPergunta, miAtencao, miInformacao);

  TMessageBox = class
    public
    class procedure informar(const AMensagem: string; const AIcone: TMessageBoxIcone = miAtencao);
    class function confirmar(const AMensagem: string; AFocus: TMessageBoxOption; AIcone : TMessageBoxIcone): TMessageBoxOption;
  end;

  TValidaValores = class
    private
      class function validaValorIgual(const Campo: variant; const ValorIgual: array of variant): boolean;
    public

      class function valorValido(const Campo: integer; const ValorIgual: array of variant): Boolean; overload;
      class function valorValido(const Campo: integer): Boolean; overload;

      class function valorValido(const Campo: Double; const ValorIgual: array of variant): Boolean; overload;
      class function valorValido(const Campo: double): Boolean; overload;

      class function valorValido(const Campo: string; const ValorIgual: array of variant): Boolean; overload;
      class function valorValido(const Campo: string): Boolean; overload;

      class function valorValido(const Campo: TDate; const ValorIgual: array of variant): Boolean; overload;
      class function valorValido(const Campo: TDate): Boolean; overload;
  end;

implementation

uses
  Vcl.Forms, Winapi.Windows, Vcl.Controls, System.SysUtils;

function iif(const AExpressao: boolean; const returnTrue: Variant; const returnElse: variant): Variant;
begin
  if AExpressao then
    Result := returnTrue
  else
    Result := returnElse;
end;

function montarMsgCampoObrigatorio(const campo: string; const MsgPersonalizada: string): string;
begin
  Result := Format(iif(MsgPersonalizada <> '', MsgPersonalizada, ' %s é obrigatório e não foi preenchido!'), [Campo]);
end;

{ TMessageBox }

class function TMessageBox.confirmar(const AMensagem: string;
  AFocus: TMessageBoxOption; AIcone: TMessageBoxIcone): TMessageBoxOption;
var
  foco, icone: Integer;
begin
  case AFocus of
    moSim: foco := MB_DEFBUTTON1;
    moNao: foco := MB_DEFBUTTON2;
  end;

  case AIcone of
    miErro : icone := MB_ICONERROR;
    miPergunta : icone := MB_ICONQUESTION;
    miAtencao : icone := MB_ICONWARNING;
    miInformacao : icone := MB_ICONINFORMATION;
  end;

  case Application.MessageBox(PChar(AMensagem), 'Confirmação', MB_YESNO + icone + foco) of
    mrYes:
      Exit(moSim);
    mrNo:
      Exit(moNao);
  end;
end;

class procedure TMessageBox.informar(const AMensagem: string;
  const AIcone: TMessageBoxIcone);
var
  icone: integer;
begin
  case AIcone of
    miErro : icone := MB_ICONERROR;
    miPergunta : icone := MB_ICONQUESTION;
    miAtencao : icone := MB_ICONWARNING;
    miInformacao : icone := MB_ICONINFORMATION;
  end;

  Application.MessageBox(PChar(AMensagem), 'Atenção', MB_OK + icone);
end;

class function TValidaValores.valorValido(const Campo: integer): Boolean;
begin
  Result := false;

  if Campo = 0 then begin
    Exit;
  end;

  Result := true;
end;

class function TValidaValores.valorValido(const Campo: integer; const ValorIgual: array of variant): Boolean;
var
  i: integer;
  valorEstaNaLista: boolean;
begin
  Result := false;

  if not TValidaValores.valorValido(Campo) then begin
    Exit;
  end;

  if Length(ValorIgual) = 0 then begin
    Result := true;
    exit;
  end;

  Result := TValidaValores.validaValorIgual(Campo, ValorIgual);
end;

class function TValidaValores.valorValido(const Campo: string): Boolean;
begin
  Result := false;

  if Campo = '' then begin
    Exit;
  end;

  Result := true;
end;

class function TValidaValores.valorValido(const Campo: string; const ValorIgual: array of variant): Boolean;
var
  i: integer;
  valorEstaNaLista: boolean;
begin
  Result := false;

  if not TValidaValores.valorValido(Campo) then begin
    Exit;
  end;

  if Length(ValorIgual) = 0 then begin
    Result := true;
    exit;
  end;

  Result := TValidaValores.validaValorIgual(Campo, ValorIgual);
end;

class function TValidaValores.validaValorIgual(const Campo: variant;
  const ValorIgual: array of variant): boolean;
var
  i: integer;
  valorEstaNaLista: boolean;
begin
  Result := false;
  valorEstaNaLista := false;
  for i := 0 to Length(ValorIgual) -1 do begin
    if Campo = ValorIgual[i] then  begin
      valorEstaNaLista := true;
    end;
  end;

  Result := valorEstaNaLista;
end;

class function TValidaValores.valorValido(const Campo: TDate): Boolean;
begin
  Result := false;

  if Campo = 0 then begin
    Exit;
  end;

  Result := true;
end;

class function TValidaValores.valorValido(const Campo: double): Boolean;
begin
  Result := false;

  if Campo = 0 then begin
    Exit;
  end;

  Result := true;
end;

class function TValidaValores.valorValido(const Campo: Double;
  const ValorIgual: array of variant): Boolean;
begin
  Result := false;

  if not TValidaValores.valorValido(Campo) then begin
    Exit;
  end;

  if Length(ValorIgual) = 0 then begin
    Result := true;
    exit;
  end;

  Result := TValidaValores.validaValorIgual(Campo, ValorIgual);
end;

class function TValidaValores.valorValido(const Campo: TDate; const ValorIgual: array of variant): Boolean;
var
  i: integer;
  valorEstaNaLista: boolean;
begin
  Result := false;

  if not TValidaValores.valorValido(Campo) then begin
    Exit;
  end;

  if Length(ValorIgual) = 0 then begin
    Result := true;
    exit;
  end;

  Result := TValidaValores.validaValorIgual(Campo, ValorIgual);
end;

end.
