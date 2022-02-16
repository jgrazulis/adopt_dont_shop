class PetApplication < ApplicationRecord
  enum status: [:pending, :rejected, :accepted]
  belongs_to :pet
  belongs_to :application
end