unit HDbEdit;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Graphics;

type

  THDbEdit = class(TDBEdit)
  private
    FColorFocus: TColor;
    FOriginalColor: TColor;
    procedure SetColorFocus(const Value: TColor);
    procedure SetOriginalColor(const Value: TColor);
    property OriginalColor: TColor read FOriginalColor write SetOriginalColor;
    { Private declarations }
  protected
    procedure DoEnter; override;
    procedure DoExit; override;
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    { Public declarations }
  published
    property ColorFocus: TColor read FColorFocus write SetColorFocus;
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('HenriqueComponentes', [THDbEdit]);
end;

{ THDbEdit }

constructor THDbEdit.Create(AOwner: TComponent);
begin
  inherited;
  OriginalColor := Color;
  ColorFocus := $00FFFF80;
end;

procedure THDbEdit.DoEnter;
begin
  inherited;
  Color := ColorFocus;
end;

procedure THDbEdit.DoExit;
begin
  inherited;
  Color := OriginalColor;
end;

procedure THDbEdit.SetColorFocus(const Value: TColor);
begin
  FColorFocus := Value;
end;

procedure THDbEdit.SetOriginalColor(const Value: TColor);
begin
  FOriginalColor := Value;
end;

end.
