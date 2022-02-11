class InstrumentsController < ApplicationController
  before_action :set_instrument, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @instruments = Instrument.all.order("created_at desc")
  end

  def show
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

    respond_to do |format|
      if @instrument.save
        InstrumentMailer.with(user: current_user, instrument: @instrument).instrument_created.deliver_later

        format.html { redirect_to instrument_url(@instrument), notice: "Instrument was successfully created." }
        format.json { render :show, status: :created, location: @instrument }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @instrument.errors, status: :unprocessable_entity }
      end
    end

    # rescue Stripe::CardError => e
    #   flash.alert = e.message
    #   render action: :new   
  end

  def update
    respond_to do |format|
      if @instrument.update(instrument_params)
        format.html { redirect_to instrument_url(@instrument), notice: "Instrument was successfully updated." }
        format.json { render :show, status: :ok, location: @instrument }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @instrument.destroy

    respond_to do |format|
      format.html { redirect_to instruments_url, notice: "Instrument was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instrument
      @instrument = Instrument.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def instrument_params
      params.require(:instrument).permit(:brand, :model, :description, :condition, :finish, :title, :price, :image)
    end
end
