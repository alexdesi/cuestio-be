module QuizMarkdown
  def self.import_quiz(quiz_json) #TODO rename this!!!

    puts "Correct responses: #{quiz_json.correct_responses}"

    quiz = Quiz.create(title: quiz_json.title, description: quiz_json.description)

    quiz_json.questions.each_with_index do |q, index|
      pp q
      correct_option =  quiz_json.correct_responses[index + 1]

      question = Question.create(quiz_id: quiz.id, body: q[:body])

      q[:options].each_with_index do |opt, opt_id|
        Option.create( question_id: question.id,
                       body: opt[:body],
                       is_correct: correct_option == opt_id + 1 )
      end
    end

    p 'Quiz Added'
    p "ID: #{quiz.id}"
    p "Title: #{quiz.title}"
    p '- - -'
  end

  def import.self(url: nil, text: nil)

    # get url
    # parse

    # if !parse_errors.any?
    #   create_quiz
    #     if !create.errors.any?
    #       SUCCESS
    #     else
    #       UNDO create
    #     end
    # end

    errors 

    json: {
      quiz: parser.quiz_json, #TODO in case of errors this should be empty
      errors: parser_errors + create_errors
    }
  end

end
