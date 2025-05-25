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
  File last update : 2025-05-17T09:09:46.000+02:00
  Signature : b046416df1439a068a140f6cf54d3e5a4c13dc50
  ***************************************************************************
*)

program DarkLightSample;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {Form1},
  _StyleContainerAncestor in '..\..\src\_StyleContainerAncestor.pas' {__StyleContainerAncestor: TDataModule},
  uStyleManager in '..\..\src\uStyleManager.pas',
  uStyleDarkByDefault in 'uStyleDarkByDefault.pas' {StyleDarkByDefault: TDataModule},
  uStyleLightByDefault in 'uStyleLightByDefault.pas' {StyleLightByDefault: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
