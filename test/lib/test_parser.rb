require 'minitest/autorun'

require './app/lib/quiz_markdown/parser.rb'

class TestQuizMarkdown < MiniTest::Unit::TestCase
  def setup
    @quiz_markdown = QuizMarkdown::Parser.new('./test/lib/quiz_test.md')
  end

  def test_that_title_is_correct
    assert_equal 'Quiz Title', @quiz_markdown.quiz.title
  end

  def test_that_description_is_correct
    assert_equal 'This is the description', @quiz_markdown.quiz.description
  end

  def test_that_responses_are_correct
    assert_equal ({
                    1 => 1,
                    2 => 3,
                    3 => 1
                  }), @quiz_markdown.quiz.correct_responses
  end

  def test_that_ol_is_correct
    assert_equal [
      {
        :id=>"1", :body=>"First question", 
        :responses=>["Option1", "Option2", "Option3"]
      },{
        :id=>"2", :body=>"Second question",
        :responses=>["Option1", "Option2", "Option3"]},
      {
        :id=>"3", :body=>"Third question",
        :responses=>["Option1", "Option2", "Option3"]
      }],
    @quiz_markdown.quiz.questions
  end
end
