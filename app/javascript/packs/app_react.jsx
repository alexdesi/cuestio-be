// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import { App } from './components/App.jsx'

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('quiz_data')
  const data = JSON.parse(node.getAttribute('data'))

  ReactDOM.render(<App quiz = { data } />, document.getElementById('root'))
})
