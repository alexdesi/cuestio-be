class QuizJson
  attr_accessor :title, :description, :questions, :correct_responses

  def initialize()
    @questions = []
  end

  def load_from(quiz)
    @title = quiz.title
    @description = quiz.description

    quiz.questions.each do |q|
      add_question(body: q.body, id: q.id)
      q.options.each do |opt|
        add_option(body: opt.body, id: opt.id)
      end
    end

    @correct_responses = load_correct_responses(quiz)
  end

  def add_question(body:, id: nil)
    @questions << {
      id: id,
      body: body,
      options: []
    }
  end

  def add_option(body:, id: nil)
    @questions.last[:options] << { body: body, id: id }
  end

  def empty?
    title.nil?
  end

  def load_correct_responses(quiz)
    result = []
    quiz.questions.each do |q|
      q.options.each do |opt|
        result << { opt.id => opt.is_correct }
      end
    end
    result
  end

  def to_hash
    output = {
               title: @title,
               description: @description,
               questions: @questions,
               correct_responses: correct_responses
             }
    output
  end
end
