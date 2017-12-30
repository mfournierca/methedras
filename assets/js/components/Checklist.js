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
      <div>
        <div>Checklist</div>
        {
          state.items.map(
            function(item, index) {
              return <ChecklistItem state={ item } key={ item.id } index={ index } />
            }
          )
        }
      </div>
    );
  }
}

export default Checklist
