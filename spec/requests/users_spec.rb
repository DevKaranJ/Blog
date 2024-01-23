require 'rails_helper'

RSpec.describe UsersController, type: :request do
  let(:user) { create(:user, name: 'John Doe') }

  describe 'GET #index' do
    it 'returns a successful response and renders the index template' do
      get '/'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response and renders the show template' do
      get "/users/#{user.id}"
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.body).to match('Bio')
    end
  end
end
