FactoryBot.define do
  factory :quiz do
    title { 'Quiz' }
    description { 'Description' }
  end

  trait :with_question do
    after(:create) do |instance|
      create :question, quiz_id: instance.id, body: 'Question'
    end
  end

  trait :with_question_and_option do
    after(:create) do |instance|
      create :question, :with_option, body: 'Question', quiz_id: instance.id
    end
  end
end
