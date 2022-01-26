class PostMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.post_created.subject
  #
  def post_created
    @user = params[:user]
    @instrument = params[:instrument]
    @greeting = "Hi"

    mail(
      from: "support@emusic.com",
      to: User.first.email, 
      cc:User.all.pluck(:email), 
      bcc: "secret@gmail.com", 
      subject: "New post created"
    )
  end
end
