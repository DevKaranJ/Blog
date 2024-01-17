FactoryBot.define do
  factory :post do
    association :author, factory: :user
    title { 'Default Post Title' }
    comments_counter { 0 }
    likes_counter { 0 }
  end
end
