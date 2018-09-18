class QuizJson
  attr_accessor :title, :description, :questions #, :correct_responses
  attr_reader :quiz

  def initialize(quiz = nil)
    @quiz = quiz
    @questions = []
  end

  def load
    @title = quiz.title
    @description = quiz.description

    quiz.questions.each do |q|
      add_question(body: q.body, id: q.id)
      q.options.each do |opt|
        add_option(body: opt.body, id: opt.id)
      end
    end

    # @correct_responses = load_correct_responses(quiz)
    self
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

  def correct_responses
    result = {}
    quiz.questions.each do |q|
      correct_option = q.options.find{ |opt| opt.is_correct }
      result[q.id] = correct_option[:id]
    end
    result
  end

  def to_hash
    output = {
               title: @title,
               description: @description,
               questions: @questions,
               correct_responses: correct_responses # { 12: 1, 13: 2, question_id: option_id }
             }
    output
  end
end
