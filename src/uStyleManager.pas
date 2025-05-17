/// <summary>
/// ***************************************************************************
///
/// FMX Styles Utils
///
/// Copyright 2025 Patrick PREMARTIN and Serge GIRARD under AGPL 3.0 license.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
/// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
/// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
/// DEALINGS IN THE SOFTWARE.
///
/// ***************************************************************************
///
/// Author(s) :
/// Patrick PREMARTIN and Serge GIRARD
///
/// Site :
/// https://fmxstylesutils.developpeur-pascal.fr/
///
/// Project site :
/// https://github.com/DeveloppeurPascal/FMX-Styles-Utils
///
/// ***************************************************************************
/// File last update : 2025-05-17T09:09:24.877+02:00
/// Signature : 9629bd15ec57dc09a9c46c08acd74c9cc42b7bf8
/// ***************************************************************************
/// </summary>

unit uStyleManager;

interface

// TODO -oDeveloppeurPascal : add XML doc comments
uses
  System.Types,
  System.Generics.Collections,
  System.Messaging;

type
{$SCOPEDENUMS ON}
  TProjectStyleType = (light, dark, other);

  TProjectStyleItem = class
  private
    FStyleType: TProjectStyleType;
    FStyleName: string;
    procedure SetStyleName(const Value: string);
    procedure SetStyleType(const Value: TProjectStyleType);
  protected
  public
    property StyleName: string read FStyleName write SetStyleName;
    property StyleType: TProjectStyleType read FStyleType write SetStyleType;
    constructor Create(const StyleName: string;
      const StyleType: TProjectStyleType);
  end;

  TProjectStylesList = class(TObjectList<TProjectStyleItem>)
  end;

  TProjectStyleChangeMessage = class(tmessage<string>)
  end;

  TProjectStyle = class
  private
    FStyleName: string;
    FStyles: TProjectStylesList;
    procedure SetStyleName(const Value: string);
    function GetStyleCount: integer;
    function GetStyle(const Index: integer): TProjectStyleItem;
  protected
    constructor Create;
  public
    property StyleName: string read FStyleName write SetStyleName;
    property StylesCount: integer read GetStyleCount;
    property Styles[const Index: integer]: TProjectStyleItem read GetStyle;
    function GetStyles(const StyleType: TProjectStyleType): TStringDynArray;
    procedure Register(const StyleName: string;
      const StyleType: TProjectStyleType = TProjectStyleType.other);
    class function Current: TProjectStyle;
    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils,
  System.Classes;

var
  ProjectStyle: TProjectStyle;

constructor TProjectStyle.Create;
begin
  inherited;
  FStyles := TProjectStylesList.Create;
end;

class function TProjectStyle.Current: TProjectStyle;
begin
  if not assigned(ProjectStyle) then
    ProjectStyle := TProjectStyle.Create;
  result := ProjectStyle;
end;

destructor TProjectStyle.Destroy;
begin
  FStyles.Free;
  inherited;
end;

function TProjectStyle.GetStyle(const Index: integer): TProjectStyleItem;
begin
  if (index < 0) or (index >= FStyles.Count) then
    result := nil
  else
    result := FStyles[index];
end;

function TProjectStyle.GetStyleCount: integer;
begin
  result := FStyles.Count;
end;

function TProjectStyle.GetStyles(const StyleType: TProjectStyleType)
  : TStringDynArray;
var
  i, nb, idx: integer;
begin
  nb := 0;
  for i := 0 to FStyles.Count - 1 do
    if FStyles[i].StyleType = StyleType then
      inc(nb);

  setlength(result, nb);
  idx := 0;
  for i := 0 to FStyles.Count - 1 do
    if FStyles[i].StyleType = StyleType then
    begin
      result[idx] := FStyles[i].StyleName;
      inc(idx);
    end;
end;

procedure TProjectStyle.Register(const StyleName: string;
  const StyleType: TProjectStyleType);
begin
  if StyleName.trim.isempty then
    exit;

  FStyles.Add(TProjectStyleItem.Create(StyleName, StyleType));
end;

procedure TProjectStyle.SetStyleName(const Value: string);
begin
  FStyleName := Value;

  tthread.queue(nil,
    procedure
    begin
      TMessageManager.DefaultManager.SendMessage(nil,
        TProjectStyleChangeMessage.Create(FStyleName));
    end);
end;

constructor TProjectStyleItem.Create(const StyleName: string;
const StyleType: TProjectStyleType);
begin
  inherited Create;
  FStyleName := StyleName;
  FStyleType := StyleType;
end;

procedure TProjectStyleItem.SetStyleName(const Value: string);
begin
  FStyleName := Value;
end;

procedure TProjectStyleItem.SetStyleType(const Value: TProjectStyleType);
begin
  FStyleType := Value;
end;

initialization

ProjectStyle := nil;

finalization

ProjectStyle.Free;

end.
