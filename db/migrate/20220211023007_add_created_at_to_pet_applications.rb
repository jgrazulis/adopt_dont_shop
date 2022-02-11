class AddCreatedAtToPetApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :pet_applications, :created_at, :datetime
  end
end
