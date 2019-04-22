require 'rails_helper'

RSpec.describe 'Users', type: :request do

    let(:params){
      { name: 'testuser1',
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password'
      }
    }

    before do
      get signup_path
    end

    describe 'users#<create>' do
      it 'post data cacth' do
        post signup_path, params: {user: params}

        expect(response).to have_http_status(302)
      end
    end
end