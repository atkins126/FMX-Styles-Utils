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
/// File last update : 2025-05-17T09:09:35.167+02:00
/// Signature : c8f326fb01f6a87aa5d9d071f0bf76bc8b7e4d34
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
  TStyleDarkByDefault = class(T__StyleContainerAncestor)
  private
  public
    class function GetStyleName: string; override;
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

TStyleDarkByDefault.Initialize;

end.
