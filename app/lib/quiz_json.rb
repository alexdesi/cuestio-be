class QuizJson
  attr_accessor :title, :description, :questions, :correct_responses

  def initialize()
    @questions = []
  end

  def load_from(quiz)
    # Quiz.find(quiz_id)
    @title = quiz.title
    quiz.questions.each do |q|
      add_question(body: q.body, id: q.id)
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
    @questions.last[:options] << { body: body, id: id }
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
