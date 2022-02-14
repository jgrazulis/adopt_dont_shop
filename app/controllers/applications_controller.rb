class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end

  def new
  end

  # def create
  #   Application.create(
  #     name: params[:name],
  #     street_address: params[:street_address],
  #     city: params[:city]
  #     state: params[:state]
  #     zip_code: params[:zip_code]
  #   )
  #   redirect_to '/applcations/:id'
  # end
end