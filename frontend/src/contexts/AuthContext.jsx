import { createContext, useState, useContext } from "react";
const AuthContext = createContext();

export const useAuth = () => useContext(AuthContext);

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(() => {
    const storedUser = localStorage.getItem("user");
    return storedUser ? JSON.parse(storedUser) : null;
  });

  const login = (userData) => {
    localStorage.setItem("user", JSON.stringify(userData));
    setUser(userData);
  };

  const updateUser = (newUserData) => {
    const updated = { ...user, ...newUserData };
    localStorage.setItem("user", JSON.stringify(updated));
    setUser(updated);
  };

  const logout = () => {
    localStorage.removeItem("user");
    localStorage.removeItem("accessToken");
    setUser(null);
  };

  return (
    <AuthContext.Provider value={{ user, login, logout, updateUser}}>
      {children}
    </AuthContext.Provider>
  );
};
