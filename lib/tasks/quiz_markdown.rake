require './app/lib/quiz_markdown/import'

namespace :quiz_markdown do
  desc 'Import a QuizMarkdown into the DB'

  task :import, [:qmd_file] => :environment do |_task, args| #qmd = QuizMarkdown
    puts args

    QuizMarkdown::import_quiz(args[:qmd_file])
  end
end
