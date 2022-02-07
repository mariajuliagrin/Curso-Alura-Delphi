unit unitLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TForm3 = class(TForm)
    txtSenha: TEdit;
    txtLogin: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btAcessar: TButton;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    procedure btAcessarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses unitMenu;

procedure TForm3.btAcessarClick(Sender: TObject);
begin

fdquery1.SQL.Text := 'select * from usuarios where login = :parm_login and senha = :parm_senha';
fdquery1.ParamByName('parm_login').AsString :=  txtLogin.text ;
fdquery1.ParamByName('parm_senha').AsString :=  txtSenha.text ;
fdquery1.Open;
if fdquery1.RowsAffected > 0 then
   Form1.Show
else
  showmessage ('Entre com usuario e senha correto');
end;

end.
