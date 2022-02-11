json.extract! order, :id, :firstname, :lastname, :email, :contact, :address1, :address2, :city, :state, :pincode, :created_at, :updated_at
json.url order_url(order, format: :json)
