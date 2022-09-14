# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!([
  {first_name: 'Administrador', last_name: 'Sayagbeh', email: 'admin@example.com', password: '123456', password_confirmation: '123456', admin: true, level: 1},
  {first_name: "Rolando", last_name: "Gonzalez", phone: "983 131 8859", address: "CDA Maya Real, Condominio EB, No. 10", admin: false, email: "roga83@mail.com", password: '123456', password_confirmation: '123456', registrer_id: 1, parent_id: 1, level: 2},
  {first_name: "Yuri", last_name: "Castillo", phone: "983 131 8859", address: "Av. Heriberto Frias No. 420", admin: false, email: "yuri.castillo@mail.com", password: '123456', password_confirmation: '123456', registrer_id: 1, parent_id: 1, level: 2},
  {first_name: "Katia", last_name: "Rodriguez", phone: "983 112 8696", address: "Av. Napoles No. 110", admin: false, email: "katia.rod@mail.com", password: '123456', password_confirmation: '123456', registrer_id: 1, parent_id: 1, level: 2},
  {first_name: "Alfredo", last_name: "Rendon", phone: "983 667 3612", address: "Av. 4 de Marzo No. 10", admin: false, email: "rendon@mail.com", password: '123456', password_confirmation: '123456', registrer_id: 1, parent_id: 2, level: 3},
  {first_name: "Gareth", last_name: "Belmonth", phone: "699 197 8686", address: "Transilvania No. 742", admin: false, email: "gareth.belmonth@mail.com", password: '123456', password_confirmation: '123456', registrer_id: 2, parent_id: 2, level: 3},
  {first_name: "Azuna", last_name: "Yuuki", phone: "556 998 4563", address: "Calle Honosuba No. 144", admin: false, email: "yuuki.azuna@mail.com", password: '123456', password_confirmation: '123456', registrer_id: 1, parent_id: 3, level: 3},
  {first_name: "Edgar", last_name: "Monforte", phone: "983 688 4566", address: "Tela No. 447", admin: false, email: "edgar.monforte@mail.com", password: '123456', password_confirmation: '123456', registrer_id: 3, parent_id: 3, level: 3},
  {first_name: "Mariana", last_name: "Bisoño", phone: "983 255 3619", address: "Calle principal No. 57", admin: false, email: "mariana.bisoño@mail.com", password: '123456', password_confirmation: '123456', registrer_id: 1, parent_id: 4, level: 3},
  {first_name: "Richie", last_name: "Ofaril", phone: "555 123 7894", address: "Av Pedregal No.463", admin: false, email: "rich.ofaril@mail.com", password: '123456', password_confirmation: '123456', registrer_id: 4, parent_id: 4, level: 3},
  {first_name: "Sakura", last_name: "Kinomoto", phone: "966 845 9931", address: "Calle Cetezos No. 366", admin: false, email: "sakura.kino@mail.com", password: '123456', password_confirmation: '123456', registrer_id: 1, parent_id: 4, level: 3},
  {first_name: "Daniel", last_name: "Larussso", phone: "557 145 3347", address: "Av. Resseda No. 120", admin: false, email: "daniel.san@mail.com", password: '123456', password_confirmation: '123456', registrer_id: 2, parent_id: 5, level: 4}
]) if Rails.env.development?

Product.create!([
  {code: "PL3567",
  name: "Pildorin",
  description: "Capsula que alivia dolor articular y muscular, desinflamatorio.",
  ingredients: "ing1, ing2, ing3",
  price: 58,
  stock: 39},
  {code: "88PP",
  name: "Q-Ventud",
  description: "Producto con lo mejor de los antioxidantes y vitamina Q-10",
  ingredients: "Vitamina Q-10, Minerales, Antioxidantes, cafeina",
  price: 67,
  stock: 44},  
  {code: "WE32",
  name: "Fenalina",
  description: "Mejora la piel, y hace un chingo de cosas mas",
  ingredients: "mineral, piedra, te, chingaderas",
  price: 57,
  stock: 32},
]) if Rails.env.development?

