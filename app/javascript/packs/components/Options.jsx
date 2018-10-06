import React, { Component } from 'react';

const Options = (props) => {
  return (
    props.options.map(opt =>
      <div key = { 'option-' + opt.id } >
        <input type="radio" id={ 'option-' + opt.id }
               name="option"
               onChange={(event) => props.optionSelected(event.target.value)}
               value={opt.id}
               checked={opt.id == props.selected}
               key={opt.id}
        />
        <label htmlFor={`option-${opt.id}`}>{opt.body}</label>
      </div>
    )
  )
}

export { Options }
