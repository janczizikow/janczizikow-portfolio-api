import React from "react";
import Spin from "antd/lib/spin";
import classes from "./Placeholder.module.css";

const Placeholder = () => (
  <div className={classes.root}>
    <Spin />
  </div>
);

export default Placeholder;
