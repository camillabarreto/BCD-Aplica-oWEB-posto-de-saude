from flask import Flask, flash, redirect, url_for, request, session, render_template, jsonify
from flask_bootstrap import Bootstrap
from flask_nav import Nav
from flask_nav.elements import Navbar, View, Subgroup
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.ext.automap import automap_base
from datetime import datetime, timedelta, date

# https://fontawesome.com/icons
from flask_fontawesome import FontAwesome

# Salvando senhas de maneira apropriada no banco de dados.
# https://werkzeug.palletsprojects.com/en/1.0.x/utils/#module-werkzeug.security
# Para gerar a senha a ser salva no DB, faça:
# senha = generate_password_hash('1234')
from werkzeug.security import generate_password_hash, check_password_hash

from forms.login import LoginForm
from forms.contato import ContatoForm

app = Flask(__name__)
app.secret_key = "SECRET_KEY"

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://camilla:bcd1234@ampto.sj.ifsc.edu.br:33006/pp02camilla'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS']=False

db = SQLAlchemy(app)

Base = automap_base()
Base.prepare(db.engine, reflect=True)


Situação = Base.classes.Situação
Posto = Base.classes.Posto
Pessoa - Base.classes.Pessoa
Calendario = Base.classes.Calendario
Fabricante = Base.classes.Fabricante
Vacina = Base.classes.Vacina
Compra = Base.classes.Compra
Doenca = Base.classes.Doenca


# Usuario = Base.classes.Usuario
# Contato = Base.classes.Contato
# Telefone = Base.classes.Telefone


boostrap = Bootstrap(app)
fa = FontAwesome(app)

nav = Nav()
nav.init_app(app)

@nav.navigation()
def meunavbar():
    menu = Navbar('Sistema de Informação')
    menu.items = [View('Inicial', 'inicio'), ]
    menu.items.append(Subgroup('Vacinas','listar_vacinas'))
    menu.items.append(Subgroup('Calendario','ver_calendario'))
    menu.items.append(Subgroup('Paciente','procurar_paciente'))
    # menu.items.append(View('Sair', 'logout'))
    return menu

@app.route('/vacinas')
def listar_vacinas():
    # ver as vacinas: aplicadas, em estoque ou descartadas
    # fazer um filtro para um desses tipos
    pass

@app.route('/calendario')
def ver_calendario():
    # ver um calendario especifico
    # campo onde seleciona o ano
    pass

@app.route('/paciente')
def procurar_paciente():
    # procurar um paciente especifico
    pass

@app.route('/cadastro')
def cadastrar_paciente():
    # cadastrar um novo paciente
    pass


if __name__ == '__main__':
    app.run(debug=True)