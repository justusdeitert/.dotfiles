# Common pitfalls

- ISO 8601 timestamps do NOT sort lexicographically the same as chronologically when timezone offsets differ (e.g. `2026-04-12T15:25:07Z` vs `2026-04-12T17:22:31+02:00`). Always parse to epoch (Date.parse / getTime) before ordering or comparing.
- Sass + Vite (LightningCSS/PostCSS) silently drops `@container` rules nested inside `&` BEM modifier selectors. Only the first container query at the top of a block survives compilation. Workaround: keep `@container` queries at the top level of the file with explicit selectors instead of nesting them inside `&--modifier`.
- CSS container queries: an element with `container-type` cannot query its own size — only DESCENDANTS can. If you need to style element X based on X's own width, you must wrap X in a parent and put `container-type` on the parent. Easy to overlook because the `@container` rule compiles fine, it just silently never matches.
