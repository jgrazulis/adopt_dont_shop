class AdminController < ApplicationController
  def index
    @shelters = Shelter.find_by_sql("SELECT * FROM shelters ORDER BY name desc")
    @pending_shelters = Shelter.shelters_with_pending_apps
  end
end