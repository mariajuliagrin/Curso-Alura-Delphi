unit unitMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
    Menu1: TMenuItem;
    Principal1: TMenuItem;
    Sada1: TMenuItem;
    Contatos1: TMenuItem;
    procedure Sada1Click(Sender: TObject);
    procedure Contatos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses unitContatos;

procedure TForm1.Contatos1Click(Sender: TObject);
begin
     form2.show;
end;

procedure TForm1.Sada1Click(Sender: TObject);
begin
     form1.Close;
end;

end.
