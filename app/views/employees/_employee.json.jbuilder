json.extract! employee, :id, :name, :departementID, :created_at, :updated_at
json.url employee_url(employee, format: :json)
