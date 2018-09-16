require "rails_helper"

RSpec.describe QuizMarkdown::QuizJson do

  

  describe '#load_from' do
  	let(:quiz) { FactoryBot.create :quiz }

  	it 'return the correct quiz' do 
      expect(quiz).to eq('aaa')
  	end
  end
  
end
