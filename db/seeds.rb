# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

scranton = Shelter.create!(name: "Scranton Animal Shelter", city: "Scranton, PA", foster_program: false, rank: 9)
denver = Shelter.create!(name: "Denver Animal Shelter", city: "Denver, CO", foster_program: false, rank: 9)
aurora = Shelter.create!(name: "Aurora Animal Shelter", city: "Aurora, IL", foster_program: true, rank: 9)

bob = Application.create!(name: "Bob Vance", street_address: "1234 Dunder Ave", city: "Scranton", state: "PA", zip_code: "18508" , description: "Phyllis and I love dogs, want one", status: 1)
jess = Application.create!(name: "Jess G", street_address: "5432 Marion Blvd", city: "Denver", state: "CO", zip_code: "80210" , description: "I love dogs, want one", status: 0)
lalo = Application.create!(name: "Eduardo R.", street_address: "10 Tennessee St.", city: "Aurora", state: "CO", zip_code: "80129", description: "he's cute")

mia = Pet.create!(name: "Mia", age: 4, breed: "American Bulldog", adoptable: true, shelter_id: denver.id)
leo = Pet.create!(name: "Leo", age: 2, breed: "Tabby", adoptable: true, shelter_id: aurora.id)
maggie = Pet.create!(name: "Margaret Thatcher", age: 5, breed: "Golden Retriever", adoptable: true, shelter_id: scranton.id)

pet_application1 = PetApplication.create!(pet: mia, application: jess)
pet_application2 = PetApplication.create!(pet: leo, application: lalo)
pet_application3 = PetApplication.create!(pet: maggie, application: bob)

