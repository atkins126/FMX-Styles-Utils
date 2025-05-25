(* C2PP
  ***************************************************************************

  FMX Styles Utils

  Copyright 2025 Patrick PREMARTIN and Serge GIRARD under AGPL 3.0 license.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  DEALINGS IN THE SOFTWARE.

  ***************************************************************************

  Author(s) :
  Patrick PREMARTIN and Serge GIRARD

  Site :
  https://fmxstylesutils.developpeur-pascal.fr/

  Project site :
  https://github.com/DeveloppeurPascal/FMX-Styles-Utils

  ***************************************************************************
  File last update : 2025-05-24T19:17:34.162+02:00
  Signature : 8d6413064dd0f9dd91b8dab18e5cc15c3a4d4edd
  ***************************************************************************
*)

unit uStyleLightByDefault;

interface

uses
  System.SysUtils,
  System.Classes,
  _StyleContainerAncestor,
  FMX.Types,
  FMX.Controls,
  uStyleManager;

type
  /// <summary>
  /// The "light" FireMonkey style from Embarcadero embed in a style book.
  /// </summary>
  TStyleLightByDefault = class(T__StyleContainerAncestor)
  private
  public
    /// <summary>
    /// Returns the name of this style as a user friendly string.
    /// </summary>
    class function GetStyleName: string; override;
    /// <summary>
    /// Returns the type (light, dark, other) of this style .
    /// </summary>
    class function GetStyleType: TProjectStyleType; override;
  end;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

class function TStyleLightByDefault.GetStyleName: string;
begin
  result := 'Light';
end;

class function TStyleLightByDefault.GetStyleType: TProjectStyleType;
begin
  result := TProjectStyleType.light;
end;

initialization

TStyleLightByDefault.RegisterStyle;

end.
