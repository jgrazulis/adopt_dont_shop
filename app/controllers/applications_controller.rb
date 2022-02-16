class ApplicationsController < ApplicationController

  def index
  end

  def show
    @application = Application.find(params[:id])
    if params[:query].present?
      @found_pets = Pet.search(params[:query])
    else
      @found_pets = []
    end
  end

  def new
  end

  def create
    @application = Application.new(
      name: params[:name],
      street_address: params[:street_address],
      city: params[:city],
      state: params[:state],
      zip_code: params[:zip_code],
      description: params[:description],
      status: params[:status]
    )
    if @application.save
      redirect_to "/applications/#{@application.id}"
    else 
      redirect_to "/applications/new"
      flash[:alert] = "Error: Please complete all fields"
    end
  end 

  def update
    @application = Application.find(params[:id])
    @new_pet = Pet.find(params[:search])
    @pet_application = PetApplication.create!(pet: @new_pet, application: @application)
    redirect_to "/applications/#{@application.id}"
  end
end