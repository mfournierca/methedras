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
      onToggleCheck
    } = this.props;

    return (
      <div>
        <input
          type="checkbox"
          checked={ state.checked }
          onChange={ () => onToggleCheck(index) }
        />
        { state.content }
      </div>
    );
  }
}

export default ChecklistItem