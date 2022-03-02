class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :instruments

  enum role: [:user, :admin] 

  after_initialize :set_defalt_role, if :new_record?

  def set_defalt_role
    self.role ||  :user
  end
  end   

  # def to_s
  #   email
  # end

  # after_create do
  #   customer = Stripe::Customer.create(email: email)
  #   update(stripe_customer_id: customer.id)
  # end

  # def username
  #   return email.split('@')[0].capitalize
  # end
  
end
