# Whitmore Science

Hugo source for [www.whitmorescience.com](https://www.whitmorescience.com/). The site uses the customized `hugo-academic-group` theme developed for Icy Seas Co-Laboratory.

## Local development

The theme is vendored in this repository, so no submodule setup is required. Start the local preview with:

```sh
./scripts/demo-sites.sh
```

The launcher listens on all network interfaces and prints local, LAN, and VPN URLs. Its defaults can be changed with `HUGO_DEMO_PORT`, `HUGO_DEMO_BIND`, `HUGO_DEMO_HOST`, and `HUGO_DEMO_VPN_HOST`.

A production-style build is:

```sh
hugo --minify --panicOnWarning --cleanDestinationDir
```

Generated output is written to `public/` and is not committed.

## Content

- `content/_index.md` — home page
- `content/research.md` — research themes, programs, and recent projects
- `content/fieldwork.md` — sea-going and field experience
- `content/publications.md` — selected peer-reviewed publications
- `content/about.md` — biography
- `content/contact.md` — email, addresses, shipping guidance, and professional profiles
- `content/projects/` — project landing page and editable individual project pages
- `content/proposals.md` — funded and unfunded proposals with linked research outcomes

Full-resolution source photographs live in `assets/images/`. Hugo generates responsive WebP variants and compressed JPEG fallbacks during each build. The subpage hero uses `assets/images/hero-subpages.jpg`, a deliberate duplicate of the homepage photograph that can be edited independently.

Original Whitmore Science logo files are preserved in `static/brand/`. The navigation uses the horizontal logo on wide screens, the 100-pixel-tall compact mark at tablet widths, and a smaller compact mark on mobile. The footer uses the original LMW Oceanography mark.

## GitHub Pages

Pushing to `main` runs `.github/workflows/hugo.yml`, builds the site with the production URL, and deploys the generated `public/` directory through GitHub Pages.

The repository includes `static/CNAME` for `www.whitmorescience.com`. Configure that custom domain in the repository's Pages settings and point its DNS records to GitHub Pages before retiring the WordPress deployment.
