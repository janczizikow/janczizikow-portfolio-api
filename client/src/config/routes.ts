import { lazy } from "react";
import NotFound from "../pages/NotFound";

const Dashboard = lazy(() => import("../pages/Dashboard"));
const Projects = lazy(() => import("../pages/Projects"));
const Project = lazy(() => import("../pages/Project"));
const Login = lazy(() => import("../pages/Login"));

const routes = {
  login: {
    path: "/login",
    component: Login
  },
  notFound: {
    component: NotFound
  }
};

export default routes;
