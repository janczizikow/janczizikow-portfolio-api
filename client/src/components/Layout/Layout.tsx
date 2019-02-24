import React from "react";
import { Link } from "react-router-dom";
import ANTDLayout from "antd/lib/layout";
import Menu from "antd/lib/menu";
import Breadcrumb from "antd/lib/breadcrumb";
import { AuthButton } from "../Auth";

const { Header, Content, Footer } = ANTDLayout;

const Layout: React.FunctionComponent = ({ children }) => (
  <ANTDLayout style={{ minHeight: "100vh" }}>
    <ANTDLayout>
      <Header>
        <div className="logo" />
        <Menu theme="dark" mode="horizontal" style={{ lineHeight: "64px" }}>
          <Menu.Item key="auth">
            <AuthButton />
          </Menu.Item>
        </Menu>
      </Header>
      <Content style={{ margin: "0 16px" }}>
        <Breadcrumb style={{ margin: "16px 0" }}>
          <Breadcrumb.Item>
            <Link to="/dashboard">Home</Link>
          </Breadcrumb.Item>
          <Breadcrumb.Item>
            <Link to="/projects">Projects</Link>
          </Breadcrumb.Item>
        </Breadcrumb>
        <div style={{ padding: 24, background: "#fff", minHeight: 360 }}>
          {children}
        </div>
      </Content>
      <Footer style={{ textAlign: "center" }}>
        &copy; {new Date().getFullYear()} Created by JC
      </Footer>
    </ANTDLayout>
  </ANTDLayout>
);

export default Layout;
