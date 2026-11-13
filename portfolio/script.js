const menuToggle = document.querySelector(".menu-toggle");
const siteNav = document.querySelector(".site-nav");

if (menuToggle && siteNav) {
  const closeMenu = () => {
    menuToggle.setAttribute("aria-expanded", "false");
    menuToggle.setAttribute("aria-label", "Open navigation");
    siteNav.classList.remove("is-open");
  };

  menuToggle.addEventListener("click", () => {
    const isOpen = menuToggle.getAttribute("aria-expanded") === "true";
    menuToggle.setAttribute("aria-expanded", String(!isOpen));
    menuToggle.setAttribute("aria-label", isOpen ? "Open navigation" : "Close navigation");
    siteNav.classList.toggle("is-open", !isOpen);
  });

  siteNav.addEventListener("click", (event) => {
    if (event.target instanceof HTMLAnchorElement) closeMenu();
  });

  document.addEventListener("keydown", (event) => {
    if (event.key === "Escape") closeMenu();
  });
}

const reduceMotion = window.matchMedia("(prefers-reduced-motion: reduce)").matches;

if (!reduceMotion && "IntersectionObserver" in window) {
  const revealTargets = document.querySelectorAll(
    ".hero-copy, .hero-visual, .intro-section > *, .section-heading, .project-card, .experience-card, .education-card, .contact-section > .section-kicker, .contact-content, .site-footer > *",
  );

  const revealObserver = new IntersectionObserver(
    (entries, observer) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add("is-visible");
          observer.unobserve(entry.target);
        }
      });
    },
    { threshold: 0.12, rootMargin: "0px 0px -6% 0px" },
  );

  revealTargets.forEach((element) => {
    element.dataset.reveal = "";
    revealObserver.observe(element);
  });
}

const heroVisual = document.querySelector(".hero-visual");
const finePointer = window.matchMedia("(hover: hover) and (pointer: fine)");

if (heroVisual && !reduceMotion && finePointer.matches) {
  let pointerFrame = 0;

  heroVisual.addEventListener("pointermove", (event) => {
    if (pointerFrame) cancelAnimationFrame(pointerFrame);

    pointerFrame = requestAnimationFrame(() => {
      const bounds = heroVisual.getBoundingClientRect();
      const x = (event.clientX - bounds.left) / bounds.width;
      const y = (event.clientY - bounds.top) / bounds.height;
      heroVisual.style.setProperty("--pointer-x", `${x * 100}%`);
      heroVisual.style.setProperty("--pointer-y", `${y * 100}%`);
      heroVisual.style.setProperty("--tilt-x", `${(0.5 - y) * 3}deg`);
      heroVisual.style.setProperty("--tilt-y", `${(x - 0.5) * 4}deg`);
      pointerFrame = 0;
    });
  });

  heroVisual.addEventListener("pointerleave", () => {
    if (pointerFrame) cancelAnimationFrame(pointerFrame);
    pointerFrame = 0;
    heroVisual.style.setProperty("--tilt-x", "0deg");
    heroVisual.style.setProperty("--tilt-y", "0deg");
  });
}
