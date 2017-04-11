json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :password, :student_number, :access
  json.url user_url(user, format: :json)
end
