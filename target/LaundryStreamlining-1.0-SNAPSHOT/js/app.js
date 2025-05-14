const sign_in_btn = document.querySelector("#sign-in-btn");
const sign_up_btn = document.querySelector("#sign-up-btn");
const container = document.querySelector(".panels-container");

sign_up_btn.addEventListener("click", () => {
  container.classList.add("right-panel-active");
});

sign_in_btn.addEventListener("click", () => {
  container.classList.remove("right-panel-active");
});
