$(document).ready(function() {
  let tltransition = gsap.timeline();

  tltransition
      .fromTo('.page-transition__red', { scaleX: 0 }, { scaleX: 1, transformOrigin: 'right', duration: 2.2, ease: 'power4.inOut' })
      .fromTo('.page-transition__black', { scaleX: 0 }, { scaleX: 1, transformOrigin: 'right', duration: 2.2, ease: 'power4.inOut' }, "-=2")
      .fromTo('.transition__logo', { xPercent: -100, autoAlpha: 0 }, { xPercent: 0, autoAlpha: 1, duration: 1.6, ease: 'power4.inOut' }, "-=1.5")
      .set('.page-transition__red', { scaleX: 0 })
      .to('.page-transition__black', { scaleX: 0, transformOrigin: 'right', duration: 2.2, ease: 'power4.inOut' })
      .to('.transition__logo', { autoAlpha: 0, duration: 0.2 }, "-=1.2")
      .set(".page_transition", { display: "none" });
});
