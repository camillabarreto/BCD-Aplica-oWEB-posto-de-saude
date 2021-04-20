from flask_wtf import FlaskForm
from wtforms import SubmitField, StringField, validators

class PacienteForm(FlaskForm):
    CPF = StringField('CPF', [validators.DataRequired()], description='Digite a sequência numérica sem os separadores', render_kw={"placeholder": "11122233344"})
    btnAtualizar = SubmitField('Buscar')