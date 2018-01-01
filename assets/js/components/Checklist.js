import React, { Component, PropTypes } from 'react'
import ChecklistItem from './ChecklistItem'

class Checklist extends Component {

  constructor(props) {
    super(props);
  }

  componentDidMount() {
  }

  componentWillUnmount() {
  }

  render() {

    // injected by parent component
    const {
      state,
      onToggleCheck,
      onTextChange,
      onNewItem,
      onUpdateTitle
    } = this.props;

    return (
      <div>
        <h3><input type="text" onChange={ (event) => onUpdateTitle(event.target.value) } value={ state.title } /></h3>
        {
          state.items.map(
            function(item, index) {
              return (
                <ChecklistItem
                  state={ item }
                  key={ item.id }
                  index={ index }
                  onToggleCheck={ onToggleCheck }
                  onTextChange={ onTextChange }
                />
              )
            }
          )
        }
        <button onClick={ onNewItem }>New ...</button>
      </div>
    );
  }
}

export default Checklist
