import React, { Component } from 'react'
import { Link } from 'react-router-dom';

class QuizzesMenu extends Component {
  constructor() {
    super()

    this.state = {
      quizzes: []
    }
  }

  componentDidMount() {
    fetch('http://localhost:3000/api/quizzes')
      .then((response) => {
        console.log(response);
        return response.json();
      })
      .then((data) => {
        this.setState({ quizzes: data })
      });
  }

  render() {
    return(
      <ul>
        { this.state.quizzes.map(e =>
          <li key={ 'quizzes-'+ e.id }>
            <Link to={ '/quizzes/' + e.id }> {e.title} </Link>
          </li> )}
      </ul>
    )
  }
}

export { QuizzesMenu }
