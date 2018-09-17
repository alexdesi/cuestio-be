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
             [{:body=>"Option1", :id=>nil},
              {:body=>"Option2", :id=>nil},
              {:body=>"Option3", :id=>nil}]},
            {:id=>nil,
            :body=>"Second question",
            :options=>
             [{:body=>"Option1", :id=>nil},
              {:body=>"Option2", :id=>nil},
              {:body=>"Option3", :id=>nil}]},
            {:id=>nil,
             :body=>"Third question",
             :options=>
              [{:body=>"Option1", :id=>nil},
               {:body=>"Option2", :id=>nil},
               {:body=>"Option3", :id=>nil}]}],
       :correct_responses=>{ 1=>1, 2=>3, 3=>1 }
      })
    end
  end
end
