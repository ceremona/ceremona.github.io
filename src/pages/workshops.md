---
layout: ../layouts/BaseLayout.astro
title: "Workshops"
---

<div class="hero">
  <h1>Workshops</h1>
  <p class="page-description">Hands-on workshops at the intersection of science and art.</p>
</div>

<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; margin: 2rem 0;">
  <div style="position: relative; aspect-ratio: 4/3;">
    <img src="/images/workshops/spektrum-berlin.jpg" alt="Spektrum Berlin" class="hover-img-default" style="width: 100%; height: 100%; object-fit: cover; display: block;" />
    <img src="/images/workshops/spektrum-berlin-alt.jpg" alt="Spektrum Berlin (detail)" class="hover-img-hover" style="width: 100%; height: 100%; object-fit: cover; display: block; position: absolute; top: 0; left: 0; opacity: 0; transition: opacity 0.3s;" />
  </div>
  <div style="position: relative; aspect-ratio: 4/3;">
    <img src="/images/workshops/chabot-workshop.jpg" alt="ZKM Karlsruhe" class="hover-img-default" style="width: 100%; height: 100%; object-fit: cover; display: block;" />
    <img src="/images/workshops/zkm-karlsruhe-alt.jpg" alt="ZKM Karlsruhe (detail)" class="hover-img-hover" style="width: 100%; height: 100%; object-fit: cover; display: block; position: absolute; top: 0; left: 0; opacity: 0; transition: opacity 0.3s;" />
  </div>
</div>

<style>
  .hover-img-hover:hover { opacity: 1 !important; }
</style>

<div class="exhibitions">
  <h3>Workshops</h3>
  <ul>
    <li>Light Shaping with Liquid Crystals — Spektrum Berlin, February 2019</li>
    <li>The Hidden Beauty of Everyday Plastics — TinkerFest, Chabot Space & Science Center, 2018</li>
    <li>Science and Art — #GPN18, ZKM Center Karlsruhe, Germany, May 2018</li>
    <li>How to Build a 'God's Eye' Kinetic Sculpture — HackArnival, Metiers Art Museum, Paris, May 2018</li>
    <li>Quizzical Creatures — Motion with Magnets — TinkerFest, Chabot Space Sciences Center, Oakland, CA, 2017</li>
    <li>Pretty Plastics for Open Engagement, Oakland, CA, 2016</li>
  </ul>
</div>
