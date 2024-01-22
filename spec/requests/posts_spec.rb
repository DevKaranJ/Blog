# spec/requests/posts_spec.rb

require 'rails_helper'

RSpec.describe PostsController, type: :request do
  let(:user) { create(:user, name: 'John Doe') }
  let(:post) { create(:post, author: user, title: 'Test Post') }

  describe 'GET #index' do
    before { get "/users/#{user.id}/posts" }

    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('user', 'John Doe') # Adjust to match the actual content
    end
  end

  describe 'GET #show' do
    before { get "/users/#{user.id}/posts/#{post.id}" }

    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('Like post') # Adjust to match a relevant indicator
    end
  end
end
