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
      state
    } = this.props;

    return (
      <div>Checklist</div>
    );
  }
}

export default Checklist
