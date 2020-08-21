# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Creating transactions

Transaction.create!(id: 1, description: "Débito", kind: "Entrada", token: "+")
Transaction.create!(id: 2, description: "Boleto", kind: "Saída", token: "-")
Transaction.create!(id: 3, description: "Financiamento", kind: "Saída", token: "-")
Transaction.create!(id: 4, description: "Crédito", kind: "Entrada", token: "+")
Transaction.create!(id: 5, description: "Recebimento Empréstimo", kind: "Entrada", token: "+")
Transaction.create!(id: 6, description: "Vendas", kind: "Entrada", token: "+")
Transaction.create!(id: 7, description: "Recebimento TED", kind: "Entrada", token: "+")
Transaction.create!(id: 8, description: "Recebimento DOC", kind: "Entrada", token: "+")
Transaction.create!(id: 9, description: "Aluguel", kind: "Saída", token: "-")
