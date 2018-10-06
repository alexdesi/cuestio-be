import React, { Component } from 'react'
import { Link } from 'react-router-dom';

import { Question } from './Question'

class Quiz extends Component {

  componentDidMount(){
    console.log('componentDidMount!!!!')

    let quiz_id = this.props.match.params.id

    fetch('http://localhost:3000/api/quizzes/' + quiz_id)
      .then( response => response.json() )
      .then( quiz => {
        this.questions = quiz.questions
        this.correctResponses = quiz.correct_responses
        this.setState( {
                        currentQuestionId: this.questionIds()[0],
                        completed: false
                      })
      });
  }

  constructor(props){
    super(props)

    this.questions = []
    this.responses = []
    this.correctResponses = []

    this.state = {
      currentQuestionId: null,
      completed: null
    }
  }

  questionIds() {
    return this.questions.map(q => q.id)
  }

  currentIndex(){
    return this.questionIds().indexOf(this.state.currentQuestionId)
  }

  isLastQuestion(){
    return (this.currentIndex() + 1 === this.questions.length)
  }

  handleNextQuestion(currentResponse){
    this.responses.push({ id: currentResponse.id,
                          response: currentResponse.response
                        })

      if (this.isLastQuestion()) {
        this.setState({ completed: true })
      }else{
        let nextQuestionId = this.questionIds()[this.currentIndex() + 1]
        this.setState({ currentQuestionId: nextQuestionId })
      }
      
  }

  questionById(id){
    return this.questions.find( (e) => e.id == id)
  }

  score(){
    let correctResponses = this.responses.filter( (r) => r.response == this.correctResponses[r.id] )

    return (correctResponses.length / this.responses.length)

  }

  render(){
    return(
      <div>
        { this.questions.length === 0 ?
          <p>Loading questions . . .</p>
        : !this.state.completed ?
          <Question question={this.questionById(this.state.currentQuestionId)}
                    currentIndex={this.currentIndex() + 1}
                    lastIndex={this.questions.length}
                    handleNextQuestion={this.handleNextQuestion.bind(this)} />
        :
          <div>
            <p>Test completed! Well done :)</p>
            <p>Your score is: { this.score() }</p>
            <Link to={ '/quizzes/' }>Other quizzes</Link>
          </div>
        }
      </div>
    )
  }
}

export { Quiz }
