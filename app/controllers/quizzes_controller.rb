class QuizzesController < ApplicationController
  def index
  	@questions_prop = [{
      id: 1,
      body: 'Who invented the language Ruby?',
      responses: [[0, 'Matzumoto'], [1, 'DHH'], [2,'Linus']],
      correctResponse: 0
    },
    {
      id: 2,
      body: 'What is the superclass of Object?',
      responses: [[0, 'nil'], [1, 'BasicObject'], [2,'Integer']],
      correctResponse: 1
    },
    {
      id: 3,
      body: 'What\'s the result of [1,2,3].map{|n| n * 2} ?',
      responses: [[0, '[]'], [1, '[1,4,9'], [2,'[2,4,6]']],
      correctResponse: 2,
      last: true
    }]

  end
end
