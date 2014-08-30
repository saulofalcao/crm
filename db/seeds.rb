# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')


cliente = Cliente.create(nome: "Joao de Souza", email: "sffalcao@gmail.com", endereco: "Rua das Perdizes, 7979. Torre 3, Apt. 1802", bairro: "Cidade Satélite", telefone: "(84) 8809-2128")
Tarefa.create(vencimento: "2014-11-10", titulo: "Ligar para renovar serviço", cliente_id: cliente.id)
