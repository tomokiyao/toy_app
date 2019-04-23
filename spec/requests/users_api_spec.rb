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

    it 'session/new access' do
      get login_path
      expect(response).to have_http_status(:success)
    end

    describe 'session#new' do
      context 'login false' do
        it 'is cacth flash message' do
          get login_path
          expect(response).to have_http_status(:success)

          post login_path, params: {session: {email: '', password: ''}}
          expect(response).to have_http_status(:success)

          expect(flash[:danger]).to be_truthy

          get root_path
          expect(flash[:danger]).to be_falsey
        end
      end
    end

end