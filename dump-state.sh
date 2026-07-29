#!/bin/bash
# Run this from your project root (ceredavis-astro/)
# Dumps only source files — config, layouts, components, pages, content

OUTPUT="site-state.txt"

cat > "$OUTPUT" << 'HEADER'
═══════════════════════════════════════════════════════════════
  CEREDAVIS-ASTRO — SOURCE FILES ONLY
  Generated: $(date)
═══════════════════════════════════════════════════════════════

HEADER

# Only dump these specific files and directories
for file in \
  package.json \
  astro.config.mjs \
  tsconfig.json \
  src/content.config.ts \
  src/layouts/BaseLayout.astro \
  src/components/Video.astro \
  src/components/Gallery.astro \
  src/components/SoundCloud.astro \
  src/pages/index.astro \
  src/pages/projects/index.astro \
  "src/pages/projects/art/[...slug].astro" \
  src/pages/about.md \
  src/pages/workshops.md \
  src/pages/writing/index.astro \
  "src/pages/writing/[...slug].astro" \
  src/pages/technical.md \
  src/pages/technical/computing.md \
  .github/workflows/deploy.yml \
  .gitignore \
  public/CNAME \
  README.md
do
  if [ -f "$file" ]; then
    echo "" >> "$OUTPUT"
    echo "───────────────────────────────────────────────────────────" >> "$OUTPUT"
    echo "FILE: $file" >> "$OUTPUT"
    echo "───────────────────────────────────────────────────────────" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
    cat "$file" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
  fi
done

# Dump all content files (projects and writing) — use find for these
find src/content -name '*.md' -type f | sort | while read -r file; do
  echo "" >> "$OUTPUT"
  echo "───────────────────────────────────────────────────────────" >> "$OUTPUT"
  echo "FILE: $file" >> "$OUTPUT"
  echo "───────────────────────────────────────────────────────────" >> "$OUTPUT"
  echo "" >> "$OUTPUT"
  cat "$file" >> "$OUTPUT"
  echo "" >> "$OUTPUT"
done

# List what's in public/images (just filenames, not contents)
echo "" >> "$OUTPUT"
echo "═══════════════════════════════════════════════════════════════" >> "$OUTPUT"
echo "  IMAGE FILES (filenames only)" >> "$OUTPUT"
echo "═══════════════════════════════════════════════════════════════" >> "$OUTPUT"
echo "" >> "$OUTPUT"
find public/images -type f -name '*.jpg' -o -name '*.png' -o -name '*.jpeg' -o -name '*.gif' -o -name '*.webp' 2>/dev/null | sort >> "$OUTPUT"
echo "" >> "$OUTPUT"

LINES=$(wc -l < "$OUTPUT")
echo ""
echo "Done. $LINES lines written to $OUTPUT"
