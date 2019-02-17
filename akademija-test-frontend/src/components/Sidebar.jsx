import React, { Component } from 'react';
import { Link  } from 'react-router-dom';

class Sidebar extends Component {
    constructor(props) {
        super(props);
        this.state = {  }
    }
    render() { 
        return (
            <>
                <h1 className="my-4">Shop Name</h1>
                <div className="list-group">
                    <Link className="list-group-item" to="/items-panel">Items</Link>
                    <Link className="list-group-item" to="/item-details">Item details</Link>
                    <a href="." className="list-group-item">Category 3</a>
                </div>
            </>
        );
    }
}
 
export default Sidebar;