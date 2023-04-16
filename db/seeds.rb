# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Client.create(client_id: 1, name: 'Pedro Pérez', city_id: 1)
Client.create(client_id: 2, name: 'Ana Álvarez', city_id: 2)

City.create(city_id: 1, name: 'Bogotá')
City.create(city_id: 2, name: 'Medellín')

User.create(name: 'admin', pass: 'password', email: 'admin@example.com')