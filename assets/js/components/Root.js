import React                from 'react';
import { Provider }         from 'react-redux';
import { Router }           from 'react-router';
import { invariant }        from 'invariant';
import { RoutingContext }   from 'react-router';
import configRoutes         from '../routes/Routes';

export default class Root extends React.Component {
  render() {
    const { store } = this.props;

    return (
      <Provider store={ store }>
        <Router history={ this.props.routerHistory }>
          { configRoutes(store) }
        </Router>
      </Provider>
    );
  }
}
