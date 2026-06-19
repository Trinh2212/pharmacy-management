import { Routes, Route } from "react-router-dom";
import Login from "../pages/Login";
import Home from "../pages/home";

function AppRouters() {
  return (
    <Routes>
      <Route path="/homepage" element={< Home />} />
      <Route path="/login" element={< Login />} />
    </Routes>
  );
}

export default AppRouters;
