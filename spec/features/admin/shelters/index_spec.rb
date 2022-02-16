require 'rails_helper'

RSpec.describe 'admin shelters index' do
   
  before(:each) do
    @scranton = Shelter.create!(name: "Scranton Animal Shelter", city: "Scranton, PA", foster_program: false, rank: 9)
    @denver = Shelter.create!(name: "Denver Animal Shelter", city: "Denver, CO", foster_program: false, rank: 9)
    @aurora = Shelter.create!(name: "Aurora Animal Shelter", city: "Aurora, IL", foster_program: true, rank: 9)

    @mia = @denver.pets.create!(name: "Mia", age: 4, breed: "American Bulldog", adoptable: true, shelter_id: @denver.id)
    @leo = @aurora.pets.create!(name: "Leo", age: 2, breed: "Tabby", adoptable: true, shelter_id: @aurora.id)
    @maggie = @scranton.pets.create!(name: "Margaret Thatcher", age: 5, breed: "Golden Retriever", adoptable: true, shelter_id: @scranton.id)

    @bob = Application.create!(name: "Bob Vance", street_address: "1234 Dunder Ave", city: "Scranton", state: "PA", zip_code: "18508" , description: "Phyllis and I love dogs, want one", status: 1)
    @jess = Application.create!(name: "Jess G", street_address: "5432 Marion Blvd", city: "Denver", state: "CO", zip_code: "80210" , description: "I love dogs, want one", status: 0)
    @lalo = Application.create!(name: "Eduardo R.", street_address: "10 Tennessee St.", city: "Aurora", state: "CO", zip_code: "80129", description: "he's cute")

    @pet_application1 = PetApplication.create!(pet: @mia, application: @jess, status: 1)
    @pet_application2 = PetApplication.create!(pet: @leo, application: @lalo, status: 1)
    @pet_application3 = PetApplication.create!(pet: @maggie, application: @bob, status: 1)


    visit "/admins/shelters"
  end

  it 'shows names of all shelters' do
    expect(current_path).to eq("/admins/shelters")
    expect(page).to have_content(@scranton.name)
    expect(page).to have_content(@denver.name)
    expect(page).to have_content(@aurora.name)
  end

  it 'lists shelters in reverse alphabetical order' do 
    expect(@scranton.name).to appear_before(@denver.name)
    expect(@denver.name).to appear_before(@aurora.name)
  end

  it 'includes section for shelters with pending apps' do
    within '#pending-apps' do
      expect(page).to have_content(@scranton.name)
      expect(page).to_not have_content(@denver.name)
    end
  end
end 