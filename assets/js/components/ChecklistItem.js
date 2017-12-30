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
      index
    } = this.props;

    return (
      <div>
        <input type="checkbox" checked={ state.checked } />
        { state.content }
      </div>
    );
  }
}

export default ChecklistItem