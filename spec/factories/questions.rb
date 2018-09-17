FactoryBot.define do
  factory :question do
    body { 'Question' }
  end

  trait :with_option do
    after(:create) do |instance|
      create_list :option, 2, question_id: instance.id
    end
  end
end
