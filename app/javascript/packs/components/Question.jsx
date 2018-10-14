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
        <p className='lead'>{ this.props.question.body }</p>
        <Options
          options={ this.props.question.options }
          selected = { this.state.response }
          optionSelected={ this.optionSelected.bind(this) }>
        </Options>

        <p><small>{this.props.currentIndex} / {this.props.lastIndex}</small></p>

        
        <div className='btn-toolbar' role='toolbar'>
          <div className='btn-group btn-group-sm mr-2'>
            <button onClick={this.skip.bind(this)}
                    className='btn btn-secondary'>Skip</button>
          </div>
          <div className='btn-group btn-group-lg'>
            <button onClick={this.handleConfirm.bind(this)}
                    className='btn btn-primary'>Confirm</button>
          </div>
        </div>
      </div>
    )
  }
}

export { Question }
