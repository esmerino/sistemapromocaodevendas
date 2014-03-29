# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Funcionario.create(nome: "petrus saulo", login: "petrus", senha:"padrao")
Funcionario.create(nome: "luiz filipe", login: "filipe", senha:"padrao")
p "Funcionarios cadastrados"

User.create(nome: "admin", email: "admin@admin.com", password:"admin")
p "Usuario cadastrado"
