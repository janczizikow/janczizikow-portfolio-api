import React, { useState, useContext, useLayoutEffect } from "react";
import { withRouter, RouteComponentProps } from "react-router-dom";
import Alert from "antd/lib/alert";
import Form from "antd/lib/form";
import Icon from "antd/lib/icon";
import Input from "antd/lib/input";
import Button from "antd/lib/button";
import classes from "./Login.module.css";
import api from "../../api";
import { AuthContext } from "../../components/Auth";

const Login: React.FunctionComponent<RouteComponentProps> = ({ history }) => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const auth = useContext(AuthContext);

  useLayoutEffect(() => {
    if (auth.token) {
      history.push({ pathname: "/dashboard" });
    }
  }, [auth.token]);

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const type = e.currentTarget.type;
    if (type === "email") {
      setEmail(e.currentTarget.value);
    } else if (type === "password") {
      setPassword(e.currentTarget.value);
    }
  };

  const handleSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setError("");
    api
      .post("/v1/auth/login", {
        user: { email, password }
      })
      .then(res => {
        const token = res.headers.authorization.replace("Bearer ", "");
        auth.login(token);
      })
      .catch(err => {
        if (err.response.data) {
          setError(err.response.data.error);
        } else {
          setError("Error");
        }
      });
  };

  return (
    <Form className={classes.form} onSubmit={handleSubmit}>
      {error && (
        <Form.Item>
          <Alert message={error} type="error" showIcon />
        </Form.Item>
      )}
      <Form.Item>
        <Input
          prefix={<Icon type="mail" style={{ color: "rgba(0,0,0,.25)" }} />}
          type="email"
          placeholder="Email"
          onChange={handleInputChange}
        />
      </Form.Item>
      <Form.Item>
        <Input
          prefix={<Icon type="lock" style={{ color: "rgba(0,0,0,.25)" }} />}
          type="password"
          placeholder="Password"
          onChange={handleInputChange}
        />
      </Form.Item>
      <Button type="primary" htmlType="submit" className={classes.button}>
        Log in
      </Button>
    </Form>
  );
};

export default withRouter(Login);
