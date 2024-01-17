require 'rails_helper'

RSpec.describe PostsController, type: :request do
  let(:user_id) { ':user_id' }
  let(:post) { create(:post) }

  describe 'GET #index' do
    before { get "/users/#{user_id}/posts" }

    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('List of Posts')
    end
  end

  describe 'GET #show' do
    before { get "/users/#{user_id}/posts/#{post.id}" }

    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include("Posts#show", "Test Post")
    end
  end
end
