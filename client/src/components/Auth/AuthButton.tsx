import React, { useContext } from "react";
import { Link } from "react-router-dom";
import Button from "antd/lib/button";
import AuthContext from "./auth-context";

const AuthButton = () => {
  const auth = useContext(AuthContext);
  const isAuth = auth.token;
  return isAuth ? (
    <Button type="primary" onClick={auth.logout}>
      Logout
    </Button>
  ) : (
    <Link to="/login">Login</Link>
  );
};

export default AuthButton;
