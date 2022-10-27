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
])

Product.create!([
  {code: "PL3567",
  name: "Pildorin",
  description: "Capsula que alivia dolor articular y muscular, desinflamatorio.",
  ingredients: "ing1, ing2, ing3",
  price: 58, stock: 80,
  picture_name: "frasco1",
  video_url: "https://www.youtube.com/embed/2oQcLJs1k5I"},
  {code: "88PP",
  name: "Q-Ventud",
  description: "Producto con lo mejor de los antioxidantes y vitamina Q-10",
  ingredients: "Vitamina Q-10, Minerales, Antioxidantes, cafeina",
  price: 67, stock: 75,
  picture_name: "frasco2",
  video_url: "https://www.youtube.com/embed/IW16HgAZbmw"},
  {code: "WE32",
  name: "Fenalina",
  description: "Mejora la piel, y hace un chingo de cosas mas",
  ingredients: "mineral, piedra, te, chingaderas",
  price: 57, stock: 90,
  picture_name: "frasco3",
  video_url: "https://www.youtube.com/embed/eofSQNt2xic"},
  {code: "RI58",
  name: "Riñolin",
  description: "Ayuda a la desintoxicacion de riñones y previene el desarrollo de cirrosis.",
  ingredients: "ing1, ing2, ing3",
  price: 240, stock: 70,
  picture_name: "frasco4",
  video_url: "https://www.youtube.com/embed/v3GeoFcwIAY"},
  {code: "DBTS2",
  name: "Diabetrix2",
  description: "Coadyuvante en el tratamiento de la diabetes tipo 2, baja los niveles de azucar",
  ingredients: "Guayacan Amarillo y Rojo, nispero, guarumbo, tronadoralagrima de san pedro y catarinilla",
  price: 297, stock: 95,
  picture_name: "frasco5",
  video_url: "https://www.youtube.com/embed/X0ofgEjwNZE"},
  {code: "CK66",
  name: "Colon-Kin",
  description: "Limpia el colon. Recomendado para usarse antes de cualquier tratamiento de enfermedades degenerativas",
  ingredients: "Cardo Mariano, sabila, cascara sagrada, kelp, cola de caballo, palo brasil, diente de leon",
  price: 280, stock: 85,
  picture_name: "frasco6",
  video_url: "https://www.youtube.com/embed/YdOiPhbq6qE"},
])

Rate.create!([
  {guest: "3", payment: "10", by_level: "$30", weekly: "$30", biweekly: "$60", monthly: "$120"},
  {guest: "9", payment: "20", by_level: "$180", weekly: "$210", biweekly: "$420", monthly: "$840"},
  {guest: "27", payment: "30", by_level: "$810", weekly: "$1,020", biweekly: "$2,040", monthly: "$4,080", rank: "Plata"},
  {guest: "81", payment: "30", by_level: "$2,430", weekly: "$3,450", biweekly: "$6,900", monthly: "$13,800", rank: "Oro"},
  {guest: "243", payment: "30", by_level: "$7,290", weekly: "$10,740", biweekly: "$21,480", monthly: "$42,960", rank: "Perla"},
  {guest: "729", payment: "10", by_level: "$7,290", weekly: "$18,030", biweekly: "$36,060", monthly: "$72,120", rank: "Rubí"},
  {guest: "2,187", payment: "10", by_level: "$21,870", weekly: "$39,900", biweekly: "$79,800", monthly: "$159,600", rank: "Esmeralda"},
  {guest: "6,561", payment: "10", by_level: "$65,610", weekly: "$105,510", biweekly: "$211,020", monthly: "$422,040", rank: "Diamante"},
  {guest: "19,683", payment: "10", by_level: "$196,830", weekly: "$302,340", biweekly: "$604,680", monthly: "$1,209,360", rank: "Diamante Rex"},
  {guest: "59,049", payment: "10", by_level: "$590,490", weekly: "$892,830", biweekly: "$1,785,660", monthly: "$3,571,320", rank: "Nushi Diamante"},
  {guest: "177,147", payment: "10", by_level: "$1,771,470", weekly: "$2,664,300", biweekly: "$5,328,600", monthly: "$10,657,200"},
  {guest: "531,441", payment: "10", by_level: "$5,314,410", weekly: "$7,978,710", biweekly: "$15,957,420", monthly: "$31,914,840"},
])
