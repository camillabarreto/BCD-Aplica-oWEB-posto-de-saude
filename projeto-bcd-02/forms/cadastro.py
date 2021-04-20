from flask_wtf import FlaskForm
from wtforms import SubmitField, StringField, DateField, validators

class CadastroForm(FlaskForm):
    cpf = StringField('CPF',[validators.DataRequired()], description='Digite a sequência numérica sem os separadores', render_kw={"placeholder": "11122233344"})
    nome = StringField('Nome',[validators.DataRequired()], render_kw={"placeholder": "Nome completo"})
    dataNasc = DateField('Data de nascimento',[validators.DataRequired()],format='%d/%m/%Y', render_kw={"placeholder": "dd/mm/yyyy"})
    telefone = StringField('Telefone',[validators.DataRequired()], description='Digite a sequência numérica sem os separadores', render_kw={"placeholder": "4833335555"})
    endereco = StringField('Endereço',[validators.DataRequired()], description='Informe sua cidade', render_kw={"placeholder": "Cidade"})
    btnAtualizar = SubmitField('Confirmar')