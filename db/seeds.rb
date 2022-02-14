# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

scranton = Shelter.create!(name: "Scranton Animal Shelter", city: "Scranton, PA", foster_program: false, rank: 9)

bob = Application.create!(name: "Bob Vance", street_address: "1234 Dunder Ave", city: "Scranton", state: "PA", zip_code: "18508" , description: "Phyllis and I love dogs, want one", status: 1)
    
mia = bob.pets.create!(name: "Mia", age: 4, breed: "American Bulldog", adoptable: true, shelter_id: scranton.id)
leo = Pet.create!(name: "Leo", age: 2, breed: "Tabby", adoptable: true, shelter_id: scranton.id)

