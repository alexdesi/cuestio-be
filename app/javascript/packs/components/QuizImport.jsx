import React, { Component } from 'react'

class QuizImport extends Component {
  constructor(props){
    super(props)
    this.state = {
                  url: '', 
                  result: null,
                  errors: null
                }
  }

  handleSubmit(event){
    event.preventDefault()

    console.log(this.state.url)

    const url = '?url=' + encodeURI(this.state.url)

    fetch("http://localhost:3000/api/quizzes/import/" + url)
      .then(
        response => {
          if (!response.ok) {
            this.setState({errors: [response.statusText]})
            throw Error(response.statusText)
          }
          return response.json() 
        })
      .then( r => {
        let errorDescription = Object.entries(r.errors).map(e => e[1]) // e[1] is the error description

        this.setState({errors: errorDescription})

        console.log(r.quiz)

        this.setState({result: r.quiz})
      })
      .catch(error => {
        console.log(error)
      })
  }

  handleChange(event){
    console.log(event.target.value)
    this.setState({url: event.target.value})
  }

  renderError(){
    return(
      this.state.errors && this.state.errors.length > 0 ?
        <div className="alert alert-danger" role="alert">
          <ul>
            {this.state.errors.map(error =>
                                    <li>{error}</li>
                                  )
            }
          </ul>
        </div>
      : null 
    )
  }

  renderSuccess(){
    return(
      this.state.errors && this.state.errors.length === 0 ?
      <div class="alert alert-success" role="alert">
        The Markdown quiz was successfully imported! 
      </div>
      : null
    )
  }

  render() {
    return(
      <div>
        <h2>Import a Markdown quiz</h2>

        <p>Please specify the URL of the quiz in Markdown format that you want to import.</p>
        <form onSubmit={this.handleSubmit.bind(this)}>
          <div className="form-group">
            <label htmlFor='inputUrl'>Import Quiz URL</label>
            <input type='text' value={this.state.url} onChange={this.handleChange.bind(this)}
                   className='form-control' 
                   id='inputUrl'
                   aria-describedby="urlHelp"
                   placeholder="URL" />
            <small id="urlHelp">The url of the Markdown Quiz to import.</small>
          </div>

          <button type="submit" value='Import' className="btn btn-primary">Submit</button>
        </form>

        { this.renderError() }
        { this.renderSuccess() }
      </div>
    )
  }
}

export { QuizImport }
