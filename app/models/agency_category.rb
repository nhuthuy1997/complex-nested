class AgencyCategory < ApplicationRecord
  ATTRS = [:id, :agency_id, :category_id, :other, :_destroy]

  belongs_to :agency
  belongs_to :category

  validates :agency_id, uniqueness: { scope: :category_id }
  validates :other, presence: true, if: -> { key_name == "other" }
  validates :other, length: { maximum: 0 }, if: -> { key_name != "other" }

  delegate :key_name, to: :category
end
