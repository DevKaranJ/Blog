# spec/requests/users_spec.rb

require 'rails_helper'

RSpec.describe UsersController, type: :request do
  let(:user) { create(:user, name: 'John Doe') }

  describe 'GET #show' do
    it 'returns a successful response and renders the show template' do
      get "/users/#{user.id}"
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.body).to include('Bio') # Check for the term "Bio" or any other relevant content
    end
  end
end
