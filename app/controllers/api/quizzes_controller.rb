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
end
