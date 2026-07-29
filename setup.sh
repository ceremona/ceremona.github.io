#!/bin/bash
set -e

echo "Creating ceredavis-astro site structure..."

# ─── Directories ───────────────────────────────────────────────
mkdir -p src/layouts
mkdir -p src/components
mkdir -p src/content/projects
mkdir -p src/pages/projects/art
mkdir -p src/pages/research
mkdir -p public/images/liquid-loom
mkdir -p public/images/water-organ
mkdir -p public/images/gods-eye
mkdir -p public/images/fire-ants
mkdir -p public/images/chatty-spring-ballz
mkdir -p public/images/piana-obscura
mkdir -p .github/workflows

# ─── package.json ──────────────────────────────────────────────
cat > package.json << 'EOF'
{
  "name": "ceredavis-astro",
  "type": "module",
  "version": "1.0.0",
  "scripts": {
    "dev": "astro dev",
    "build": "astro build",
    "preview": "astro preview"
  },
  "dependencies": {
    "astro": "^5.0.0"
  }
}
EOF

# ─── astro.config.mjs ──────────────────────────────────────────
cat > astro.config.mjs << 'EOF'
import { defineConfig } from 'astro/config';
export default defineConfig({
  site: 'https://ceredavis.com',
});
EOF

# ─── tsconfig.json ─────────────────────────────────────────────
cat > tsconfig.json << 'EOF'
{
  "extends": "astro/tsconfigs/strict",
  "include": [".astro/types.d.ts", "**/*"],
  "exclude": ["dist"]
}
EOF

# ─── src/content.config.ts ─────────────────────────────────────
cat > src/content.config.ts << 'EOF'
import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

const projects = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/projects' }),
  schema: z.object({
    title: z.string(),
    subtitle: z.string().optional(),
    meta: z.string().optional(),
    year: z.number().optional(),
    status: z.enum(['featured', 'archived']).default('featured'),
    cover: z.string().optional(),
    summary: z.string().optional(),
    order: z.number().default(99),
    videoId: z.string().optional(),
    galleryFolder: z.string().optional(),
  }),
});

export const collections = { projects };
EOF

# ─── src/layouts/BaseLayout.astro ──────────────────────────────
cat > src/layouts/BaseLayout.astro << 'ENDOFFILE'
---
const title = Astro.props.title || 'Cere Davis';
const year = new Date().getFullYear();
const path = Astro.url.pathname;
---
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{title} — Cere Davis</title>
</head>
<body>
  <header>
    <a href="/" class="logo">Cere Davis</a>
    <nav>
      <a href="/" class={path === '/' ? 'active' : ''}>Home</a>
      <a href="/research/" class={path.startsWith('/research') ? 'active' : ''}>Research</a>
      <a href="/projects/" class={path.startsWith('/projects') ? 'active' : ''}>Projects</a>
      <a href="/writing/" class={path.startsWith('/writing') ? 'active' : ''}>Writing</a>
      <a href="/workshops/" class={path.startsWith('/workshops') ? 'active' : ''}>Workshops</a>
      <a href="/about/" class={path.startsWith('/about') ? 'active' : ''}>About</a>
    </nav>
  </header>
  <main><slot /></main>
  <footer>
    <span>&copy; {year} Cere Davis</span>
    <span><a href="mailto:cere@ceredavis.com">cere@ceredavis.com</a></span>
  </footer>
