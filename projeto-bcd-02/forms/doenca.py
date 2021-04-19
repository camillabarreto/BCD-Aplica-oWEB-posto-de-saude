from flask_wtf import FlaskForm
from wtforms import SubmitField, IntegerField, validators

class DoencaForm(FlaskForm):
    idDoenca = IntegerField('idDoenca')
    btnAtualizar = SubmitField('Buscar')