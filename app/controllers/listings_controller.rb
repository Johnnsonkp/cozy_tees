class ListingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_listing, only: %i[ show edit update destroy ]
  before_action :set_user_listing, only: [:update, :edit, :destroy]
  before_action :set_form_variables, only: [:new, :edit]
  before_action :validate_presence, only: [:create]

  # GET /listings or /listings.json
  def index
    # @listings = Listing.all
    @categories = Category.all

    @q = Listing.all.ransack(params[:q])
    @listings = @q.result

  end

  def search
    if params[:q].blank?
      redirect_to(root_path, alert: "Empty field") and return
    else
      @listings = Listing.where('title ILIKE ?', '%' + params[:q] + '%')
    end
  end

  # GET /listings/1 or /listings/1.json
  def show
    # pp stripe_session
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings or /listings.json
  def create
    @listing = current_user.listings.new(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    

    def set_user_listing
      @listing = current_user.listings.find_by_id(params[:id])
      if @listing == nil
        flash[:alert] = "You don't have permission to do that!"
        redirect_to listings_path
      end
    end

    def set_form_variables
      @categories = Category.all
      @conditions = Listing.conditions.keys
      @sizes = Listing.sizes.keys
      @sex = Listing.sexes.keys
      @features = Feature.all
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end


    def check_presence
      params[:listing][:title].present? && params[:listing][:price].present? && params[:listing][:picture].present?
    end
    
    def validate_presence
      if !check_presence
        # render json: { error: {
        #     message: "Bad Request, parameters missing.",
        #     status: 500 }
        # }
        flash[:alert] = "Bad Request, parameters missing."
        redirect_to new_listing_path
      end
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:title, :picture, :price, :sex, :color, :brand, :description, :category_id, :condition, :size, feature_ids: [])
    end
end
