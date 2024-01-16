require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success and renders the index template' do
      user = create(:user)
      get user_posts_path(user)
      expect(response).to have_http_status(:success) # If response status was correct.
      expect(response).to render_template(:index) # If the correct template was rendered.
      expect(response.body).to include('List of Posts') # If the correct content was rendered.
    end
  end
end
