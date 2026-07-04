import Swal from "sweetalert2";

export const alertSuccess = (message, title = "Thành công") => {
  return Swal.fire({
    icon: "success",
    title: title,
    text: message,
    buttonsStyling: false,
    customClass: {
      icon: "icon-swal-success",
      confirmButton: "btn-swal-ok",
    },
  });
};

export const alertError = (
  errorOrMessage,
  defaultMessage = "có lỗi xảy ra, vui lòng kiểm tra lại",
) => {
  const message =
    typeof errorOrMessage === "string"
      ? errorOrMessage
      : (errorOrMessage?.response?.data?.message ??
        errorOrMessage?.message ??
        defaultMessage);

  return Swal.fire({
    icon: "error",
    title: "Lỗi",
    text: message,
    buttonsStyling: false,
    customClass: {
      icon: "icon-swal-error",
      confirmButton: "btn-swal-error-ok",
    },
  });
};

export const alertWarning = (message, title = "Cảnh báo") => {
  return Swal.fire({
    icon: "warning",
    title: title,
    text: message,
    buttonsStyling: false,
    customClass: {
      icon: "icon-swal-warning",  
      confirmButton: "btn-swal-warning-ok",
    },
  });
};

export const alertConfirm = (
  message,
  title = "Xác nhận",
  confirmButtonClass = "btn-swal-ok",
) => {
  return Swal.fire({
    title: title,
    text: message,
    icon: "info",
    showCancelButton: true,
    buttonsStyling: false,
    confirmButtonText: "Xác nhận",
    cancelButtonText: "Hủy",
    customClass: {
      confirmButton: confirmButtonClass,
      cancelButton: "btn-swal-cancel",
    },
  });
};

export const alertToast = (message, icon = "success") => {
  return Swal.fire({
    toast: true,
    position: "top-end",
    showConfirmButton: false,
    timer: 2000,
    timerProgressBar: true,
    icon: icon,
    title: message,
    didOpen: (toast) => {
      toast.addEventListener("mouseenter", Swal.stopTimer);
      toast.addEventListener("mouseleave", Swal.resumeTimer);
    },
  });
};