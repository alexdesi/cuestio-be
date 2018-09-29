import React, { Component } from 'react'
import { Options } from './Options'

class Question extends Component {
  constructor(props){
    super(props)
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

  skip(){
    this.props.handleNextQuestion({id: this.props.question.id, response: null})
    this.setState({response: null })
  }

  render(){
    return(
      <div>
        <h3>{ this.props.question.body }</h3>
        <Options
          options={ this.props.question.options }
          selected = { this.state.response }
          optionSelected={ this.optionSelected.bind(this) }>
        </Options>

        <p>Question {this.props.currentIndex} of {this.props.lastIndex}</p>

        <button onClick={ this.skip.bind(this) }>Skip</button>
        <button onClick={ this.handleConfirm.bind(this) }>Confirm</button>
      </div>
    )
  }
}

export { Question }
