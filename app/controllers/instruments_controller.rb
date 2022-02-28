class InstrumentsController < ApplicationController
  before_action :set_instrument, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @instruments = Instrument.all.order("created_at desc")
  end

  def show
  end

  # def search
  #   if params[:search].blank?
  #     redirect_to(instruments_path, alert: "Empty field!") and return
  #   else
  #    keyword = params[:search]
  #    @instruments = Instrument.where("lower(title) LIKE ?", "%#{keyword}%")
  #   end
  # end
  def search
    @instruments = Instrument.where("lower(title) LIKE ?", "#{params[:search]}%" )
  end

  def new
    @instrument = current_user.instruments.build
  end

  def edit
    @instrument = current_user.instruments.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to intruments_path, notice: "You cannot edit this instrument."
  end

  def create
    @instrument = current_user.instruments.build(instrument_params)

    # token = params[:stripeToken]
    # instrument_brand = params[:brand]
    # instrument_title = params[:title]
    # #error
    # card_brand = params[:user][:card_brand]
    # card_exp_month = params[:user][:card_exp_month]
    # card_exp_year = params[:user][:card_exp_year]
    # card_last4 = params[:user][:card_last4]

    # charge = Stripe::Charge.create(
    #   :amount => 30000,
    #   :currency => "inr",
    #   :description => instrument_brand,
    #   :statement_descriptor => instrument_title,
    #   :source => token
    # )
    # current_user.stripe_id = charge.id
    # current_user.card_brand = card_brand
    # current_user.card_exp_month = card_exp_month
    # current_user.card_exp_year = card_exp_year
    # current_user.card_last4 = card_last4
    # current_user.save!

    if @instrument.save
      InstrumentMailer.with(user: current_user, instrument: @instrument).instrument_created.deliver_later
      redirect_to @instrument, notice: "Instrument was created successfully." 
    else
      render 'new'
    end

  # rescue Stripe::CardError => e
  #   flash.alert = e.message
  #   render action: :new  
  end

  def update
    if @instrument.update(instrument_params)
      redirect_to @instrument, notice: "Instrument was updated successfully." 
    else
      render 'edit'
    end
  end
  
  def destroy
    @instrument.destroy
    redirect_to instruments_path, notice: "Instrument was destroy successfully."   
  end

  private
  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  def instrument_params
    params.require(:instrument).permit(:brand, :model, :description, :condition, :finish, :title, :price, :image)
  end
end

