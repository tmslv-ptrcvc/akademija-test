import React, { Component } from 'react';

class Login extends Component {
    constructor(props) {
        super(props);
        this.state = {  }
    }
    render() { 
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
                                        <form className="form" role="form" autocomplete="off" id="formLogin" novalidate="" method="POST">
                                            <div className="form-group text-left">
                                                <label for="username">Username</label>
                                                <input type="text" className="form-control rounded-1" name="username" id="username" required=""/>
                                                <div className="invalid-feedback">Oops, you missed this one.</div>
                                            </div>
                                            <div className="form-group text-left">
                                                <label>Password</label>
                                                <input type="password" className="form-control rounded-1" id="password" required="" autocomplete="new-password"/>
                                                <div className="invalid-feedback">Enter your password too!</div>
                                            </div>
                                            <button type="submit" className="btn btn-primary float-right" id="btnLogin">Prijavi se</button>
                                        </form>
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