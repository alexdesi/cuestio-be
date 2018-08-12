import React, { Component } from 'react'
import { Question } from './Question'

class Quiz extends Component {
  constructor(props){
    super(props)
    this.state = {
                   currentQuestionId: 0,
                   responses: [],
                   completed: false
                 }
  }

  handleNextQuestion(currentResponse){
    let currentQuestionId = this.state.currentQuestionId
    let newResponses = this.state.responses.concat({
                           id: currentQuestionId,
                           response: currentResponse
                         })
    if (currentQuestionId < this.props.quiz.quiz.questions.length) {
      currentQuestionId++

      this.setState({
        currentQuestionId: currentQuestionId,
        responses: newResponses,
        completed: (currentQuestionId == this.props.quiz.quiz.questions.length)
      })
    }
  }

  score(){
    let correctResponses = this.props.quiz.quiz.questions.filter((q, i) => 
          this.props.quiz.quiz.correct_responses[i + 1] == this.state.responses[i].response
        )
    let score = correctResponses.length / this.state.responses.length
    return(score)
  }

  render(){
    return(
      <div>
        { !this.state.completed ?
          <Question question={this.props.quiz.quiz.questions[this.state.currentQuestionId]}
                    questionsNumber={this.props.quiz.quiz.questions.length}
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
