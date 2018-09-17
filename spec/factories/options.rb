FactoryBot.define do
  factory :option do
    sequence(:body) { |n| "Option #{n}" }
    is_correct { false }
  end
end
