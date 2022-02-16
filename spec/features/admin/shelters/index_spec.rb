require 'rails_helper'

RSpec.describe 'admin shelters index' do
   
  before(:each) do
    @scranton = Shelter.create!(name: "Scranton Animal Shelter", city: "Scranton, PA", foster_program: false, rank: 9)
    @denver = Shelter.create!(name: "Denver Animal Shelter", city: "Denver, CO", foster_program: false, rank: 9)
    @aurora = Shelter.create!(name: "Aurora Animal Shelter", city: "Aurora, IL", foster_program: true, rank: 9)

    @mia = @denver.pets.create!(name: "Mia", age: 4, breed: "American Bulldog", adoptable: true, shelter_id: @denver.id)
    @leo = @scranton.pets.create!(name: "Leo", age: 2, breed: "Tabby", adoptable: true, shelter_id: @scranton.id)
    @maggie = @aurora.pets.create!(name: "Margaret Thatcher", age: 5, breed: "Golden Retriever", adoptable: true, shelter_id: @aurora.id)

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
end 