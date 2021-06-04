import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["ARTIST", "YOUTUBER", "SINGER", "ACTOR"],
    typeSpeed: 80,
    loop: true
  });
}

export { loadDynamicBannerText };
