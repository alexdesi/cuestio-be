class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz_prop = {
      questions: [{
          id: 10,
          body: 'Who invented the language Ruby?',
          responses: [[1, 'Matzumoto'], [2, 'DHH'], [3, 'Linus']],
        },
        {
          id: 11,
          body: 'What is the superclass of Object?',
          responses: [[1, 'nil'], [2, 'BasicObject'], [3, 'Integer']],
        },
        {
          id: 12,
          body: 'What\'s the result of [1,2,3].map{|n| n * 2} ?',
          responses: [[1, '[]'], [2, '[1,4,9'], [3, '[2,4,6]']],
          last: true
        }],
      correct_responses: { '1':1, '2':2, '3':3 }
    }

 # {:title=>"Quiz Title",
 # :description=>nil,
 # :questions=>
 #  [{:id=>1, :body=>"First question", :responses=>[[0, "Option1"], [1, "Option2"], [2, "Option3"]]},
 #   {:id=>2, :body=>"Second question", :responses=>[[0, "Option1"], [1, "Option2"], [2, "Option3"]]},
 #   {:id=>3, :body=>"Third question", :responses=>[[0, "Option1"], [1, "Option2"], [2, "Option3"]]}],
 # :responses=>nil}

    # quiz_id = params[:id].to_i
    # quiz = Quiz.find quiz_id

    # qmd = QuizMarkdown::Quiz.new
    # qmd.title = quiz.title
    # quiz.questions.each do |question, id|
    #   qmd.add_question id: question.id, body: question.body
      
    #   question.options.each_with_index do |response, id|
    #     qmd.add_response([id , response.body])
    #   end
    # end

    
    # @quiz_prop = qmd.to_hash[:questions]

  end
end
