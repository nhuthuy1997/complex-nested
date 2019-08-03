class Agency < ApplicationRecord
  ATTRS = [:name, agency_categories_attributes: AgencyCategory::ATTRS]

  has_many :agency_categories, dependent: :destroy
  has_many :categories, through: :agency_categories

  accepts_nested_attributes_for :agency_categories, allow_destroy: true

  validates :name, presence: true

  def list_agency_categories
    list_agency_categories = agency_categories.order(:category_id).to_a
    Category.all.map do |category|
      list_agency_categories.first&.category_id == category.id ?
        list_agency_categories.shift : agency_categories.new(category: category)
    end
  end
end
