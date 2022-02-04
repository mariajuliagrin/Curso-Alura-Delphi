program contatos;

uses
  Vcl.Forms,
  unitContatos in 'unitContatos.pas' {formContatos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformContatos, formContatos);
  Application.Run;
end.
