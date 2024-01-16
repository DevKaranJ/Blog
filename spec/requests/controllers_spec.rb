# spec/requests/controllers_spec.rb
require 'rails_helper'

RSpec.describe 'Controllers', type: :request do
  describe 'PostsController' do
    describe 'GET index' do
      it 'renders the index template' do
        # Assuming you have a user with id 1 in your database
        get user_posts_path(1)
        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:index)
        expect(response.body).to include('List of Posts')
      end
    end
  end
end
