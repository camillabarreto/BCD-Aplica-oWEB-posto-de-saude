from flask_wtf import FlaskForm
from wtforms import SubmitField, StringField, validators

class PacienteForm(FlaskForm):
    CPF = StringField('CPF')
    btnAtualizar = SubmitField('Buscar')