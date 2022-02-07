program Project2;

uses
  Vcl.Forms,
  unitContatos in 'unitContatos.pas' {Form2},
  unitMenu in 'unitMenu.pas' {Form1},
  unitLogin in 'unitLogin.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
