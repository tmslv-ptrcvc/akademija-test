import React, { Component } from 'react';
import { Link, withRouter } from "react-router-dom";
import { Auth } from '../App';

class Navbar extends Component {
    constructor(props) {
        super(props);
        this.state = {  }
    }

    logout = async () => {
        await Auth.signout();
        this.props.history.push("/login");
    }

    render() { 
        return (
            <nav className="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
                <div className="container">
                    <a className="navbar-brand" href=".">Start Bootstrap</a>
                    <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span className="navbar-toggler-icon"></span>
                    </button>
                    <div className="collapse navbar-collapse" id="navbarResponsive">
                        <ul className="navbar-nav ml-auto">
                            <li className="nav-item active">
                                <Link className="nav-link" to="/">Home</Link>
                            </li>
                            <li className="nav-item">
                                <Link className="nav-link" to="/about">About</Link>
                            </li>
                            <li className="nav-item">
                                <Link className="nav-link" to="/services">Services</Link>
                            </li>
                            <li className="nav-item">
                                <Link to="/" className="nav-link" onClick={this.logout}>Sing Out</Link>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        );
    }
}
 
export default withRouter(Navbar);