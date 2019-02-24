import React, { useContext } from "react";
import { Route, Redirect, RouteProps } from "react-router-dom";
import { AuthContext } from "./Auth";

const PrivateRoute: React.FunctionComponent<RouteProps> = ({
  component: Component,
  ...rest
}) => {
  const isAuth = useContext(AuthContext).token;

  return (
    <Route
      {...rest}
      render={props =>
        // @ts-ignore
        isAuth ? <Component {...props} /> : <Redirect to="/login" />
      }
    />
  );
};

export default PrivateRoute;
