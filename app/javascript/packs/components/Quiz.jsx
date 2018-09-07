import React, { Component } from 'react'
import { Question } from './Question'

class Quiz extends Component {
  constructor(props){
    super(props)
    console.log('[Quiz] props')
    console.log(props)

    let firstQuestionId = this.questionIds()[0]
    
    this.state = {
                   currentQuestionId: firstQuestionId,
                   responses: [],
                   completed: false
                 }
  }

  questionIds() {
    return this.props.quiz.questions.map(q => q.id)
  }

  handleNextQuestion(currentResponse){
    console.log('currentResponse: ')
    console.log(currentResponse)

    let currentQuestionId = this.state.currentQuestionId

    let newResponses = this.state.responses.concat({
                           id: currentResponse.id,
                           response: currentResponse.response
                         })

    // if (currentQuestionId != -1) {
      console.log('questionIds(): ')
      console.log(this.questionIds())

      console.log('currentQuestionId')
      console.log(currentQuestionId)
      
      currentQuestionId = this.questionIds()[this.questionIds().indexOf(currentQuestionId) + 1]

      console.log('currentQuestionId')
      console.log(currentQuestionId)


      this.setState({
        currentQuestionId: currentQuestionId,
        responses: newResponses,
        completed: (currentQuestionId == this.props.quiz.questions.length)
      })
    // }
  }

  questionById(id){
    return this.props.quiz.questions.find( (e) => e.id == id)
  }

  score(){
    console.log('questions:')
    console.log(this.props.quiz.questions)
    
    console.log('Correct_responses:')
    console.log(this.props.quiz.correct_responses)

    console.log('this.state.responses:')
    console.log(this.state.responses)


    let correctResponses = this.props.quiz.questions.filter((q, i) => 
          this.props.quiz.correct_responses[i + 1] == this.state.responses[i].response
        )
    let score = correctResponses.length / this.state.responses.length
    return(score)
  }

  render(){
    console.log('questions:')
    console.log(this.props.quiz.questions)

    console.log('currentQuestionId')
    console.log(this.state.currentQuestionId)

    return(
      <div>
        { !this.state.completed ?
          <Question question={this.questionById(this.state.currentQuestionId)}
                    questionsNumber={this.props.quiz.questions.length}
                    handleNextQuestion={this.handleNextQuestion.bind(this)} /> :
          <div>
            <p>Test completed! Well done :)</p>
            <p>Your score is: {this.score()}</p>
          </div>
        }
      </div>
    )
  }
}

export { Quiz }
