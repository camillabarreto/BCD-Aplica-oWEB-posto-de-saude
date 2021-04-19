from flask_wtf import FlaskForm
from wtforms import SubmitField, StringField, DateField, validators

class CadastroForm(FlaskForm):
    cpf = StringField('CPF',[validators.DataRequired()])
    nome = StringField('Nome',[validators.DataRequired()])
    dataNasc = DateField('Data de nascimento',[validators.DataRequired()],format='%d/%m/%Y')
    telefone = StringField('Telefone',[validators.DataRequired()])
    endereco = StringField('Endereço',[validators.DataRequired()])
    btnAtualizar = SubmitField('Confirmar')