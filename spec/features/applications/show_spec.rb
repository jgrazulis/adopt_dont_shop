require 'rails_helper'

RSpec.describe 'application show page' do

  before(:each) do
    @scranton = Shelter.create!(name: "Scranton Animal Shelter", city: "Scranton, PA", foster_program: false, rank: 9)

    @bob = Application.create!(name: "Bob Vance", street_address: "1234 Dunder Ave", city: "Scranton", state: "PA", zip_code: "18508" , description: "Phyllis and I love dogs, want one", status: 0)
    
    @mia = @bob.pets.create!(name: "Mia", age: 4, breed: "American Bulldog", adoptable: true, shelter_id: @scranton.id)
    @leo = Pet.create!(name: "Leo", age: 2, breed: "Tabby", adoptable: true, shelter_id: @scranton.id)

    visit "/applications/#{@bob.id}"
  end

  scenario 'visitor sees applicant info' do
    expect(page).to have_content(@bob.name)
    expect(page).to have_content(@bob.street_address)
    expect(page).to have_content(@bob.city)
    expect(page).to have_content(@bob.state)
    expect(page).to have_content(@bob.zip_code)
    expect(page).to have_content(@bob.description)
  end

  scenario 'visitor sees pets applicant has applied for' do
    expect(page).to have_link(@mia.name)
    expect(page).to_not have_content(@leo.name)
    click_link(@mia.name)
    expect(current_path).to eq("/pets/#{@mia.id}")
  end

  scenario 'visitor sees application status' do
    expect(page).to have_content(@bob.status)
  end

  scenario 'visitor can search pet name and will get matching results' do

    fill_in('query', with: 'Mia')
    click_button('Search')

    expect(page).to have_content(@mia.name)
    expect(page).to_not have_content(@leo.name)
  end

  scenario 'visitor can search part of pet name and will get results' do
    fill_in('query', with: 'Mi')
    click_button('Search')

    expect(page).to have_content(@mia.name)
    expect(page).to_not have_content(@leo.name)
  end

  scenario 'visitor can search part of pet name and will get results' do
    fill_in('query', with: 'MIA')
    click_button('Search')

    expect(page).to have_content(@mia.name)
    expect(page).to_not have_content(@leo.name)
  end
end