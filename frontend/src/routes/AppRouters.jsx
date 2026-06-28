import { Routes, Route } from "react-router-dom";
import CommonLayout from "../layouts/CommonLayout";
import AdminLayout from "../layouts/AdminLayout";
import Login from "../pages/Login";
import Home from "../pages/home";
import Medicines from "../pages/medicines";
import Contact from "../pages/contact";
import About from "../pages/about";
import Ingredient from "../pages/ingredient";

import AddMedicine from "../pages/admin/AddMedicine"
import Dashboard from "../pages/admin/DashBoard";
import EmployeeManagement from "../pages/admin/EmployeeManagement";
import Profile from "../pages/admin/Profile";

function AppRouters() {
  return (
    <Routes>
      <Route element={<CommonLayout />}>
        <Route index element={<Home />} />
        <Route path="medicines" element={<Medicines />} />
        <Route path="contact" element={<Contact />} />
        <Route path="about" element={<About />} />
        <Route path="ingredients" element={<Ingredient />} />
      </Route>

      <Route path="admin" element={<AdminLayout />}>
        <Route index element={<Dashboard />} />
        <Route path="employees" element={<EmployeeManagement />} />
        <Route path="profile" element={<Profile />} />
      </Route>
      <Route path="login" element={<Login />} />
      <Route path="add-medicine" element={<AddMedicine />} />
    </Routes>
  );
}

export default AppRouters;
