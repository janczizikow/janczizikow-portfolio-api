import React from "react";
import classes from "./NotFound.module.css";

const NotFound = () => (
  <div className={classes.root}>
    <h1>Page not found (404)</h1>
    <p>The page you're looking for doesn&apos;t seem to exist.</p>
  </div>
);

export default NotFound;
