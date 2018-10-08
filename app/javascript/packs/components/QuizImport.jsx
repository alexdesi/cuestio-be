import React, { Component } from 'react'

class QuizImport extends Component {
  constructor(props){
    super(props)
    this.state = {
                  url: '', 
                  result: ''
                }
  }

  handleSubmit(event){
    event.preventDefault()
    console.log(this.state.url)

    const url = '?url=' + encodeURI(this.state.url)


    fetch("http://localhost:3000/api/quizzes/import/" + url)
      .then( response => response.json() )
      .then( r => {
        console.log(r)
        this.setState({result: r.result})
      })
      .catch( error => {
        console.log(error)
      })
  }

  handleChange(event){
    console.log(event.target.value)
    this.setState({url: event.target.value})
  }

  render() {
    return(
      <div>
        <p>Please specify the URL of the quiz in Markdown format that you want to import.</p>
        <form onSubmit={this.handleSubmit.bind(this)}>
          <label>
            Import Quiz URL
            <input type='text' value={this.state.url} onChange={this.handleChange.bind(this)} />
          </label>

          <input type='submit' value='Import' />

        </form>
        <p>Result: {this.state.result}</p>
      </div>
    )
  }
}

export { QuizImport }
