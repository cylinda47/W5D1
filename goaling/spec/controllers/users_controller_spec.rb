require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #new' do
    it 'should render a new user template' do
      get :new, params: {}
      expect(response).to render_template('new')
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'should redirect to users index page' do
        post :create, params: { user: { username: 'James', password: 'password' } }
        expect(response).to redirect_to(users_url)
      end
    end

    context 'with invalid params' do
      it 'should show errors' do
        post :create, params: { user: { username: 'Alvin', password: '' } }
        expect(flash[:errors]).to be_present
      end

      it 'should render the new user template' do
        post :create, params: { user: { username: 'Alvin', password: '' } }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'GET #index' do
    it 'should render the user index template' do
      get :index, params: {}
      expect(response).to render_template('index')
      expect(response).to have_http_status(200)
    end
  end

end

# RSPEC RAILS API

# Navigation
#   get
#   post
#   patch
#   delete

# Assertions
#   render_template
#   redirect_to
#   have_http_status, be_success

#user #goal #comment
