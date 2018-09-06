module QuizMarkdown
  class Quiz
    attr_accessor :title, :description, :questions, :correct_responses

    def initialize()
      @questions = []
    end

    def add_question(id:, body:)
      @questions << {
        id: id,
        body: body,
        options: []
      }
    end

    def add_option(option)
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
