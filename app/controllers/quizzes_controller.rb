class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end

  def show
    # @quiz_prop = {
    #   questions: [{
    #       id: 10,
    #       body: 'Who invented the language Ruby?',
    #       options: [[1, 'Matzumoto'], [2, 'DHH'], [3, 'Linus']],
    #     },
    #     {
    #       id: 11,
    #       body: 'What is the superclass of Object?',
    #       options: [[1, 'nil'], [2, 'BasicObject'], [3, 'Integer']],
    #     },
    #     {
    #       id: 12,
    #       body: 'What\'s the result of [1,2,3].map{|n| n * 2} ?',
    #       options: [[1, '[]'], [2, '[1,4,9'], [3, '[2,4,6]']],
    #       last: true
    #     }],
    #   correct_responses: { '1':1, '2':2, '3':3 }
    # }

# TODO: it's better to be explicit about the values of the options
# Use a array of hash instead array of array
    @quiz_prop = {
      questions: [{
          id: 10,
          body: 'Who invented the language Ruby?',
          options: [{id: 100, body: 'Matzumoto'},
                    {id: 101, body: 'DHH'},
                    {id: 102, body: 'Linus'}],
        },
        {
          id: 11,
          body: 'What is the superclass of Object?',
          options: [{id: 103, body: 'nil'},
                    {id: 104, body: 'BasicObject'},
                    {id: 105, body: 'Integer'}],
        },
        {
          id: 12,
          body: 'What\'s the result of [1,2,3].map{|n| n * 2} ?',
          options: [{id: 106, body: '[]]'},
                    {id: 107, body: '[1,4,9]'},
                    {id: 108, body: '[2,4,6]'}],
          last: true
        }],
      correct_responses: { '10':100, '11':104, '12':108 }
    }
  end
end
