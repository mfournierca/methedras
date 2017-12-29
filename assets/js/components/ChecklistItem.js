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
      state
    } = this.props;

    return (
      <div>Checklistitem</div>
    );
  }
}

export default ChecklistItem