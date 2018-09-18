require "rails_helper"

RSpec.describe QuizMarkdown::Quiz do
  let(:quiz_markdown) { QuizMarkdown::Parser.new('./spec/examples/quiz_test.md') }

  describe '#quiz_json' do
    it 'returns the quiz json' do
      expect(quiz_markdown.quiz_json.to_hash).to eq(
        { :title=>"Quiz Title",
          :description=>"This is the description",
          :questions=>[{
            :id=>nil,
            :body=>"First question",
            :options=>
             [{:body=>"Option11", :id=>nil},
              {:body=>"Option12", :id=>nil},
              {:body=>"Option13", :id=>nil}]},
            {:id=>nil,
            :body=>"Second question",
            :options=>
             [{:body=>"Option21", :id=>nil},
              {:body=>"Option22", :id=>nil},
              {:body=>"Option23", :id=>nil}]},
            {:id=>nil,
             :body=>"Third question",
             :options=>
              [{:body=>"Option31", :id=>nil},
               {:body=>"Option32", :id=>nil},
               {:body=>"Option33", :id=>nil}]}],
       :correct_responses=>{ 1=>1, 2=>3, 3=>1 }
      })
    end
  end
end
