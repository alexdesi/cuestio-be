require 'minitest/autorun'

require './app/lib/quiz_markdown/parser.rb'

class ParserTest < MiniTest::Unit::TestCase
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
  expected_questions = [{
                          :id=>nil, :body=>"First question",
                          :options=>[
                            {:body=>"Option1", :id=>nil},
                            {:body=>"Option2", :id=>nil},
                            {:body=>"Option3", :id=>nil}
                            ]
                        }, {
                          :id=>nil, :body=>"Second question",
                          :options=>[
                            {:body=>"Option1", :id=>nil},
                            {:body=>"Option2", :id=>nil},
                            {:body=>"Option3", :id=>nil}
                            ]
                        }, {
                          :id=>nil, :body=>"Third question",
                          :options=>[
                            {:body=>"Option1", :id=>nil},
                            {:body=>"Option2", :id=>nil},
                            {:body=>"Option3", :id=>nil}
                            ]
                        }]

    assert_equal expected_questions, @quiz_markdown.quiz.questions
  end
end
