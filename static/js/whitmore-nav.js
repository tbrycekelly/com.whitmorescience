(function () {
  "use strict";

  var button = document.querySelector(".ws-navbar .navbar-toggle");
  var menu = document.querySelector("#ws-navbar-collapse");

  if (!button || !menu) return;

  function setOpen(open) {
    menu.classList.toggle("in", open);
    button.classList.toggle("collapsed", !open);
    button.setAttribute("aria-expanded", String(open));
  }

  button.addEventListener("click", function () {
    setOpen(!menu.classList.contains("in"));
  });

  menu.addEventListener("click", function (event) {
    if (event.target.closest("a")) setOpen(false);
  });

  document.addEventListener("keydown", function (event) {
    if (event.key === "Escape") {
      setOpen(false);
      button.focus();
    }
  });

  window.addEventListener("resize", function () {
    if (window.innerWidth >= 768) setOpen(false);
  });
})();
