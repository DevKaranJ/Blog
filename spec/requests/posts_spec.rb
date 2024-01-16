require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      # Assuming you have a user and some posts associated with that user
      user = create(:user)
      get user_posts_path(user)
      expect(response).to have_http_status(:success)
    end
  end
end
