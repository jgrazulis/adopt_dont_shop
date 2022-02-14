require 'rails_helper'

describe 'new application form' do

  scenario 'form creates new application and lists on application show page' do
    visit '/applications/new'

    @scranton = Shelter.create!(name: "Scranton Animal Shelter", city: "Scranton, PA", foster_program: false, rank: 9)

    @bob = Application.create!(name: "Bob Vance", street_address: "1234 Dunder Ave", city: "Scranton", state: "PA", zip_code: "18508" , description: "Phyllis and I love dogs, want one", status: 1)
    
    @mia = @bob.pets.create!(name: "Mia", age: 4, breed: "American Bulldog", adoptable: true, shelter_id: @scranton.id)

    fill_in('Name', with: 'Bob Vance')
    fill_in('', with: true)
    fill_in('Street Address', with: "123 Dunder Ave.")
    fill_in('City', with: "Scranton")
    fill_in('State', with: "PA")
    fill_in('Zip Code', with: "18508")
    click_on 'Submit'
    expect(current_path).to eq("/applications/#{@bob.id}")
    expect(page).to have_content('Bob Vance')
  end
end