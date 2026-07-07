import { Routes, Route } from "react-router-dom";

import ProtectedRoute from "./ProtectedRouter";

import CommonLayout from "../layouts/CommonLayout";
import AdminLayout from "../layouts/AdminLayout";

import Login from "../pages/Login";
import Home from "../pages/Home";
import Medicines from "../pages/Medicines";
import MedicineDetail from "../pages/MedicineDetail";
import Contact from "../pages/Contact";
import About from "../pages/About";
import Ingredient from "../pages/Ingredients";

import Dashboard from "../pages/admin/DashBoard";
import MedicineManagement from "../pages/admin/MedicineManagement";
import AddMedicine from "../pages/admin/AddMedicine";
import UpdateMedicine from "../pages/admin/UpdateMedicine";
import GroupManagement from "../pages/admin/GroupManagement";
import IngredientManagement from "../pages/admin/IngredientManagement";
import SupplierManagement from "../pages/admin/SupplierManagement";
import EmployeeManagement from "../pages/admin/EmployeeManagement";
import Profile from "../pages/admin/Profile";
import AddReceipt from "../pages/admin/AddReceipt";
import WarehouseManagement from "../pages/admin/WarehouseManagement";
import BatchManagement from "../pages/admin/BatchManagement";

function AppRouters() {
  return (
    <Routes>
      <Route path="login" element={<Login />} />

      <Route element={<CommonLayout />}>
        <Route index element={<Home />} />
        <Route path="medicines" element={<Medicines />} />
        <Route
          path="medicines/medicine-detail/:id"
          element={<MedicineDetail />}
        />
        <Route path="ingredients" element={<Ingredient />} />
        <Route path="contact" element={<Contact />} />
        <Route path="about" element={<About />} />
      </Route>

      <Route element={<ProtectedRoute allowedRoles={["admin", "employee"]} />}>
        <Route path="admin" element={<AdminLayout />}>
          <Route index element={<Dashboard />} />
          <Route path="medicine-management" element={<MedicineManagement />} />
          <Route path="medicine/add-medicine" element={<AddMedicine />} />
          <Route
            path="medicine/update-medicine/:id"
            element={<UpdateMedicine />}
          />
          <Route path="group-management" element={<GroupManagement />} />
          <Route
            path="ingredient-management"
            element={<IngredientManagement />}
          />
          <Route path="supplier-management" element={<SupplierManagement />} />
          <Route path="warehouse/add-receipt" element={<AddReceipt />} />
          <Route
            path="warehouse-management"
            element={<WarehouseManagement />}
          />
          <Route path="batch-management" element={<BatchManagement />} />
          <Route path="profile" element={<Profile />} />

          {/* chỉ admin mới vào được /admin/employees */}
          <Route element={<ProtectedRoute allowedRoles={["admin"]} />}>
            <Route
              path="employee-management"
              element={<EmployeeManagement />}
            />
          </Route>
        </Route>
      </Route>
    </Routes>
  );
}

export default AppRouters;
