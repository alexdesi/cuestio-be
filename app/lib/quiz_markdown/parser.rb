require './app/lib/quiz_json'

module QuizMarkdown
  class Parser
    def initialize(filename)
      raise('Ops! Filename is empty!') if filename.empty?

      @text = File.open(filename).read
      @quiz_json = QuizJson.new
    end

    def quiz_json
      return @quiz_json.to_hash unless @quiz_json.empty?

      @quiz_json.title = title
      @quiz_json.description = description_paragraph
      @quiz_json.correct_responses = correct_responses

      questions_paragraph.each_line do |line|
        if ol(line)
          @quiz_json.add_question(body: ol(line)[1].strip)
        elsif li(line)
          @quiz_json.add_option(body: li(line)[1].strip)
        end
      end

      @quiz_json
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
      /^\d\.\s([\w\s\?]+)/.match(line)
    end

    def li(line)
      /\s+\p{Pd}([\w\s\?]+)/.match(line)
    end
  end

end
