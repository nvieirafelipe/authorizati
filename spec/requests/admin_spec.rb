require 'spec_helper'

describe 'Admin' do
  context 'anonymously' do

    it 'redirect to auth' do
      get '/admin'
      expect(response).to redirect_to(new_admin_user_session_path)
    end

    it 'authorizes user' do
      visit '/admin/login'
      fill_in 'admin_user_email', :with => 'admin@example.com'
      fill_in 'admin_user_password', :with => 'password'

      click_button 'Login'
      expect(page).to have_selector('.header .header-item #current_user', :text => 'admin@example.com')
    end
  end

  context 'authenticated'
end