import React, { Component } from 'react'
import { BrowserRouter, Switch, Route, Link } from 'react-router-dom';

import { Quiz } from './Quiz.jsx'
import { QuizzesMenu } from './QuizzesMenu.jsx'

class App extends Component {
  render() {
    return (
      <BrowserRouter>
        <div className="App">
          <header className="App-header">
            <h1 className="App-title">Quiz</h1>
          </header>

          <Switch>
            <Route exact path="/quizzes" component={ QuizzesMenu }/>
            <Route path="/quizzes/:id" component={ Quiz }/>
          </Switch>


        </div>
      </BrowserRouter>
    )
  }
}

export { App }
