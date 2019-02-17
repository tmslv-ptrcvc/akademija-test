import React, { Component } from 'react';
import { Route, Redirect, Switch } from "react-router-dom";
import './App.css';
import 'bootstrap/dist/css/bootstrap.min.css'
import Marketplace from './components/Marketplace';
import Login from './components/Login';

/**
 * TODO
 */
export const Auth = {
  isAuthenticated: false,
  authenticate(cb){
    this.isAuthenticated = true
  },
  signout(cb){
    this.isAuthenticated = false
  }
}

/**
 * Create custom private Route for authenticated part of app.
 * 
 * @param {*} param0 
 */
const PrivateRoute = ({ component: Component, ...rest }) => (
  <Route {...rest} render={(props) => (
    Auth.isAuthenticated === true
    ? <Component {...props} />
    : <Redirect to={{ pathname: "/login", state: { from: props.location } }}
  />
  )} />
)

class App extends Component {
  render() {
    return (
      <div className="App">
        <Switch>
          <Route path='/login' component={Login} />
          <PrivateRoute path='/' component={Marketplace} />
        </Switch>
      </div>
    );
  }
}

export default App;
