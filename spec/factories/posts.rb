# spec/factories/posts.rb
FactoryBot.define do
  factory :post do
    association :user, factory: :user
    # Your post attributes here
  end
end
