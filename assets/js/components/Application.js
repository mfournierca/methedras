import React, { Component } from 'react'
import { connect } from 'react-redux'
import Checklist from './Checklist'

class App extends Component {
  render() {

    const {
      state
    } = this.props;

    return (
      <div>
        <h2>Application</h2>
        <Checklist
          state={ state.checklist }
        />
      </div>
    );
  }
}

const mapStateToProps = (state) => {
  return {
    state: state
  }
}

const mapDispatchToProps = (dispatch) => {
  return {
  }
}

const Application = connect(mapStateToProps, mapDispatchToProps)(App)

export default Application