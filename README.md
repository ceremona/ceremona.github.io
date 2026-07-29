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
