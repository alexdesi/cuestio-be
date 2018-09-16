require './app/lib/quiz_markdown/parser'

namespace :quiz_markdown do
  desc 'Import a QuizMarkdown into the DB'

  task :import, [:qmd_file] => :environment do |_task, args| #qmd = QuizMarkdown
    puts args

    quiz_json = QuizMarkdown::Parser.new(args[:qmd_file]).quiz_json

    # Create Quiz, Questions and Options into the DB
    quiz = Quiz.create(title: quiz_json.title, description: quiz_json.description)
    quiz_json.questions.each do |q|
      question = Question.create(quiz_id: quiz.id, body: q[:body])
      pp q
      q[:options].each do |opt|
        Option.create(question_id: question.id, body: opt)
      end
    end

    p 'Quiz Added'
    p "ID: #{quiz.id}"
    p "Title: #{quiz.title}"
    p '- - -'
  end
end
