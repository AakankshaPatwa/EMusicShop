json.extract! checkout, :id, :firstname, :lastname, :email, :contact, :address1, :address2, :city, :state, :pincode, :created_at, :updated_at
json.url checkout_url(checkout, format: :json)
