import React, { Component, PropTypes } from 'react'

class ChecklistItem extends Component {

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
      index,
      onToggleCheck,
      onTextChange
    } = this.props;

    return (
      <div>
        <input
          type="checkbox"
          checked={ state.checked }
          onChange={ () => onToggleCheck(index) }
        />
        <input
          type="text"
          value={ state.content }
          onChange={ (event) => onTextChange(index, event.target.value) }
        />
      </div>
    );
  }
}

export default ChecklistItem