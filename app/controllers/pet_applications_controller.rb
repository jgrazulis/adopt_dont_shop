class PetApplicationsController < ApplicationController

  def create
    @application = Application.find(params[:id])
    @pet_application = PetApplication.new(pet_application_params)
    @pet_application.save
    
    redirect_to "/applications/#{@application.id}"
  end 

  private

  def pet_application_params
    params.permit(:pet, :application, :status)
  end
end