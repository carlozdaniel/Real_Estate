class Api::V1::EstatesController < ApplicationController
  before_action :set_estate, only: [:show, :update, :destroy]
  before_action :bathrooms_conditional, only: [:create, :update]

  # GET /estates
  def index
    @estates = Estate.all

    render json: @estates
  end

  # GET /estates/1
  def show
    if @estate.nil?
      render json: { error: 'Estate not found' }, status: :not_found
    else
      render json: @estate
    end
  end

  # POST /estates
  def create
    @estate = Estate.new(estate_params)

    if @estate.save
      render json: @estate, status: :created
    else
      render json: @estate.errors, status: :unprocessable_entity
    end
  end

  def bathrooms_conditional
    if estate_params[:bathrooms] == '0' && estate_params[:type] != 'land' || estate_params[:bathrooms] == '0' && estate_params[:type] == 'commercial_ground'
      render json: {error: 'Can be zero only if land or commercial ground.'}, status: :bad_request
    end
  end

  # PATCH/PUT /estates/1
  def update
    if @estate.nil?
      render json: { error: 'Estate not found' }, status: :not_found
    elsif @estate.update(estate_params)
      render json: @estate
    else
      render json: @estate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /estates/1
  def destroy
    if @estate.nil?
      render json: { error: 'Estate not found' }, status: :not_found
    else
      @estate.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estate
      @estate = Estate.find_by_id(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def estate_params
      params.require(:estate).permit(:name, :type, :street, :external_number, :Internal_number, :neighborhood, :city, :country, :rooms, :bathrooms, :comments)
    end
end
