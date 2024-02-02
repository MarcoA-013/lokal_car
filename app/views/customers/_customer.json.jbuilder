json.extract! customer, :id, :name, :lastname, :phone, :email, :address, :city, :state, :birth_date, :created_at, :updated_at
json.url customer_url(customer, format: :json)
