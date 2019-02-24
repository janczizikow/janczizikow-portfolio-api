import React, { Component } from "react";
import AuthContext from "./auth-context";

interface S {
  readonly token: string | null;
}

const withAuth = <P extends object>(
  WrappedComponent: React.ComponentType<P>
) => {
  return class WithAuth extends Component<P, S> {
    state = {
      token: null
    };

    login = (token: string) => {
      this.setState({ token });
    };

    logout = () => {
      this.setState({ token: null });
    };

    render() {
      return (
        <AuthContext.Provider
          value={{
            token: this.state.token,
            login: this.login,
            logout: this.logout
          }}
        >
          <WrappedComponent {...this.props} />
        </AuthContext.Provider>
      );
    }
  };
};

export default withAuth;
