require 'rails_helper'

RSpec.describe PostsController, type: :request do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }

  describe 'GET #index' do
    before { get "/users/#{user.id}/posts" }

    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
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
  end
end
