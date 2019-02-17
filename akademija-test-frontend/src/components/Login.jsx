import React, { Component } from 'react';
import { handleChange } from '../utils';
import { Redirect } from "react-router-dom";
import { Auth } from '../App';
import axios from 'axios';

class Login extends Component {
    constructor(props) {
        super(props);
        this.state = {
            redirect: false,
            username: '',
            password: '',
            error: ''
        }

        // events
        this.handleChange = handleChange.bind(this)
    }

    login = () => {
        let self = this;

        axios.post('/api/user/info', {
            withCredentials: true,
            auth: {
                // username: this.state.username,
                // password: this.state.password
                username: 'user',
                password: 'User5'
            },
        }).then(function (response) {
            console.log(response.data.principal);
            // izvuci autentificiranog korisnika iz responsa i spremi ga u Auth
            Auth.authenticate();
            self.setState({ redirect: true })

        }).catch(function (error) {
            console.log(error.response.data || error);
            self.setState({ error: error.response.data.message })
        });
    }

    render() { 
        const { from } = this.props.location.state || { from: { pathname: "/" } };

        if (this.state.redirect){
            return <Redirect to={from} />
        }

        return (
            <div className="container py-5">
                <div className="row">
                    <div className="col-md-12">
                        <h2 className="text-center text-white mb-4">Bootstrap 4 Login Form</h2>
                        <div className="row">
                            <div className="col-md-6 mx-auto">
                                <div className="card rounded-2">
                                    <div className="card-header text-left">
                                        <h2 className="mb-0">Login</h2>
                                    </div>
                                    <div className="card-body">
                                        <div className="form-group text-left">
                                            <label>Username</label>
                                            <input type="text" className="form-control rounded-1" name="username" value={this.state.username} onChange={this.handleChange} />
                                        </div>
                                        <div className="form-group text-left">
                                            <label>Password</label>
                                            <input type="password" className="form-control rounded-1" name="password" value={this.state.password} onChange={this.handleChange} />
                                            <div className="invalid-feedback d-block">{this.state.error}</div>
                                        </div>
                                        <button className="btn btn-primary float-right" onClick={this.login}>Prijavi se</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}
 
export default Login;