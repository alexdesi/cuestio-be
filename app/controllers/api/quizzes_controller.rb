class Api::QuizzesController < ApplicationController
  def show
    quiz = Quiz.find_by(id: params[:id].to_i)
    quiz_json = QuizJson.new(quiz).load.to_hash

    render json: quiz_json
  end

  def index
    quizzes = Quiz.all

    render json: quizzes
  end

  def import
  	url = params[:url]
    
    quiz_text = get_quiz_page(url)

    # quiz_text = mock_quiz

    parser = QuizMarkdown::Parser.new(text: quiz_text)

    # if parser.errors.empty?
      # QuizMarkdown::import_quiz(quiz_json)

    puts parser.inspect

    render json: {
                   quiz: parser.quiz_json,
                   errors: parser.errors
                 }
  end

  private

  def get_quiz_page(url)
  	uri = URI(url)
  	result = Net::HTTP.get(uri)

    result
  end

  def mock_quiz
<<TEXT
##Questions

1. First question
  - Option11
  - Option12
  - Option13

2. Second question
 - Option21
 - Option22
 - Option23

3. Third question
 - Option31
 - Option32
 - Option33

##Responses
1:1, 2:3, 3:1

##Resources (not yet used)
TEXT
  end
end
