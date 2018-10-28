import React, { Component } from 'react'
import { BrowserRouter, Switch, Route, Link } from 'react-router-dom';

import { Quiz } from './Quiz.jsx'
import { QuizzesMenu } from './QuizzesMenu.jsx'
import { QuizImport } from './QuizImport.jsx'

class App extends Component {
  render() {
    console.log('APP started!!!!')
    return (
      <BrowserRouter>
        <div className="App">
          <Switch>
            <Route exact path="/quizzes" component={ QuizzesMenu }/>
            <Route exact path="/quizzes/import" component={ QuizImport }/>
            <Route path="/quizzes/:id" component={ Quiz }/>
          </Switch>
        </div>
      </BrowserRouter>
    )
  }
}

export { App }
