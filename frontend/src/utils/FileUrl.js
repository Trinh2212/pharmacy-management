const beUrl = "http://localhost:5000";

export const fileUrl = (path) => {
  if (!path) return null;
  if (path.startsWith("/uploads")) {
    return `${beUrl}${path}`;
  }
  return path;
};
