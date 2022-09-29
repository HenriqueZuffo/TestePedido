unit uClasseBase;

interface

type
  TBase = class abstract
  public
    procedure Salvar; virtual; abstract;
    class procedure excluir(const codigo: integer); virtual; abstract;
  end;
implementation

end.
