import React, { Component } from 'react'
import { Quiz } from './Quiz.jsx'

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <h1 className="App-title">Quiz</h1>
        </header>
        <p>Questions</p>
        { console.log('this.props') }
        { console.log(this.props) }
        <Quiz quiz={ this.props.quiz } />
      </div>
    )
  }
}

export { App }
