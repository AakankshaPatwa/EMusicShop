class Instrument < ApplicationRecord
	has_one_attached :image
	has_many :line_items
	belongs_to :user
	
	serialize :image, JSON
	
	before_destroy :not_referenced_by_any_line_item

	validates :title, :brand, :price, :model, presence: true
	validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed "}
	validates :title, length: {maximum: 140, too_long: "%{count} characters is the maximum allowed"}
	validates :price, numericality: {only_integer: true}, length: {maximum: 7}

  BRAND = %w{ Fender Gibson Epiphone ESP Martin Dean Taylor Jackson PRS  Ibanez Charvel Washburn }
  FINISH = %w{ Black White Navy Blue Red Clear Satin Yellow Seafoam }
  CONDITION = %w{ New Excellent Mint Used Fair Poor }

  # def to_s
  # 	title
  # end

  private

  def not_referenced_by_any_line_item
  	unless line_items.empty?
  		errors.add(:base, "Line items present")
  		throw :abort
  	end
  end
end
