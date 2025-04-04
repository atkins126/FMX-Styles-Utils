/// <summary>
/// ***************************************************************************
///
/// FMX Styles Utils
///
/// Copyright 2025 Patrick PREMARTIN & Serge GIRARD under AGPL 3.0 license.
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
/// Patrick PREMARTIN & Serge GIRARD
///
/// Project site :
/// https://github.com/DeveloppeurPascal/FMX-Styles-Utils
///
/// ***************************************************************************
/// File last update : 2025-04-04T10:45:26.000+02:00
/// Signature : 3d6d4c4ea96403116397ac41865d4b647d9b9db3
/// ***************************************************************************
/// </summary>

unit fMain;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Layouts,
  FMX.Edit,
  FMX.ListBox,
  FMX.Controls.Presentation,
  FMX.StdCtrls;

type
  TForm1 = class(TForm)
    btnLightStyle: TButton;
    btnDarkStyle: TButton;
    Edit1: TEdit;
    ListBox1: TListBox;
    EditButton1: TEditButton;
    GridPanelLayout1: TGridPanelLayout;
    procedure EditButton1Click(Sender: TObject);
    procedure btnLightStyleClick(Sender: TObject);
    procedure btnDarkStyleClick(Sender: TObject);
  private
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  uStyleManager;

procedure TForm1.btnDarkStyleClick(Sender: TObject);
begin
  TProjectStyle.Current.StyleName := 'Dark';
end;

procedure TForm1.btnLightStyleClick(Sender: TObject);
begin
  TProjectStyle.Current.StyleName := 'Light';
end;

procedure TForm1.EditButton1Click(Sender: TObject);
begin
  if not Edit1.text.trim.IsEmpty then
    ListBox1.items.add(Edit1.text);
  Edit1.SetFocus;
end;

initialization

{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}

end.
