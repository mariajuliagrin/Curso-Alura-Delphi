unit unitContatos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Vcl.StdCtrls, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    txtID: TEdit;
    txtEmail: TEdit;
    txtNome: TEdit;
    txtTelefone: TEdit;
    txtObs: TMemo;
    FDConnection1: TFDConnection;
    tbContatos: TFDTable;
    DataSource1: TDataSource;
    btNovo: TButton;
    btSalvar: TButton;
    btProximo: TButton;
    btAnterior: TButton;
    procedure carrega;
    procedure limpa;
    procedure bloqueia;
    procedure FormCreate(Sender: TObject);

    procedure btProximoClick(Sender: TObject);
    procedure btAnteriorClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.bloqueia;
begin

  txtNome.Enabled := not txtNome.Enabled;
  txtTelefone.Enabled := not txtTelefone.Enabled;
  txtEmail.Enabled := not txtEmail.Enabled;
  txtObs.Enabled := not txtObs.Enabled;
end;
procedure TForm2.limpa;
begin
  txtId.Text :='';
  txtNome.Text :='';
  txtTelefone.Text :='';
  txtEmail.Text :='';
  txtObs.Text :='';
end;
procedure TForm2.btAnteriorClick(Sender: TObject);
begin
  tbContatos.Prior;
  carrega;
end;

procedure TForm2.btNovoClick(Sender: TObject);
begin
     tbContatos.Insert;
     bloqueia  ;
     limpa;
end;

procedure TForm2.btProximoClick(Sender: TObject);
begin
 tbContatos.Next;
 carrega;
end;

procedure TForm2.carrega;
begin
  txtId.Text := tbContatos.FieldByName('id').Value;
  txtNome.Text := tbContatos.FieldByName('nome').Value;
  txtTelefone.Text := tbContatos.FieldByName('telefone').Value;
  txtEmail.Text := tbContatos.FieldByName('email').Value;
  if tbContatos.FieldByName('observacoes').Value = NULL then
    txtObs.Text := ''
  else
  txtObs.Text := tbContatos.FieldByName('observacoes').Value;
end;
procedure TForm2.FormCreate(Sender: TObject);
begin
 carrega;
end;

end.
