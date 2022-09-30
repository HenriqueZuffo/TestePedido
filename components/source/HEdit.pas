unit HEdit;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.Graphics;

type
  THedit = class(TEdit)
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
  RegisterComponents('HenriqueComponentes', [THedit]);
end;

{ THedit }

constructor THedit.Create(AOwner: TComponent);
begin
  inherited;
  OriginalColor := Color;
  ColorFocus := $00FFFF80;
end;

procedure THedit.DoEnter;
begin
  inherited;
  Color := ColorFocus;
end;

procedure THedit.DoExit;
begin
  inherited;
  Color := OriginalColor;
end;

procedure THedit.SetColorFocus(const Value: TColor);
begin
  FColorFocus := Value;
end;

procedure THedit.SetOriginalColor(const Value: TColor);
begin
  FOriginalColor := Value;
end;

end.
