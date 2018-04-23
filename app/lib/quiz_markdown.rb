class QuizMarkdown
  def initialize(filename)
    @file = File.open(filename)
    @quiz = Quiz.new
  end

  def quiz
    @file.each_line do |line|
      if h1(line)
        @quiz.title = h1(line)[1].strip
      elsif h2(line)
        @quiz.description ||= h2(line)[1].strip
      elsif ol(line)
        @quiz.add_question(id: ol(line)[1], body: ol(line)[2].strip)
      elsif li(line)
        @quiz.add_response(li(line)[1].strip)
      end
    end
    @quiz.to_json
  end

  private

  def h1(line)
    /^#([\w\s]+)/.match(line)
  end

  def h2(line)
    /^##(\w+)/.match(line)
  end

  def ol(line)
    /^(\d)\.\s([\w\s\?]+)/.match(line)
  end

  def li(line)
    /\s+\p{Pd}([\w\s\?]+)/.match(line)
  end

end

class Quiz
  attr_accessor :title, :description, :questions

  def initialize()
    @questions = []
  end

  def add_question(id:, body:)
    @questions << {
      id: id,
      body: body,
      responses: []
    }
  end

  def add_response(response)
    @questions.last[:responses] << response
  end

  def to_json
    output = {
               title: @title,
               description: @description,
               questions: @questions
             }
    output
  end
end
