FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    posts_counter { 3 }
  end
end
