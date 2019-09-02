# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

info_211 = Organization.create(name: '211_info', contact: 'Ciara', email: 'ciara@example.org', phone: '(503) 555-5555')

info_211.needs.create(resource: "Children's clothing", description: 'All sizes', quantity: '50')
info_211.needs.create(resource: "Women's clothing", description: 'All sizes', quantity: '25')
info_211.needs.create(resource: 'Blankets', description: 'All sizes', quantity: '100')

info_211.surplus.create(resource: 'Food', description: 'Canned goods', quantity: '500')
info_211.surplus.create(resource: 'Mens shoes', description: 'All sizes', quantity: '100')
info_211.surplus.create(resource: "Women's shoes", description: 'Size 10', quantity: '20')
