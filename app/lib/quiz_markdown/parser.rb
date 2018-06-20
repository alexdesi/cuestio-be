require './app/lib/quiz_markdown/quiz'

module QuizMarkdown
  class Parser
    def initialize(filename)
      raise('Ops! Filename is empty!') if filename.empty?

      @text = File.open(filename).read
      @quiz = Quiz.new
    end

    def quiz
      return @quiz.to_hash unless @quiz.empty?

      @quiz.title = title
      @quiz.description = description_paragraph
      @quiz.correct_responses = correct_responses

      questions_paragraph.each_line do |line|
        if ol(line)
          @quiz.add_question(id: ol(line)[1], body: ol(line)[2].strip)
        elsif li(line)
          @quiz.add_response(li(line)[1].strip)
        end
      end

      @quiz
    end

    private

    def is_loaded?
      !@quiz.title.blank?
    end

    def description_paragraph
      (/##description(.+?)##/mi)
        .match(@text)[1]
        .strip
    end

    def title
      /^#([\w\s]+)$/
        .match(@text)[1]
        .strip
    end

    def questions_paragraph
      (/##Questions(.+?)##/mi)
        .match(@text)[1]
        .strip
    end

    def responses_paragraph
      (/##responses(.+?)##/mi)
        .match(@text)[1]
        .strip
    end

    def correct_responses
      responses_paragraph.split(',')
                    .each_with_object({}) do |response, hash|
                      id_question, id_response = response.split(':')
                      hash[id_question.to_i] = id_response.to_i
                    end
    end

    def ol(line)
      /^(\d)\.\s([\w\s\?]+)/.match(line)
    end

    def li(line)
      /\s+\p{Pd}([\w\s\?]+)/.match(line)
    end
  end

end
