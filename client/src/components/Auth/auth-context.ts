import React from "react";

const AuthContext = React.createContext<{
  token: string | null;
  login: (token: string) => void;
  logout: () => void;
}>({
  token: "",
  login: token => null,
  logout: () => null
});

export default AuthContext;
