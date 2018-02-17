import { IndexRoute, Route }          from 'react-router';
import React                          from 'react';
import Application                    from '../components/Application';

export default function configRoutes() {

  // This has to stay in sync with the phoenix routes.

  return (
    <Route path='/:id' component={ Application }>
    </Route>
  );
}