import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import axios from "axios";
import moment from "moment";
import Table from "antd/lib/table";
import Button from "antd/lib/button";
import api from "../../api";
import classes from "./Projects.module.css";
import { Project } from "./types";

const columns = [
  {
    title: "Name",
    dataIndex: "name",
    key: "name"
  },
  {
    title: "Category",
    dataIndex: "category",
    key: "category"
  },
  {
    title: "Date",
    dataIndex: "date",
    key: "date",
    render: (value: string) => moment(value).format("DD-MM-YYYY")
  },
  {
    title: "Updated",
    dataIndex: "updated_at",
    key: "updated",
    render: (value: string) => moment(value).format("DD-MM-YYYY")
  },
  {
    title: "Edit",
    dataIndex: "",
    key: "edit",
    render: (project: Project) => (
      <Link to={`/projects/${project.slug}`}>Edit</Link>
    )
  }
];

const Projects: React.FunctionComponent<{}> = () => {
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(false);
  const [projects, setProjects] = useState([]);

  useEffect(() => {
    const CancelToken = axios.CancelToken;
    const source = CancelToken.source();

    api
      .get("/v1/projects", { cancelToken: source.token })
      .then(res => {
        setLoading(false);
        setError(false);
        setProjects(res.data);
      })
      .catch(err => {
        setLoading(false);
        setError(err.response.data.error);
      });

    return () => {
      source.cancel("Clean before unmount");
    };
  }, []);

  return !error ? (
    <div>
      <Link to="/projects/new">
        <Button type="primary" className={classes.button}>
          Add new project
        </Button>
      </Link>
      <Table
        rowKey="id"
        columns={columns}
        // @ts-ignore
        dataSource={projects.length ? projects : null}
        pagination={false}
        loading={loading}
      />
    </div>
  ) : (
    <div>
      <p>Something went wrong</p>
    </div>
  );
};

export default Projects;
