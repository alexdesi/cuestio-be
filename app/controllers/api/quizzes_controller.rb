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
    result = get_quiz_page(url)

    render json: { result: result }
  end

  private

  def get_quiz_page(url)
  	uri = URI(url)
  	result = Net::HTTP.get(uri)

    result
  end
end
