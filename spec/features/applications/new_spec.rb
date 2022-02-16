require 'rails_helper'

RSpec.describe 'the application create' do
  before(:each) do
    @scranton = Shelter.create!(name: "Scranton Animal Shelter", city: "Scranton, PA", foster_program: false, rank: 9)
    @bob = Application.create!(name: "Bob Vance", street_address: "1234 Dunder Ave", city: "Scranton", state: "PA", zip_code: "18508" , description: "Phyllis and I love dogs, want one", status: 1)
    @mia = @bob.pets.create!(name: "Mia", age: 4, breed: "American Bulldog", adoptable: true, shelter_id: @scranton.id)
    
  end

  
  context 'given valid data' do
    it 'creates the application and redirects to application show page with added content' do
      visit '/applications/new'
      
      fill_in('name', with: 'Bob Vance')
      fill_in('street_address', with: '123 Dunder Ave.')
      fill_in('city', with: 'Scranton')
      fill_in('state', with: 'PA')
      fill_in('zip_code', with: '18508')
      click_button 'Submit'
      new_application = Application.last
      expect(current_path).to eq("/applications/#{new_application.id}")
      expect(page).to have_content('Bob Vance')
    end
  end 
  
  context 'given invalid data' do
    it 're-renders new form with flash message for required fields' do
      visit '/applications/new'

      click_button "Submit"
      expect(page).to have_content("Error: Please complete all fields")
      expect(current_path).to eq("/applications/new")
    end
  end
end 