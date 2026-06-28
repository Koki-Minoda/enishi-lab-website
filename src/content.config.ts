import { defineCollection } from "astro:content";
import { glob } from "astro/loaders";
import { z } from "zod";

const projects = defineCollection({
	loader: glob({ pattern: "**/*.{md,mdx}", base: "./src/content/projects" }),
	schema: z.object({
		title: z.string(),
		tagline: z.string(),
		description: z.string(),
		status: z.enum(["active", "beta", "development", "archived"]),
		category: z.string(),
		thumbnail: z.string().optional(),
		ogImage: z.string().optional(),
		websiteUrl: z.url().optional(),
		appStoreUrl: z.url().optional(),
		playStoreUrl: z.url().optional(),
		githubUrl: z.url().optional(),
		technologies: z.array(z.string()),
		featured: z.boolean().default(false),
		order: z.number(),
		publishedAt: z.coerce.date(),
	}),
});

export const collections = { projects };
