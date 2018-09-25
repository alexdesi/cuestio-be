import React, { Component } from 'react'
import { BrowserRouter, Route, Link } from "react-router-dom";

import { Quiz } from './Quiz.jsx'
import { QuizzesMenu } from './QuizzesMenu.jsx'

class App extends Component {
  render() {
    console.log('>>> APP render')
    return (
      <BrowserRouter>
        <div className="App">
          <header className="App-header">
            <h1 className="App-title">Quiz</h1>
          </header>
          {/*<p>Questions</p>*/}

          {/*<Quiz/>*/}
          {/*<QuizzesMenu/>*/}

          <Route path="/quizzes" component={ QuizzesMenu }/>

        </div>
      </BrowserRouter>
    )
  }
}

export { App }