</body>
</html>
<style is:global>
* { margin: 0; padding: 0; box-sizing: border-box; }
body { font-family: Georgia, 'Times New Roman', serif; line-height: 1.7; color: #1a1a1a; background: #fafaf8; max-width: 820px; margin: 0 auto; padding: 0 1.5rem; }
header { display: flex; justify-content: space-between; align-items: baseline; padding: 1.5rem 0 1rem; border-bottom: 1px solid #e0ddd5; position: sticky; top: 0; background: #fafaf8; z-index: 100; }
.logo { font-weight: bold; text-decoration: none; color: #1a1a1a; font-size: 1.1rem; }
nav { display: flex; gap: 1.5rem; }
nav a { text-decoration: none; color: #777; font-size: 0.92rem; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif; }
nav a:hover, nav a.active { color: #1a1a1a; }
.hero { padding: 3rem 0 2rem; }
.hero h1 { font-size: 2.4rem; margin-bottom: 0.3rem; letter-spacing: -0.01em; }
.tagline { color: #4a6a7e; font-size: 1.15rem; margin-bottom: 1rem; font-style: italic; }
.bio { color: #555; font-size: 1rem; max-width: 600px; }
section { margin-top: 2.5rem; }
section h2 { font-size: 1.3rem; margin-bottom: 1.2rem; color: #333; border-bottom: 1px solid #e0ddd5; padding-bottom: 0.4rem; }
.project-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 1.5rem; }
.project-card { text-decoration: none; color: inherit; display: block; }
.project-card .card-image { width: 100%; aspect-ratio: 4/3; object-fit: cover; border-radius: 4px; margin-bottom: 0.6rem; background: #e8e6e0; }
.project-card h3 { font-size: 1.05rem; margin-bottom: 0.15rem; }
.project-card .year { color: #999; font-size: 0.85rem; font-family: -apple-system, sans-serif; }
.project-card .summary { color: #666; font-size: 0.88rem; margin-top: 0.3rem; line-height: 1.5; }
.project-card:hover h3 { color: #4a6a7e; }
.archive { margin-top: 2rem; }
.archive summary { cursor: pointer; color: #888; font-size: 0.92rem; padding: 0.5rem 0; font-family: -apple-system, sans-serif; }
.archive-list { display: flex; flex-direction: column; gap: 0.5rem; margin-top: 0.5rem; }
.archive-item { display: flex; justify-content: space-between; text-decoration: none; color: #666; padding: 0.3rem 0; border-bottom: 1px solid #f0eee8; }
.archive-item:hover { color: #1a1a1a; }
.archive-item .year { color: #aaa; font-size: 0.85rem; font-family: -apple-system, sans-serif; }
.project-header { margin-bottom: 2rem; }
.project-header h1 { font-size: 2rem; margin-bottom: 0.3rem; }
.project-header .subtitle { color: #4a6a7e; font-size: 1.05rem; font-style: italic; margin-bottom: 0.3rem; }
.project-header .meta { color: #999; font-size: 0.88rem; font-family: -apple-system, sans-serif; }
.prose p { margin-bottom: 1.2rem; }
.prose img { max-width: 100%; height: auto; border-radius: 4px; display: block; margin: 1.5rem 0; }
.prose h2 { font-size: 1.3rem; margin-top: 2rem; margin-bottom: 0.5rem; }
.prose h3 { font-size: 1.05rem; margin-top: 1.5rem; margin-bottom: 0.5rem; }
.prose ul { margin-left: 1.5rem; margin-bottom: 1.2rem; }
.prose li { margin-bottom: 0.3rem; }
.prose strong { color: #444; }
.prose a { color: #2563eb; }
.photo-deck { display: flex; gap: 1rem; overflow-x: auto; scroll-snap-type: x mandatory; -webkit-overflow-scrolling: touch; padding: 0.5rem 0; margin: 2rem 0; scrollbar-width: thin; scrollbar-color: #ccc transparent; }
.photo-deck::-webkit-scrollbar { height: 6px; }
.photo-deck::-webkit-scrollbar-track { background: transparent; }
.photo-deck::-webkit-scrollbar-thumb { background: #ccc; border-radius: 3px; }
.photo-deck figure { flex: 0 0 auto; width: min(380px, 75vw); scroll-snap-align: start; margin: 0; }
.photo-deck img { width: 100%; aspect-ratio: 4/3; object-fit: cover; margin: 0; border-radius: 4px; }
.photo-deck figcaption { margin-top: 0.4rem; font-size: 0.8rem; color: #888; text-align: center; font-family: -apple-system, sans-serif; }
.video-embed { position: relative; width: 100%; padding-bottom: 56.25%; margin: 2rem 0; border-radius: 4px; overflow: hidden; }
.video-embed iframe { position: absolute; top: 0; left: 0; width: 100%; height: 100%; border: 0; }
.details-box { background: #f5f3ee; border-radius: 6px; padding: 1.2rem 1.5rem; margin: 2rem 0; font-size: 0.9rem; }
.details-box h3 { font-size: 0.95rem; margin-bottom: 0.5rem; color: #555; }
.details-box ul { list-style: none; padding: 0; }
.details-box li { margin-bottom: 0.3rem; }
.details-box strong { color: #444; }
.exhibitions { margin: 2rem 0; }
.exhibitions h3 { font-size: 1rem; margin-bottom: 0.5rem; color: #555; }
.exhibitions ul { list-style: none; padding: 0; }
.exhibitions li { margin-bottom: 0.3rem; font-size: 0.9rem; color: #666; }
footer { margin-top: 4rem; padding: 1.5rem 0; border-top: 1px solid #e0ddd5; font-size: 0.85rem; color: #999; font-family: -apple-system, sans-serif; display: flex; justify-content: space-between; }
footer a { color: #999; text-decoration: none; }
footer a:hover { color: #1a1a1a; }
.back-link { margin-top: 2rem; }
.back-link a { color: #4a6a7e; text-decoration: none; }
@media (max-width: 600px) { .hero h1 { font-size: 1.8rem; } nav { gap: 1rem; } .project-grid { grid-template-columns: 1fr; } }
</style>
ENDOFFILE

# ─── src/components/Video.astro ────────────────────────────────
cat > src/components/Video.astro << 'ENDOFFILE'
---
interface Props { id: string; }
const { id } = Astro.props;
---
<div class="video-embed">
  <iframe src={`https://www.youtube.com/embed/${id}`} width="700" height="480" frameborder="0" allowfullscreen="true"></iframe>
</div>
ENDOFFILE

# ─── src/components/Gallery.astro ──────────────────────────────
cat > src/components/Gallery.astro << 'ENDOFFILE'
---
import fs from 'node:fs';
import path from 'node:path';
interface Props { folder: string; captions?: boolean; }
const { folder, captions = false } = Astro.props;
const fsPath = path.join(process.cwd(), 'public', folder);
let images: string[] = [];
try {
  images = fs.readdirSync(fsPath)
    .filter(f => /\.(jpg|jpeg|png|gif|webp)$/i.test(f))
    .sort();
} catch {}
---
{images.length > 0 && (
  <div class="photo-deck">
    {images.map(img => (
      <figure>
        <a href={`${folder}${img}`}><img src={`${folder}${img}`} alt={img} loading="lazy" /></a>
        {captions && <figcaption>{img.replace(/\.[^.]+$/, '').replace(/-/g, ' ')}</figcaption>}
      </figure>
    ))}
  </div>
)}
ENDOFFILE

# ─── src/pages/index.astro (Homepage) ──────────────────────────
cat > src/pages/index.astro << 'ENDOFFILE'
---
import { getCollection } from 'astro:content';
import BaseLayout from '../layouts/BaseLayout.astro';
const allProjects = await getCollection('projects');
const featured = allProjects.filter(p => p.data.status === 'featured').sort((a, b) => (a.data.order || 99) - (b.data.order || 99));
const archived = allProjects.filter(p => p.data.status === 'archived').sort((a, b) => (b.data.year || 0) - (a.data.year || 0));
---
<BaseLayout title="Cere Davis">
  <div class="hero">
    <h1>Cere Davis</h1>
    <p class="tagline">Science | Art</p>
    <p class="bio">Multidisciplinary artist and engineer working at the intersection of physics, computing, and material culture. Berkeley, CA.</p>
  </div>
  <section id="projects">
    <h2>Selected Work</h2>
    <div class="project-grid">
      {featured.map(project => (
        <a href={`/projects/art/${project.id}/`} class="project-card">
          {project.data.cover && <img class="card-image" src={project.data.cover} alt={project.data.title} loading="lazy" />}
          <h3>{project.data.title}</h3>
          {project.data.year && <span class="year">{project.data.year}</span>}
          {project.data.summary && <p class="summary">{project.data.summary}</p>}
        </a>
      ))}
    </div>
  </section>
  {archived.length > 0 && (
    <section>
      <details class="archive">
        <summary>Older work ({archived.length} projects)</summary>
        <div class="archive-list">
          {archived.map(project => (
            <a href={`/projects/art/${project.id}/`} class="archive-item">
              <span>{project.data.title}</span>
              {project.data.year && <span class="year">{project.data.year}</span>}
            </a>
          ))}
        </div>
      </details>
    </section>
  )}
  <section id="research"><h2>Research</h2><p>Reservoir computing, neuromorphic systems, and hybrid computational strategies.</p><p><a href="/research/">Computing &rarr;</a></p></section>
  <section id="writing"><h2>Writing</h2><p><em>Coming soon.</em></p></section>
  <section id="workshops"><h2>Workshops</h2><p>Light Shaping with Liquid Crystals — Spektrum Berlin, 2019. Science and Art — ZKM Center Karlsruhe, 2018.</p><p><a href="/workshops/">More &rarr;</a></p></section>
  <section id="about"><h2>About</h2><p>Background in computer systems architecture, physics, and vocal improvisation. BS Physics, University of Alaska Fairbanks. Berkeley Civic Arts Grant recipient, 2018.</p><p><a href="/about/">Full bio &rarr;</a></p></section>
</BaseLayout>
ENDOFFILE

# ─── src/pages/projects/index.astro ────────────────────────────
cat > src/pages/projects/index.astro << 'ENDOFFILE'
---
import { getCollection } from 'astro:content';
import BaseLayout from '../../layouts/BaseLayout.astro';
const allProjects = await getCollection('projects');
const featured = allProjects.filter(p => p.data.status === 'featured').sort((a, b) => (a.data.order || 99) - (b.data.order || 99));
const archived = allProjects.filter(p => p.data.status === 'archived').sort((a, b) => (b.data.year || 0) - (a.data.year || 0));
---
<BaseLayout title="Projects">
  <div class="hero"><h1>Projects</h1><p class="tagline">Moving sculpture, kinetic art, and interactive installations.</p></div>
  <section>
    <h2>Selected Work</h2>
    <div class="project-grid">
      {featured.map(project => (
        <a href={`/projects/art/${project.id}/`} class="project-card">
          {project.data.cover && <img class="card-image" src={project.data.cover} alt={project.data.title} loading="lazy" />}
          <h3>{project.data.title}</h3>
          {project.data.year && <span class="year">{project.data.year}</span>}
          {project.data.summary && <p class="summary">{project.data.summary}</p>}
        </a>
      ))}
    </div>
  </section>
  {archived.length > 0 && (
    <section>
      <details class="archive">
        <summary>Older work ({archived.length} projects)</summary>
        <div class="archive-list">
          {archived.map(project => (
            <a href={`/projects/art/${project.id}/`} class="archive-item">
              <span>{project.data.title}</span>
              {project.data.year && <span class="year">{project.data.year}</span>}
            </a>
          ))}
        </div>
      </details>
    </section>
  )}
</BaseLayout>
ENDOFFILE

# ─── src/pages/projects/art/[...slug].astro ────────────────────
cat > 'src/pages/projects/art/[...slug].astro' << 'ENDOFFILE'
---
import { getCollection, render } from 'astro:content';
import BaseLayout from '../../../layouts/BaseLayout.astro';
import Video from '../../../components/Video.astro';
import Gallery from '../../../components/Gallery.astro';
export async function getStaticPaths() {
  const projects = await getCollection('projects');
  return projects.map(project => ({ params: { slug: project.id }, props: { project } }));
}
const { project } = Astro.props;
const { Content } = await render(project);
const data = project.data;
---
<BaseLayout title={data.title}>
  <div class="project-header">
    <h1>{data.title}</h1>
    {data.subtitle && <p class="subtitle">{data.subtitle}</p>}
    {data.meta && <p class="meta">{data.meta}</p>}
  </div>
  {data.videoId && <Video id={data.videoId} />}
  <div class="prose"><Content /></div>
  {data.galleryFolder && <Gallery folder={data.galleryFolder} captions={true} />}
  <p class="back-link"><a href="/projects/">&larr; Back to projects</a></p>
</BaseLayout>
ENDOFFILE

# ─── Project content files ─────────────────────────────────────

cat > src/content/projects/liquid-loom.md << 'EOF'
---
title: "Liquid Loom"
subtitle: "Interactive Kinetic Sculpture & Projected Art"
meta: "2018 · Awesome Foundation, SF Chapter"
year: 2018
status: featured
cover: /images/liquid-loom/cover.jpg
summary: "Backlit LCD glass panes recycled from vintage ATM screens, stripped of electronics and revealed as bare liquid-filled glass responsive to electrostatic energy."
order: 1
videoId: "YOUR_YOUTUBE_ID"
galleryFolder: "/images/liquid-loom/"
---

Liquid Loom is an optokinetic arrangement in which backlit LCD glass panes recycled from vintage ATM screens are stripped of all electronic controls and revealed as bare liquid-filled glass suspended within a translucent frame. To our customary notion of electronics, this visual ensemble appears defunct, and lifeless, lacking a conventional means of control or electrical power. But this seemingly dormant assembly awakens as luminous threads emerge in response to nearby electrostatic energy.

Electrons flowing between the ion source and human contact create crossing glitch-style streams which naturally fade into Indonesian Batik patterns reminiscent of Javanese cloth dyeing and other forms of indigenous art. The dynamic interplay between invisible charges and liquid crystal leave behind visually resonant footprints as they are born, reborn, grow, change and slowly fade away.

This work explores the intersection of industrial design and process-based aesthetics, investigating the tensions that exist between the chaos of the natural world and the hyper-optimization of our modern technology. Once emancipated from its former role as an ATM screen, bare liquid crystal filled glass flows freely, displaying resonant patterns which naturally emerge in response to nearby electrostatic fields.

We re-contextualize flat screen technology, originally designed for digital precision, as a way to visually explore chaos as well as question our ideas of what is considered to be 'waste'. Set against the ubiquitous backdrop of our digital culture, this work backgrounds ideals of pixel precision and foregrounds the aesthetics of the material behavior in a new context. Without the use of electronic controllers or microchips, Liquid Loom invites us to participate tactilely with subtle electrostatic footprints generated and left behind by human movement and contact. Through this media we are able to witness our direct effect on the nanoscale world.

Liquid crystal displays are, in essence, charged liquid sandwiched between a microscopically small glass gap, imperceptible to the naked eye. By recontextualizing this delicate design, the optical properties of charged liquid behave as a kind of interactive polariscope, visually responsive to subtle electrostatic charges generated through friction and motion. Vintage forms of LCD screen technology — often used in ATM screens — are special in that they do not constrain the flow of electrostatic energy across the panes, thus allowing one to freely "draw" chaotic visual textures across the glass as an emergent conversation between the user and technology.

<div class="details-box">
  <h3>Technical Details</h3>
  <ul>
    <li><strong>Power:</strong> Analog electrostatic powered, human touch controlled LCD windows</li>
    <li><strong>Components:</strong> Conductive edge traces, LCD glass, anisotropic conductor, acrylic, electro-mechanical ion transducer, LED lights</li>
    <li><strong>Electronics:</strong> Power needed for LED backlighting only</li>
    <li><strong>Digital/software:</strong> None</li>
  </ul>
</div>

<div class="exhibitions">
  <h3>Exhibitions</h3>
  <ul>
    <li>Mutek.SF Festival, Midway Gallery, SF, 2019</li>
    <li>San Francisco Awesome Foundation, SF, 2018</li>
    <li>Leonardo/ISAST Convening & 50th Anniversary, San Francisco Art Institute, 2018</li>
    <li>Forms — Stanford University 200 year commemoration of Mary Shelley, 2018</li>
  </ul>
</div>
EOF

cat > src/content/projects/water-organ.md << 'EOF'
---
title: "Water Organ"
subtitle: "Ambisonic Kinetic Sculpture"
meta: "2017"
year: 2017
status: featured
cover: /images/water-organ/cover.jpg
summary: "A kinetic sculpture plays an ambisonic musical composition as inductive forces transform floating resonant vessels into moving speakers."
order: 2
galleryFolder: "/images/water-organ/"
---

A kinetic sculpture plays an ambisonic musical composition as inductive forces transform floating resonant vessels into moving speakers.

Participants trigger a random process generating electronic tones into seven copper inductive coils placed under water. Magnets underneath floating vessels transform upcycled steel "tin" lids into audible speakers, each resonating with a unique timbral character while passing over copper inductive speaker coils. A seven-toned ambisonic composition emerges from the minute vibration of each steel vessel floating above the water. The audible volume of each vessel varies according to a complex interplay between a vessel's resonant frequency and the frequency of the electromagnetic audio signals being sent through the coils. Kinetic motion emerges from a semi-chaotic imbalance of inductive and magnetic forces, periodically pushing and pulling magnetic vessels towards and away from the coils as the electrical current reverses direction.

Water Organ behaves as a many-bodied "strange attractor" whose chaotic motion emerges through mutual magnetic repulsion between vessels combined with the changing magnetic polarity of copper inductive coils. This work offers a calming natural meditative "Koi pond"-like behavior, as if the organism's movement were an emergent murmuration of living agents.

Audible elements of this ambisonic composition can only be partially experienced through a stereo video recording. It is best to experience the true omni-directional sound of this piece in-person.

<div class="details-box">
  <h3>Materials</h3>
  <ul>
    <li>Recycled steel lids (sometimes glass petri dishes, sometimes acrylic dishes)</li>
    <li>Custom wound copper coil inductors</li>
    <li>Recycled door stops</li>
    <li>Magnets</li>
    <li>Polycarbonate, nylon mesh, vinyl plastic</li>
    <li>Amplifiers, Teensy microcontroller</li>
  </ul>
</div>

<div class="exhibitions">
  <h3>Exhibitions</h3>
  <ul>
    <li>Liquid Assets Water Organ featured with Thingamajigs Performance Group, San Jose Art Museum, CA, 2017</li>
    <li>Last Festival, San Jose, CA, 2017</li>
    <li>Dorkbot SF, SF, CA, 2017</li>
    <li>Manylabs, SF, CA, 2017</li>
    <li>Paseo Prototyping Festival, San Jose, CA, 2016</li>
  </ul>
</div>
EOF

cat > src/content/projects/gods-eye.md << 'EOF'
---
title: "God's Eye"
subtitle: "Interactive Electromagnetic Kinetic Sculpture"
meta: "2016"
year: 2016
status: featured
cover: /images/gods-eye/cover.jpg
summary: "An interactive electromagnetic kinetic sculpture. Magnets roam freely in proximal space, exploring their functional interiority through induction and gravity."
order: 3
galleryFolder: "/images/gods-eye/"
---

God's Eye is a glimpse into the inner life of magnetic beings. In this world, magnets are free to roam. Once they were trapped in cramped clusters, left on an office desk, stuck in a drawer, confined to an inanimate existence. No longer! Here, magnets are reimagined in proximal space, structured with attention to counter-balance and situated in a way that explores their functional interiority.

God's Eye is a substrate of loosely coupled electromagnetic neighbors. Motion emerges through the complex systems dynamics of induction coils driving inner magnets which, in turn, affect neighboring magnets and their fields. Proximal inter-magnetic dynamics offer a new dimension of visual interpretation. This aggregation is bounded by a chaotic counter-balance between the forces of gravity and electromagnetism. Magnets are carefully positioned to allow them to simultaneously shape, share and influence each other's complex behavior of motion without clustering together. Through attraction, repulsion and proximal distance, this dynamic process creates an emergent field of hive-like motion.

A variable speed sine wave (2–10 Hz) is sent into copper coils creating a magnetic field which invisibly moves a magnetic ball placed inside each coil. Yet this magnetic response is constrained by force of gravity as each ball rolls in its own parabolic dish. One magnet's motion affects the motion of another in close proximity through the field disturbance created as the relative position of north and south poles of each magnet change with respect to one another. Users alter the frequency of the signal sent into the copper coils by placing their hand in varying proximity to the work.

Magnets are laterally constrained by rolling within the 'gravity well' of a curved dish. Yarn 'tails' visually amplify the magnetic inertial influence that magnets have on one another over longer distances.

<div class="exhibitions">
  <h3>Exhibitions</h3>
  <ul>
    <li>Giant Steps Art Exhibition, Seattle, WA, 2016</li>
    <li>Leonardo Art Science and Technology Festival, Stanford, CA, 2016</li>
    <li>CCL Science-Art Presentation at California Academy of the Arts Nightlife, 2015</li>
  </ul>
</div>
EOF

cat > src/content/projects/fire-ants.md << 'EOF'
---
title: "Fire Ants"
subtitle: "Magnetic Kinetic Sculpture"
meta: "2015"
year: 2015
status: archived
galleryFolder: "/images/fire-ants/"
---

"Fire Ants" are innately familiar to us through this sculptural embodiment, as a dense thicket of magnetic beads and wires in perpetual, semi-chaotic motion. Our visual sense attempts to layer notions of "character" and "behavior" onto inanimate objects, through the language of motion. Materials combined with shapes, texture, color and motion reminiscent of living biota create a natural setting for us to feel a relatable sense of animal kinship with inanimate objects. This work invites us to ponder our innate fears and phobias which can arise through certain representations of scale, texture and motion.

<div class="details-box">
  <h3>Composition</h3>
  <ul>
    <li>Two large magnets rotating inside a glass enclosure</li>
    <li>Subtle field changes effect the motion of smaller outer magnetic beads attached to fine silicone wire</li>
  </ul>
</div>
EOF

cat > src/content/projects/chatty-spring-ballz.md << 'EOF'
---
title: "Chatty Spring Ballz"
subtitle: "Kinetic Sound Sculpture"
meta: "2014"
year: 2014
status: archived
galleryFolder: "/images/chatty-spring-ballz/"
---

Chatty Spring Ballz + Piana Obscura were presented as a pair at the Megopolis Festival, SF, 2015.

<div class="exhibitions">
  <h3>Exhibitions</h3>
  <ul>
    <li>Megopolis Festival, SF, 2015</li>
    <li>Bay Area Maker Faire, San Mateo, CA, 2014</li>
    <li>Aeolian Day, Oakland, CA, 2014</li>
  </ul>
</div>
EOF

cat > src/content/projects/piana-obscura.md << 'EOF'
---
title: "Piana Obscura"
subtitle: "Sound Sculpture"
meta: "2013"
year: 2013
status: archived
galleryFolder: "/images/piana-obscura/"
---

Piana Obscura was presented at the Megopolis Festival, SF, 2015.

<div class="exhibitions">
  <h3>Exhibitions</h3>
  <ul>
    <li>Megopolis Festival, SF, 2015</li>
  </ul>
</div>
EOF

# ─── Static pages ──────────────────────────────────────────────

cat > src/pages/about.md << 'EOF'
---
layout: ../layouts/BaseLayout.astro
title: "About"
---

<div class="hero">
  <h1>About</h1>
  <p class="tagline">Cere Davis — Science | Art</p>
</div>

Cere Davis is a multidisciplinary artist and engineer based in Berkeley, CA. Her background includes work and studies in computer systems architecture, physics, and vocal improvisation. Her work freely crosses boundaries between playful laboratory experimentation and acousto-kinetic studies. Her current creations focus on interactive educational sculptures that viscerally demonstrate many subtle principles of physics through sonic means. Her works encourage the observer to explore their pre-conceptions of sound and movement.

## Education

- BS Physics, University of Alaska, Fairbanks, 1993

## Awards

- 2018 — Berkeley Civic Arts Grant
- 2018 — Awesome Award for Liquid Loom, Awesome Foundation SF Chapter
- 2015 — Voted Best Wind Sculpture at Thingamajigs Aeolian Day, Oakland, CA
- 1992 — McNair Scholars Program, University of Maine, Orono

## Selected Exhibitions

### Liquid Loom (2018)

- US Mutek Festival, Midway Gallery, SF, CA, 2019
- San Francisco Awesome Foundation, SF, 2018
- Leonardo/ISAST Convening & 50th Anniversary, San Francisco Art Institute, 2018
- Forms — Stanford University 200 year commemoration of Mary Shelley, 2018

### Water Organ (2017)

- Liquid Assets Water Organ featured with Thingamajigs Performance Group, San Jose Art Museum, CA, 2017
- Last Festival, San Jose, CA, 2017
- Dorkbot SF, SF, CA, 2017
- Manylabs, SF, CA, 2017
- Paseo Prototyping Festival, San Jose, CA, 2016

### God's Eye (2016)

- Giant Steps Art Exhibition, Seattle, WA, 2016
- Leonardo Art Science and Technology Festival, Stanford, CA, 2016
- CCL Science-Art Presentation at California Academy of the Arts Nightlife, 2015

### Piana Obscura / Chatty Spring Ballz (2013–2014)

- Megopolis Festival, SF, 2015
- Bay Area Maker Faire, San Mateo, CA, 2014
- Aeolian Day, Oakland, CA, 2014

## Residencies

- Chabot Space & Science Center AiR, December/January 2017/18
- Featured Artist/Resident with Thingamajigs Performance Group, Bay Area, CA, June 2017
- Science-Art Fellow and Curator at Manylabs, SF, CA, June 2016–Present
- "Make-It-Move" Moving Sculpture Residency, Minneapolis, MN, September 2016
- Artistic Director and Curator at Counter Culture Labs, Oakland, CA
- Animotion, the art of motion — Leonardo Art and Science LASER Lecture Series, May 2016

## Lectures

- On Creating 'Second Ecologies', Berkeley Public Library, 2019
- San Jose State University Laser Art-Science Lecture Series, 2019
- Reframing Human Affordances, Binary Salon 03 — Midway Gallery, SF, 2018
- Development of the Liquid Loom project — Awesome Foundation convening, SF, CA, 2018
- Science of Sound, Manylabs, SF, CA, 2017
- Kinetic Design Patterns Produced Through Motion — LASER Talks, UCSF, 2016
- The Art of Motion — LASER Talks, Berkeley, CA, April 2016
- Speaking panelist in SFMoma Open Space discussion on Open Spaces and Ownership, 2015
- Panel speaker at LAST Festival's Homo Digitalis lecture series, Stanford, CA, 2015

## Publications

- Instructables: Creating "Fire Ants", Moving Sculpture
- Editor of "Captaincy, a naval miniatures game for the age of sail" by John Carnahan
- Instructables: Creating Long Acousto-Kinetic "Reverb" Springs
- C M Davis and S. McNutt, Lightning Associated with the 1992 Eruptions of Mt. Spurr Volcano, Alaska. EOS, Trans American Geophysical Union. vol.74, no 43, supplement, p. 649
- C M Davis and S. McNutt, Volcanic Lightning at Mt. Spurr, 1992. Colima Volcano: Fourth International Meeting, Colima, Mexico. January 24 to 28, 1994, p.112, Abstracts Volume
- C Davis, G Seshaajyar, Jp McClymer, A Comparison of Micro-Viscosity to Shear Viscosity in Lyotropic Nematic Liquid Crystals. Bulletin of APS, v. 38, issue. 768 (1993)
- S R McNutt and C Davis, Lightning Associated with the 1992 Eruptions of Mt. Spurr Volcano, Alaska

## Contact

- [cere@ceredavis.com](mailto:cere@ceredavis.com)
- [LinkedIn](https://www.linkedin.com/in/ceredavis)
EOF

cat > src/pages/workshops.md << 'EOF'
---
layout: ../layouts/BaseLayout.astro
title: "Workshops"
---

<div class="hero">
  <h1>Workshops</h1>
  <p class="tagline">Hands-on workshops at the intersection of science and art.</p>
</div>

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
EOF

cat > src/pages/writing.md << 'EOF'
---
layout: ../layouts/BaseLayout.astro
title: "Writing"
---

<div class="hero">
  <h1>Writing</h1>
  <p class="tagline">Essays and notes.</p>
</div>

*Coming soon.*
EOF

cat > src/pages/research.md << 'EOF'
---
layout: ../layouts/BaseLayout.astro
title: "Research"
---

<div class="hero">
  <h1>Research</h1>
  <p class="tagline">Reservoir computing, neuromorphic systems, and hybrid computational strategies.</p>
</div>

## Computing

*Research notes and papers on reservoir computing, liquid state machines, and neuromorphic computing.*

[Computing →](/research/computing/)
EOF

cat > src/pages/research/computing.md << 'EOF'
---
layout: ../../layouts/BaseLayout.astro
title: "Computing"
---

<div class="hero">
  <h1>Computing</h1>
  <p class="tagline">Reservoir computing, neuromorphic systems, and hybrid computational strategies.</p>
</div>

## Research Notes

*Coming soon.*
EOF

# ─── Config files ──────────────────────────────────────────────

cat > .gitignore << 'EOF'
dist/
.astro/
node_modules/
.DS_Store
Thumbs.db
*.swp
*.swo
*~
EOF

cat > public/CNAME << 'EOF'
ceredavis.com
EOF

cat > .github/workflows/deploy.yml << 'EOF'
name: Deploy to GitHub Pages
on:
  push:
    branches: [main]
permissions:
  contents: read
  pages: write
  id-token: write
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: withastro/action@v3
      - uses: actions/configure-pages@v5
      - uses: actions/upload-pages-artifact@v4
        with:
          path: ./dist
  deploy:
    needs: build
    runs-on: ubuntu-latest
    environment:
      name: github-pages
    steps:
      - uses: actions/deploy-pages@v5
EOF

cat > README.md << 'EOF'
# ceredavis-astro

Astro website for ceredavis.com. Hosted on GitHub Pages.

## Quick start

    npm install
    npm run dev

Open http://localhost:4321 in your browser.

## Adding images

Put photos in public/images/project-name/. The Gallery component auto-generates
a scrollable photo deck from all images in that folder. Set the galleryFolder
frontmatter field in the project .md file to point to it.

## Adding a new project

Create a new .md file in src/content/projects/. Set status: featured to show
it on the homepage, or status: archived to put it in the older work section.

## Deploy

Push to GitHub. The GitHub Action in .github/workflows/deploy.yml builds and
deploys to GitHub Pages automatically. In repo Settings, Pages, Source, GitHub Actions.
EOF

# ─── Placeholder .gitkeep files for empty image dirs ───────────
for dir in public/images/liquid-loom public/images/water-organ public/images/gods-eye public/images/fire-ants public/images/chatty-spring-ballz public/images/piana-obscura; do
  touch "$dir/.gitkeep"
done

echo ""
echo "Done. Files created:"
find . -type f -not -path './node_modules/*' | sort | sed 's|^\./||'
echo ""
echo "Next:"
echo "  1. npm install"
echo "  2. npm run dev"
echo "  3. Open http://localhost:4321"
