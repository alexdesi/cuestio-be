require './app/lib/quiz_markdown/import'

namespace :quiz_markdown do
  desc 'Import a QuizMarkdown into the DB'

  task :import, [:qmd_file] => :environment do |_task, args| #qmd = QuizMarkdown
    puts args

    quiz_json = QuizMarkdown::Parser.new(args[:qmd_file]).quiz_json

    QuizMarkdown::import_quiz(quiz_json)
  end
end
