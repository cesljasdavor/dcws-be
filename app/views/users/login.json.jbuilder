json.user do
  json.id @user.id
  json.email @user.email
  if @user.email_admin.nil?
    json.email_admin nil
  else
    json.email_admin @user.email_admin
  end
  json.password @user.password
  json.name @user.name
  json.surname @user.surname
  json.telephone_number @user.telephone_number
  json.address @user.address
  json.city City.find(@user.city_id)
  json.privilege @user.privilege
  json.date_of_birth @user.date_of_birth
end