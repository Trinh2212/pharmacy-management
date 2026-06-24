import { Routes, Route } from "react-router-dom";
import CommonLayout from "../layouts/CommonLayout";
import Login from "../pages/Login";
import Home from "../pages/home";
import Medicines from "../pages/medicines";
import Contact from "../pages/contact";
import About from "../pages/about";
import AddMedicine from "../pages/admin/AddMedicine"

function AppRouters() {
  return (
    <Routes>
      <Route element={<CommonLayout />}>
        <Route index element={<Home />} />
        <Route path="medicines" element={<Medicines />} />
        <Route path="contact" element={<Contact />} />
        <Route path="about" element={<About />} />
      </Route>
      <Route path="login" element={<Login />} />

      <Route path="add-medicine" element={<AddMedicine />} />
      
    </Routes>
  );
}

export default AppRouters;
