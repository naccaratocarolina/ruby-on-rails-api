# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Owner.create(name: "Bob")
Cat.create(name: "Mina", motto: "Born to rule", owner_id: 1)
Fact.create(fact: "Um fato", cat_id: 1)
Address.create(street: "Rua tal", owner_id: 1)