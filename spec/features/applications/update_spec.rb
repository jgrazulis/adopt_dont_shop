require 'rails_helper'

RSpec.describe 'application update' do
  before(:each) do
    @scranton = Shelter.create!(name: "Scranton Animal Shelter", city: "Scranton, PA", foster_program: false, rank: 9)
    @denver = Shelter.create!(name: "Denver Animal Shelter", city: "Denver, CO", foster_program: false, rank: 9)

    # @bob = Application.create!(name: "Bob Vance", street_address: "1234 Dunder Ave", city: "Scranton", state: "PA", zip_code: "18508" , description: "Phyllis and I love dogs, want one", status: 0)
    @jess = Application.create!(name: "Jess G", street_address: "5432 Marion Blvd", city: "Denver", state: "CO", zip_code: "80210" , description: "I love dogs, want one", status: 0)
    
    @mia = Pet.create!(name: "Mia", age: 4, breed: "American Bulldog", adoptable: true, shelter_id: @scranton.id)
    @leo = Pet.create!(name: "Leo", age: 2, breed: "Tabby", adoptable: true, shelter_id: @scranton.id)
    @maggie = Pet.create!(name: "Margaret Thatcher", age: 5, breed: "Golden Retriever", adoptable: true, shelter_id: @denver.id)

    @pet_application1 = PetApplication.create!(pet: @leo, application: @jess)
    # @pet_application2 = PetApplication.create!(pet: @mia, application: @bob)

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
end 