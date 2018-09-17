require "rails_helper"

RSpec.describe QuizJson do
  describe '#load_from' do
    subject { described_class.new }
    let(:quiz) { FactoryBot.create(:quiz, :with_question_and_option) }

    describe '#load_from' do
      it 'returns the correct quiz' do
        subject.load_from(quiz)

        expect(subject.to_hash).to eq({
          :title=>"Quiz",
          :description=>"Description",
          :questions=> [{
            :id=>1, :body=>"Question", :options=>[
                {:body=>"Option 1", :id=>1},
                {:body=>"Option 2", :id=>2}
              ]
            }],
          :correct_responses=> [{ 1 => false }, { 2 => false }]
        })
      end
    end
  end
end
