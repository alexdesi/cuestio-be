import React, { Component } from 'react'
import { Options } from './Options'

class Question extends Component {
  constructor(props){
    super(props)
    console.log('Question constructor')
    console.log(props)
    this.state = { response: null }
  }

  optionSelected(response) {
    this.setState({response: response })
  }

  handleConfirm() {
    if (this.state.response === null) {
      alert('Hey! No response is not a response :)')
    }else{
      this.props.handleNextQuestion({id: this.props.question.id, response: this.state.response})
      this.setState({response: null })
    }
  }

  render(){
    return(
      <div>
        <p>Question {this.props.question.id} of {this.props.questionsNumber}</p>
        <h3>{ this.props.question.body }</h3>
        <Options
          options={ this.props.question.options }
          selected = { this.state.response }
          optionSelected={ this.optionSelected.bind(this) }>
        </Options>

        <button onClick={ this.handleConfirm.bind(this) }>Confirm</button>
      </div>
    )
  }
}

export { Question }
