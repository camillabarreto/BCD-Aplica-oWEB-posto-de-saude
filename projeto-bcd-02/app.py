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

from forms.cadastro import CadastroForm
from forms.paciente import PacienteForm
from forms.doenca import DoencaForm

from datetime import date, datetime

app = Flask(__name__)
app.secret_key = "SECRET_KEY"

# app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://camilla:bcd1234@ampto.sj.ifsc.edu.br:33006/pp02camilla'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://camilla:bcd1234@ampto.sj.ifsc.edu.br:33006/pp02camilla'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS']=False

db = SQLAlchemy(app)

Base = automap_base()
Base.prepare(db.engine, reflect=True)


Situação = Base.classes.Situação
Posto = Base.classes.Posto
Pessoa = Base.classes.Pessoa
Calendario = Base.classes.Calendario
Agenda = Base.classes.Agenda
# Calendario_has_Vacina = Base.classes.Calendario_has_Vacina
Fabricante = Base.classes.Fabricante
Vacina = Base.classes.Vacina
# Doenca_has_Vacina = Base.classes.Doenca_has_Vacina
Compra = Base.classes.Compra
Doenca = Base.classes.Doenca


boostrap = Bootstrap(app)
fa = FontAwesome(app)

nav = Nav()
nav.init_app(app)

@nav.navigation()
def meunavbar():
    menu = Navbar('Sistema de Vacinação')
    menu.items = [View('Inicial', 'inicio'), ]
    menu.items.append(View('Pacientes', 'buscar_paciente'))
    menu.items.append(View('Doses', 'listar_doses'))
    return menu

@app.route('/')
def inicio():
    # return render_template('index.html', title='Inicial')
    print("caminho: /")
    return render_template('index.html', title='Página Inicial')

@app.route('/buscar',  methods=['GET', 'POST'])
def buscar_paciente():
    # procurar um paciente especifico
    print("caminho: /buscar")
    form = PacienteForm()
    if form.validate_on_submit():
        CPF = request.form['CPF']
        print("cpf : ", CPF)
        pessoa = db.session.query(Pessoa).filter(Pessoa.CPF == CPF).first()
        print(pessoa.nome)
        return redirect(url_for('inicio'))

    return render_template('busca_paciente.html', title='Buscar paciente', form=form)

@app.route('/cadastrar',  methods=['GET', 'POST'])
def cadastrar_paciente():
    # cadastrar um novo paciente
    print("caminho: /cadastro")
    form = CadastroForm()
    if form.validate_on_submit():
        nome = request.form['nome']
        data = request.form['dataNasc']
        dataNasc = datetime.strptime(data, '%d/%m/%Y').date()
        cpf = request.form['cpf']
        telefone = request.form['telefone']
        endereco = request.form['endereco']
        db.session.add(Pessoa(CPF=cpf, nome=nome, dataNasc=dataNasc, telefone=telefone, endereco=endereco))
        db.session.commit()
        return redirect(url_for('buscar_paciente'))
    return render_template('cadastro.html', title='Cadastrar paciente', form=form)

@app.route('/listar', methods=['GET', 'POST'])
def listar_doses():
    print("caminho: /listar")
    form = DoencaForm()
    if form.validate_on_submit():
        idDoenca = request.form['idDoenca']
        print("idDoenca : ", idDoenca)
        return redirect(url_for('inicio'))
    return render_template('busca_doses.html', title='Cadastrar paciente', form=form)


@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404


if __name__ == '__main__':
    app.run(debug=True)