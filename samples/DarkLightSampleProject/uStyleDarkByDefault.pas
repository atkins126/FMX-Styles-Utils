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
/// File last update : 2025-05-24T18:59:34.000+02:00
/// Signature : c7b89862812cbe3292550c84b24ac7c383530b66
/// ***************************************************************************
/// </summary>

unit uStyleDarkByDefault;

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
  TStyleDarkByDefault = class(T__StyleContainerAncestor)
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

class function TStyleDarkByDefault.GetStyleName: string;
begin
  result := 'Dark';
end;

class function TStyleDarkByDefault.GetStyleType: TProjectStyleType;
begin
  result := TProjectStyleType.dark;
end;

initialization

TStyleDarkByDefault.RegisterStyle;

end.
