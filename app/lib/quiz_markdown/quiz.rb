module QuizMarkdown
  class Quiz
    attr_accessor :title, :description, :questions, :correct_responses

    def initialize()
      @questions = []
    end

    def loadFrom(quiz_id)
      Quiz.find(quiz_id)
      questions.each do |q|
        add_question(q.id, q.body)

      end
    end

    def add_question(body:, id: nil)
      @questions << {
        id: id,
        body: body,
        options: []
      }
    end

    def add_option(body:, id: nil)
      option = [body: body, id: id]
      @questions.last[:options] << option
    end

    def empty?
      title.nil?
    end

    def to_hash
      output = {
                 title: @title,
                 description: @description,
                 questions: @questions,
                 responses: @correct_responses
               }
      output
    end
  end

end
