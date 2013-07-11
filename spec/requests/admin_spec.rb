require 'spec_helper'
require 'authentication_helper'

describe 'Admin' do
  context 'anonymously' do

    after do
      AdminUser.destroy_all
    end

    it 'redirect to auth' do
      get '/admin'
      expect(response).to redirect_to(new_admin_user_session_path)
    end

    context 'user without role' do
      let (:user) { AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password') }
      it 'authorizes user' do
        authenticate(user)
        expect(page).to have_selector('.header .header-item', :text => user.email)
      end

      it 'hides Admin Users page' do
        authenticate(user)
        expect(page).to_not have_selector('.header .header-item #admin_users a', :text => 'Admin Users')
      end
    end

    context 'user with admin role' do
      it 'show Admin Users page' do
        user = AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password', :role => 'admin')
        authenticate(user)
        expect(page).to have_selector('.header .header-item #admin_users a', :text => 'Admin Users')
      end
    end
  end

  context 'authenticated'
end