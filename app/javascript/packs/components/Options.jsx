import React, { Component } from 'react';

const Options = (props) => {
  // handleOptionChange(e){
  //   this.props.handleSelectOption(e.target.value)
  // }

  // render() {
  //   let question = this.props.question
  console.log('>>>>')
  console.log('Options.jsx - props.options:')

  console.log(props.options)

  return (
    props.options.map(opt =>
      <div>
        <input type="radio" id={`option-${opt.id}`}
               name="option"
               onChange={(event) => props.optionSelected(event.target.value)}
               value={opt.id}
               checked={opt.id == props.selected}
               key={opt.id}
        />
        <label for={`option-${opt.id}`}>{opt.body}</label>
      </div>
    )
  )
}

export { Options }
