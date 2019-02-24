import React, { Suspense, lazy } from "react";
import { Switch, Route } from "react-router-dom";
import withAuth from "./components/Auth";
import PrivateRoute from "./components/PrivateRoute";
import Layout from "./components/Layout";
import Placeholder from "./components/Placeholder";
import NotFound from "./pages/NotFound";

const Dashboard = lazy(() => import("./pages/Dashboard"));
const Projects = lazy(() => import("./pages/Projects"));
const NewProject = lazy(() => import("./pages/NewProject"));
const Project = lazy(() => import("./pages/Project"));
const Login = lazy(() => import("./pages/Login"));

const App = () => (
  <Layout>
    <Suspense fallback={<Placeholder />}>
      <Switch>
        <Route path="/login" component={Login} />
        <PrivateRoute path="/dashboard" component={Dashboard} />
        <PrivateRoute path="/projects/new" component={NewProject} />
        <PrivateRoute path="/projects/:id" component={Project} />
        <PrivateRoute path="/projects" component={Projects} />
        <Route component={NotFound} />
      </Switch>
    </Suspense>
  </Layout>
);

export default withAuth(App);
