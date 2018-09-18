require "rails_helper"

RSpec.describe QuizJson do
  describe '#load_from' do
    subject { described_class.new(quiz) }
    let(:quiz) { FactoryBot.create(:quiz, :with_question_and_option) }

    describe '#load' do
      it 'returns the correct quiz' do
        first_question = quiz.questions[0]
        options = first_question.options
        options.second.update_attributes(is_correct: true)

        subject.load

        expect(subject.to_hash).to eq({
          :title=>"Quiz",
          :description=>"Description",
          :questions=> [{
            :id=> first_question.id, :body=>"Question", :options=>[
                {:body=>"Option 1", :id=> options[0].id },
                {:body=>"Option 2", :id=> options[1].id }
              ]
            }],
          :correct_responses => { first_question.id =>  options.second.id }
        })
      end
    end
  end
end
