import React, { Component } from 'react'
import { Question } from './Question'

class Quiz extends Component {

  componentDidMount(){
    console.log('componentDidMount!!!!')
    fetch('http://localhost:3000/api/quizzes/2')
      .then(function(response) {
        return response.json();
      })
      .then(function(myJson) {
        console.log(JSON.stringify(myJson));
      });
  }

  constructor(props){
    super(props)
    console.log('[Quiz] props')
    console.log(props)

    let firstQuestionId = this.questionIds()[0]

    this.state = {
      currentQuestionId: firstQuestionId,
      completed: false
    }

    this.responses = []
  }

  questionIds() {
    return this.props.quiz.questions.map(q => q.id)
  }

  currentIndex(){
    return this.questionIds().indexOf(this.state.currentQuestionId)
  }

  isLastQuestion(){
    return (this.currentIndex() + 1 === this.props.quiz.questions.length)
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
    return this.props.quiz.questions.find( (e) => e.id == id)
  }

  score(){
    let correctResponses = this.responses.filter( (r) => r.response == this.props.quiz.correct_responses[r.id] )

    let score = correctResponses.length / this.responses.length
    return(score)
  }

  render(){
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
