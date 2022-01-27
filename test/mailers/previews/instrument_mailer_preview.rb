# Preview all emails at http://localhost:3000/rails/mailers/instrument_mailer
class InstrumentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/instrument_mailer/instrument_created
  def instrument_created
    InstrumentMailer.with(user: User.first, instrument: Instrument.first).instrument_created
  end

end
