import React, { Component } from 'react'

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
        console.log('>>> data:')
        console.log(JSON.stringify(data));
      });
  }

  render() {
    console.log('>>> QuizzesMenu render')
    console.log(this.state.quizzes)

    return(
      this.state.quizzes.map(e =>
        <p>{e.title} {e.description}</p>
      )
    )
  }
}

export { QuizzesMenu }
