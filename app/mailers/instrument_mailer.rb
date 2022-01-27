class InstrumentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.instrument_mailer.instrument_created.subject
  #
  def instrument_created
    @user = params[:user]
    @instrument = params[:instrument]
    @greeting = "Hi"
    attachments['ruby2.png'] = File.read('app/assets/images/ruby2.png')

    mail( 
    from: "Emusic <support@emusic.com>",
    to: User.first.email, 
    cc:User.all.pluck(:email), 
    subject: "New Instrument Created"
    )
  end
end
