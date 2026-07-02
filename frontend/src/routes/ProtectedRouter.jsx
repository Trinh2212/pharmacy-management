import { Navigate, Outlet, useLocation } from "react-router-dom";
import { useAuth } from "../contexts/AuthContext"; 

export default function ProtectedRoute({ allowedRoles }) {
  const { user} = useAuth();
  const location = useLocation();

  // chưa đăng nhập mà cố vào
  if (!user) {
    return <Navigate to="/login" state={{ from: location }} replace />;
  }

  if (allowedRoles && !allowedRoles.includes(user.role)) {
    return <Navigate to="/" replace />;
  }

  return <Outlet />;
}
