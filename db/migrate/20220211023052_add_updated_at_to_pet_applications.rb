class AddUpdatedAtToPetApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :pet_applications, :updated_at, :datetime
  end
end
