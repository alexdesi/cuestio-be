class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz_prop = {
      questions: [{
          id: 1,
          body: 'Who invented the language Ruby?',
          responses: [[0, 'Matzumoto'], [1, 'DHH'], [2,'Linus']],
        },
        {
          id: 2,
          body: 'What is the superclass of Object?',
          responses: [[0, 'nil'], [1, 'BasicObject'], [2,'Integer']],
        },
        {
          id: 3,
          body: 'What\'s the result of [1,2,3].map{|n| n * 2} ?',
          responses: [[0, '[]'], [1, '[1,4,9'], [2,'[2,4,6]']],
          last: true
        }],
      correct_responses: { '1':0, '2':1, '3':2 }
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
