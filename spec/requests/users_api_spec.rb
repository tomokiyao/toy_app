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

    describe 'session#destroy' do
      context '' do
        before do
          @user = User.create(params)
        end
        it '' do
          get login_path
          post login_path, params: {session: {email: @user.email, password: 'password'}}

          expect(response).to have_http_status(302)
          redirect_to(@user)

          expect(response).to have_http_status(302)

          delete logout_path
          expect(response).to redirect_to(root_path)

          delete logout_path
        end
      end
    end

    describe 'Remember me' do
      context 'login with remembering' do
        before do
          @user = User.create(params)
        end
        it 'remembers cookies' do
          post login_path, params:{session: { email: @user.email, password: 'password', remember_me: '1' }}

          expect(response.cookies['remember_token']).to_not eq nil
        end

        it 'not remember cookies' do
          post login_path, params:{session: { email: @user.email, password: 'password', remember_me: '1' }}

          delete logout_path

          post login_path, params:{session: { email: @user.email, password: 'password', remember_me: '0' }}

          expect(response.cookies['remember_token']).to eq nil
        end
      end
    end

end