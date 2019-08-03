class Category < ApplicationRecord
  ATTRS = [:id, :name, :_destroy, agency_categories_attributes: AgencyCategory::ATTRS]

  has_many :agency_categories

  accepts_nested_attributes_for :agency_categories
end
