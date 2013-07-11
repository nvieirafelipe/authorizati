def authenticate(user)
  visit '/admin'

  fill_in 'admin_user_email', :with => user.email
  fill_in 'admin_user_password', :with => user.password

  click_button 'Login'
end