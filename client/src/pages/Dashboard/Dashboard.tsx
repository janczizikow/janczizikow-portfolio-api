import React from "react";
import { Link } from "react-router-dom";

export default function Dashboard() {
  return (
    <div>
      <span>Welcome back user!</span>
      <Link to="/projects">Projects</Link>
    </div>
  );
}
