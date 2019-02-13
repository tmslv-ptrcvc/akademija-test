import React, { Component } from 'react';
import { BrowserRouter as Router, Route, Link } from "react-router-dom";
import './App.css';
import 'bootstrap/dist/css/bootstrap.min.css'
import Footer from './components/Footer';
import AdvertsPanel from './components/AdvertsPanel';
import ItemsPanel from './components/ItemsPanel';
import ItemDetails from './components/ItemDetails';
import Navbar from './components/Navbar';

class App extends Component {
  render() {
    return (
      <div className="App">
        <Router>
            <>
            <Navbar />
            <div className="container">
              <div className="row">
                  <div className="col-lg-3">
                    <h1 className="my-4">Shop Name</h1>
                    <div className="list-group">
                        <Link className="list-group-item" to="/items-panel">Items</Link>
                        <Link className="list-group-item" to="/item-details">Item details</Link>
                        <a href="." className="list-group-item">Category 3</a>
                    </div>
                  </div>
                  <div className="col-lg-9">
                    <Route exact path="/items-panel" component={() => (
                      <>
                        <AdvertsPanel />
                        <ItemsPanel />
                      </>
                    )} />
                    <Route exact path="/item-details" component={ItemDetails} />
                  </div>
              </div>
            </div>
            </>
        </Router>
        <Footer />
      </div>
    );
  }
}

export default App;
