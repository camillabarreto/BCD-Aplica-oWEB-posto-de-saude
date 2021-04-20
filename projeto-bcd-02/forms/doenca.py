from flask_wtf import FlaskForm
from wtforms import SubmitField, IntegerField, validators

class DoencaForm(FlaskForm):
    idDoenca = IntegerField('idDoenca', [validators.DataRequired()], description='Digite número identificador da doença')
    btnAtualizar = SubmitField('Buscar')