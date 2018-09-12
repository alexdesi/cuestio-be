require 'minitest/autorun'
# require './app/lib/quiz_markdown/parser.rb'

class AbcTest < MiniTest::Unit::TestCase
  def setup
    @quiz_markdown = QuizMarkdown::Quiz.new
  end

  def test_load_from
    quiz = Quiz.create(title: 'abc')
    Question.create(quiz_id: quiz.id, body: 'First question')
    
    @quiz_markdown.load_from(quiz)

    assert_equal 'abc', @quiz_markdown.title
    assert_equal [
        { id: quiz.id, body: "First question", options: [] }
      ],
      @quiz_markdown.questions
  end
end
