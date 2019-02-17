import React, { Component } from 'react';
import { withRouter, Route  } from 'react-router-dom';
import Footer from '../components/Footer';
import ItemsPanel from '../components/ItemsPanel';
import ItemDetails from '../components/ItemDetails';
import Navbar from '../components/Navbar';
import Sidebar from './Sidebar';

class Marketplace extends Component {
    constructor(props) {
        super(props);
        this.state = {  }
    }
    render() { 
        return (
            <>
                <Navbar />
                <div className="container">
                <div className="row">
                    <div className="col-lg-3">
                        <Sidebar />
                    </div>
                    <div className="col-lg-9">
                        <Route exact path="/items-panel" component={ItemsPanel} />
                        <Route exact path="/item-details" component={ItemDetails} />
                    </div>
                </div>
                </div>
                <Footer />
            </>
        );
    }
}
 
export default withRouter(Marketplace);