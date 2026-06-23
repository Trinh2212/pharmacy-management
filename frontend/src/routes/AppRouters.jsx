import { Routes, Route } from "react-router-dom";
// import CommonLayout from "../layouts/CommonLayout"
import Login from "../pages/Login";
import Home from "../pages/home";
import Medicines from "../pages/medicines";
import Contact from "../pages/contact";
import About from "../pages/about";


function AppRouters() {
  return (
    <Routes>
      <Route index element={<Home />} />
      <Route path="/login" element={<Login />} />
      <Route path="/medicines" element={<Medicines />} />
      <Route path="/contact" element={<Contact />} />
      <Route path="/about" element={<About />} />
    </Routes>
  );
}

export default AppRouters;
