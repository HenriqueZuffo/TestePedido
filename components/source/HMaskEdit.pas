unit HMaskEdit;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.Mask, Vcl.Graphics;

type

  THMaskEdit = class(TMaskEdit)
  private
    FColorFocus: TColor;
    FOriginalColor: TColor;
    FApenasNumeros: Boolean;
    procedure SetColorFocus(const Value: TColor);
    procedure SetOriginalColor(const Value: TColor);
    procedure SetApenasNumeros(const Value: Boolean);
    property OriginalColor: TColor read FOriginalColor write SetOriginalColor;
    { Private declarations }
  protected
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure KeyPress(var Key: Char); override;
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    { Public declarations }
  published
    property ColorFocus: TColor read FColorFocus write SetColorFocus;
    property ApenasNumeros: Boolean read FApenasNumeros write SetApenasNumeros;
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('HenriqueComponentes', [THMaskEdit]);
end;

{ THMaskEdit }

constructor THMaskEdit.Create(AOwner: TComponent);
begin
  inherited;
  OriginalColor := Color;
  ColorFocus := $00FFFF80;
end;

procedure THMaskEdit.DoEnter;
begin
  inherited;
  Color := ColorFocus;
end;

procedure THMaskEdit.DoExit;
begin
  inherited;
  Color := OriginalColor;
end;

procedure THMaskEdit.KeyPress(var Key: Char);
begin
  inherited;
  if ApenasNumeros then begin
    if not (Key in ['0'..'9',',',#8]) then begin
      Key := #0;
      Beep;
    end;
  end;
end;

procedure THMaskEdit.SetApenasNumeros(const Value: Boolean);
begin
  FApenasNumeros := Value;
end;

procedure THMaskEdit.SetColorFocus(const Value: TColor);
begin
  FColorFocus := Value;
end;

procedure THMaskEdit.SetOriginalColor(const Value: TColor);
begin
  FOriginalColor := Value;
end;

end.
