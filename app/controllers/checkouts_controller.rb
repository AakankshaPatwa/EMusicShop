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
    if @checkout.save
      redirect_to @checkout, notice: "Your Order was successfully created"    
    else
      render :new, status: :unprocessable_entity 
    end
  end
  
  def update
    if @checkout.update(checkout_params)
      redirect_to @checkout, notice: "Your Order was successfully updated." 
    else
      render :edit, status: :unprocessable_entity      
    end
  end

  def destroy
    @checkout.destroy
    redirect_to checkouts_path, notice: "Your Order was successfully destroyed." 
  end

  private  
  def set_checkout
    @checkout = Checkout.find(params[:id])
  end

  def checkout_params
    params.require(:checkout).permit(:firstname, :lastname, :email, :contact, :address1, :address2, :city, :state, :pincode)
  end
end
