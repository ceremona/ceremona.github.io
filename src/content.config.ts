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
    soundcloudUrl: z.string().optional(),
    galleryFolder: z.string().optional(),
  }),
});

const writing = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/writing' }),
  schema: z.object({
    title: z.string(),
    date: z.string(),
    summary: z.string().optional(),
    source: z.enum(['original', 'substack', 'medium', 'blogger']).default('original'),
    canonicalUrl: z.string().optional(),
    tags: z.array(z.string()).default([]),
  }),
});

export const collections = { projects, writing };
