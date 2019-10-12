# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

## Create roles
superuser_role = Role.create(name: 'superuser')
admin_role = Role.create(name: 'admin')
member_role = Role.create(name: 'member')


## Create users
superuser = User.create(name: 'superuser', email: 'superuser@example.org', password: 'asdf1234')


## Assign roles
superuser.memberships.create(role_id: superuser_role)


## Create orgs
info_211 = Organization.create(name: '211_info', contact: 'Ciara', email: 'ciara@example.org', phone: '(503) 555-5555')
portland_shelter = Organization.create(name: 'Portland Shelter', contact: 'Bill', email: 'bill@example.org', phone: '(503) 555-0000')
multnomah_shelter = Organization.create(name: 'Multnomah Shelter', contact: 'Bob', email: 'bob@example.org', phone: '(503) 555-1111')
washington_shelter = Organization.create(name: 'Washington Shelter', contact: 'Stacey', email: 'stacey@example.org', phone: '(503) 555-2222')

orgs = [info_211, portland_shelter, multnomah_shelter, washington_shelter]

## Create some needs
need_childrens_clothing = {resource: "Children's clothing", description: 'All sizes', quantity: '100'}
need_womans_clothing = {resource: "Women's clothing", description: 'All sizes', quantity: '50'}
need_blankets = {resource: 'Blankets', description: 'All sizes', quantity: '500'}

needs = [need_childrens_clothing, need_womans_clothing, need_blankets]


## Create some surplus
surplus =
  [
    {resource: 'Food', description: 'Canned goods', quantity: '500'},
    {resource: 'Mens shoes', description: 'All sizes', quantity: '100'},
    {resource: "Women's shoes", description: 'Size 10', quantity: '200'}
  ]

orgs.each { |org| needs.each { |need| org.needs.create need } }
orgs.each { |org| surplus.each { |surplus| org.surplus.create surplus } }


## Fulfill some needs
fulfillments =
  [
    { quantity: 20, received: true, active: false, organization_id: portland_shelter.id },
    { quantity: 20, organization_id: multnomah_shelter.id },
    { quantity: 10, organization_id: washington_shelter.id }
  ]

fulfillments.each { |fulfillment| Need.all.each { |need| need.fulfillments.create fulfillment } }

## Claim some surplus
claims = fulfillments
claims[0] = { quantity: 20, picked_up: true, active: false, organization_id: portland_shelter }
claims.each { |claim| Surplu.all.each { |surplus| surplus.claims.create claim } }
