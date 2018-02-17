import { IndexRoute, Route }          from 'react-router';
import React                          from 'react';
import MainLayout                     from '../layouts/main'
import Application                    from '../components/Application';

export default function configRoutes(store) {

  return (
    <Route path='/' component={ Application }>
    </Route>
  );
}