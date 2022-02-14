class Order < ApplicationRecord
    belongs_to :user
	has_many :line_items, dependent: :destroy

    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :email, presence: true
    validates :address1, presence: true
	validates :pincode, presence: true
	
	has_many :instruments
end
