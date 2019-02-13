import React, { Component } from 'react';
import './App.css';
import 'bootstrap/dist/css/bootstrap.min.css'
import Footer from './components/Footer';
import AdvertsPanel from './components/AdvertsPanel';
import ItemsPanel from './components/ItemsPanel';

class App extends Component {
  render() {
    return (
      <div className="App">

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
          <div class="container">
              <a class="navbar-brand" href=".">Start Bootstrap</a>
              <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                      <a class="nav-link" href=".">Home
                      <span class="sr-only">(current)</span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href=".">About</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href=".">Services</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href=".">Contact</a>
                    </li>
                </ul>
              </div>
          </div>
        </nav>

        <div class="container">
          <div class="row">

            <div class="col-lg-3">
              <h1 class="my-4">Shop Name</h1>
              <div class="list-group">
                <a href="." class="list-group-item">Category 1</a>
                <a href="." class="list-group-item">Category 2</a>
                <a href="." class="list-group-item">Category 3</a>
              </div>
            </div>

            <div class="col-lg-9">
              <AdvertsPanel />
              <ItemsPanel />
            </div>
          </div>
        </div>

        <Footer />
      </div>
    );
  }
}

export default App;
