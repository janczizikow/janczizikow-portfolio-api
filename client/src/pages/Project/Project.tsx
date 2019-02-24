import React, { useEffect, useReducer } from "react";
import { RouteComponentProps } from "react-router-dom";
import moment from "moment";
import Form from "antd/lib/form";
import Input from "antd/lib/input";
import DatePicker from "antd/lib/date-picker";
import Modal from "antd/lib/modal";
import Button from "antd/lib/button";
import Placeholder from "../../components/Placeholder";
import api from "../../api";
import classes from "./Project.module.css";
import { Project as ProjectType } from "../Projects/types";

const confirm = Modal.confirm;

enum ActionTypes {
  REQUEST_PROJECT_SUCCESS = "[project] REQUEST_PROJECT_SUCCESS",
  REQUEST_PROJECT_FAIL = "[project] REQUEST_PROJECT_FAIL",
  SET_PROJECT_NAME = "[project] SET_PROJECT_NAME",
  SET_PROJECT_SLUG = "[project] SET_PROJECT_SLUG",
  SET_PROJECT_DATE = "[project] SET_PROJECT_DATE",
  SET_PROJECT_CATEGORY = "[project] SET_PROJECT_CATEGORY"
}

interface State {
  loading: boolean;
  project: ProjectType | null;
  error: null | object;
}

interface Action {
  type:
    | ActionTypes.REQUEST_PROJECT_SUCCESS
    | ActionTypes.REQUEST_PROJECT_FAIL
    | ActionTypes.SET_PROJECT_NAME;
  data?: ProjectType;
  error?: {};
  input?: string;
}

const initialState = {
  loading: true,
  project: null,
  error: null
};

const reducer = (state: State, action: Action): State => {
  switch (action.type) {
    case ActionTypes.REQUEST_PROJECT_SUCCESS:
      return {
        ...state,
        loading: false,
        // @ts-ignore
        project: {
          ...action.data
        }
      };
    case ActionTypes.REQUEST_PROJECT_FAIL:
      return {
        ...state,
        loading: false,
        // @ts-ignore
        error: action.error
      };
    case ActionTypes.SET_PROJECT_NAME:
      return {
        ...state,
        // TODO: This is not fully updated
        // @ts-ignore
        project: {
          ...state.project,
          name: action.input
        }
      };
    default:
      return state;
  }
};

const Project = (props: RouteComponentProps<{ id: string }>) => {
  const [state, dispatch] = useReducer(reducer, initialState);

  useEffect(() => {
    api
      .get(`/v1/projects/${props.match.params.id}`)
      .then(res => {
        dispatch({ type: ActionTypes.REQUEST_PROJECT_SUCCESS, data: res.data });
      })
      .catch(err => {
        dispatch({
          type: ActionTypes.REQUEST_PROJECT_FAIL,
          error: err.response.data.error
        });
      });
  }, []);

  const disabledDate = (current: moment.Moment | undefined) => {
    if (!current) return false;
    // disable any date greater then today
    return current && current > moment().endOf("day");
  };

  const handleSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    props.history.push("/projects");
  };

  const handleDelete = () => {
    api
      .delete(`/v1/projects/${props.match.params.id}`)
      .then(res => {
        props.history.push("/projects");
      })
      .catch(err => {
        // figure out how to handle this error
      });
  };

  const showConfirm = () => {
    confirm({
      title: `Do you want to delete ${
        state.project ? state.project.name : "this project"
      }?`,
      content: "Currently this action cannot be undone 🚧",
      onOk() {
        handleDelete();
      }
    });
  };

  if (state.loading) {
    return <Placeholder />;
  }

  return (
    <>
      {state.project && (
        <div>
          <h1>Edit {state.project.name}</h1>
          <Form layout="vertical" onSubmit={handleSubmit}>
            <Form.Item label="Name">
              <Input
                value={state.project.name}
                onChange={e =>
                  dispatch({
                    type: ActionTypes.SET_PROJECT_NAME,
                    input: e.target.value
                  })
                }
              />
            </Form.Item>
            <Form.Item label="Slug">
              <Input value={state.project.slug} />
            </Form.Item>
            <Form.Item label="Date">
              <DatePicker
                defaultValue={moment(state.project.date)}
                disabledDate={disabledDate}
              />
            </Form.Item>
            <Form.Item label="Category">
              <Input value={state.project.category} />
            </Form.Item>
            <Form.Item label="Description">
              <Input.TextArea value={state.project.description} />
            </Form.Item>
            {/* TODO: */}
            {/* [ ] LINKS */}
            {/* [ ] IMAGES */}
            <Button
              type="danger"
              onClick={showConfirm}
              className={classes.button}
            >
              Delete
            </Button>
            <Button type="primary" htmlType="submit" className={classes.button}>
              Save changes
            </Button>
          </Form>
        </div>
      )}
    </>
  );
};

export default Project;
