document.addEventListener("DOMContentLoaded", () => {
  const roleSelect = document.getElementById("user_role_select");
  const teacherCodeInput = document.getElementById("teacher_code_input");

  console.log("Role select element:", roleSelect);
  console.log("Teacher code input element:", teacherCodeInput);

  if (roleSelect && teacherCodeInput) {
    roleSelect.addEventListener("change", () => {
      console.log("Role select value:", roleSelect.value);
      teacherCodeInput.style.display = roleSelect.value === "teacher" ? "block" : "none";
    });
  }
});