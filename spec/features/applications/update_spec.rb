require 'rails_helper'

RSpec.describe 'application update' do
  before(:each) do
    @scranton = Shelter.create!(name: "Scranton Animal Shelter", city: "Scranton, PA", foster_program: false, rank: 9)
    @denver = Shelter.create!(name: "Denver Animal Shelter", city: "Denver, CO", foster_program: false, rank: 9)

    @jess = Application.create!(name: "Jess G", street_address: "5432 Marion Blvd", city: "Denver", state: "CO", zip_code: "80210" , description: "I love dogs, want one", status: 0)
    
    @mia = Pet.create!(name: "Mia", age: 4, breed: "American Bulldog", adoptable: true, shelter_id: @scranton.id)
    @leo = Pet.create!(name: "Leo", age: 2, breed: "Tabby", adoptable: true, shelter_id: @scranton.id)

    @pet_application1 = PetApplication.create!(pet: @leo, application: @jess, status: 1)

  end


  scenario 'visitor clicks on pet returned in search to add to app' do
    visit "/applications/#{@jess.id}"

    fill_in('query', with: 'Mia')
    click_button('Search')

    within "#add-pet-to-application" do
      expect(page).to have_content(@mia.name)
      expect(page).to_not have_content(@leo.name)
    end

    click_link("Adopt #{@mia.name}")
    expect(current_path).to eq("/applications/#{@jess.id}")
  end

  scenario 'visitor sees section to submit application once pets are added' do
    visit "/applications/#{@jess.id}"

    fill_in('description', with: "love dogs")
    click_button("Submit Application")
    expect(page).to have_content("Status: pending")
    expect(page).to_not have_content("Add a pet to this application")
  end
end 