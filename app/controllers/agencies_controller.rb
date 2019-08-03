class AgenciesController < ApplicationController
  before_action :load_category
  before_action :agency_params, only: %i[create update]
  before_action :load_agency, only: %i[edit update]

  def new
    @agency = Agency.new
    @categories_checked = @agency.agency_categories.to_a.pluck(:category_id)
    @list_agency_categories = @agency.list_agency_categories
  end

  def create
    @agency = Agency.new agency_params
    if @agency.save
      redirect_to action: :edit, id: @agency.id
    else
      @categories_checked = @agency.agency_categories.to_a.pluck(:category_id)
      @list_agency_categories = @agency.list_agency_categories
      render :new
    end
  end

  def edit
    @list_agency_categories = @agency.list_agency_categories
  end

  def update
    @agency.assign_attributes agency_params
    @agency.save
    redirect_to action: :edit
  end

  private

  def agency_params
    params.require(:agency).permit(Agency::ATTRS)
  end

  def load_agency
    @agency = Agency.find(params[:id])
  end

  def load_category
    @categories = Category.all
  end
end