class CheckoutsController < ApplicationController
  before_action :set_checkout, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  
  def index
    @checkouts = Checkout.all
  end

  def show
  end

  
  def new
    @checkout = Checkout.new
  end

  def edit
  end

  
  def create
    @checkout = Checkout.new(checkout_params)

    respond_to do |format|
      if @checkout.save
        format.html { redirect_to checkout_url(@checkout), notice: "Your Order was successfully created" }
        format.json { render :show, status: :created, location: @checkout }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @checkout.update(checkout_params)
        format.html { redirect_to checkout_url(@checkout), notice: "Your Order was successfully updated." }
        format.json { render :show, status: :ok, location: @checkout }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @checkout.destroy

    respond_to do |format|
      format.html { redirect_to checkouts_url, notice: "Your Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
   
    def set_checkout
      @checkout = Checkout.find(params[:id])
    end

    def checkout_params
      params.require(:checkout).permit(:firstname, :lastname, :email, :contact, :address1, :address2, :city, :state, :pincode)
    end
end
