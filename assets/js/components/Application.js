import React, { Component } from 'react'
import { connect } from 'react-redux'

// import actions and components

class App extends Component {
  render() {
    const {
      state
    } = this.props;

    return (
      <div>
        <h2>Checklist</h2>
        <Checklist
          state={ state }
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