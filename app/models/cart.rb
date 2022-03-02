class Cart < ApplicationRecord
	has_many :line_items, dependent: :destroy

	def add_instrument(instrument)
    current_item = line_items.find_by(instrument_id: instrument.id)

    if current_item
      current_item.increment(:quantity)
    else
      current_item = line_items.build(instrument_id: instrument.id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

    def paypal_url(return_url)
      values = {
        :business => 'sb-jnftp14141474@business.example.com',
        :cmd => '_cart',
        :upload => 1,
        :return => return_url,
        :invoice => id
      }
      line_items.each_with_index do |instrument, index|
        values.merge!({
          "amount_#{index+1}" => instrument.total_price,
          "item_name_#{index+1}" => instrument.total_price,
          "item_number_#{index+1}" => instrument.id,
          "quantity_#{index+1}" => instrument.quantity
        })
      end
      "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
    end
end
