require './app/lib/quiz_markdown/parser'

namespace :quiz_markdown do
  desc 'Import a QuizMarkdown into the DB'

  task :import, [:qmd_file] => :environment do |_task, args| #qmd = QuizMarkdown
    puts args

    quiz_markdown = QuizMarkdown::Parser.new(args[:qmd_file]).quiz
    binding.pry

    # Create Quiz, Questions and Options into the DB
    quiz = Quiz.create(title: quiz_markdown.title, description: quiz_markdown.description)
    quiz_markdown.questions.each do |q|
      question = Question.create(quiz_id: quiz.id, body: q[:body])
      pp q
      q[:options].each do |opt|
        Option.create(question_id: question.id, body: opt)
      end
    end

    p "Added quiz: '#{quiz.title}'"
  end
end
