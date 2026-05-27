---
description: "Use when creating a release, bumping the version, tagging, or publishing to GitHub. Covers version bump, commit, tag, push, and GitHub release steps."
---

# Release Flow

When creating a new release, follow these steps. Repo-specific details (which files hold the version, which build command to run) belong in the per-repo `copilot-instructions.md` or a repo-level `release.instructions.md` that overrides this one.

## 1. Determine version

- Use **patch** bump (e.g. 1.0.0 -> 1.0.1) for bug fixes, small enhancements, dependency updates, and refinements to existing features.
- Use **minor** bump (e.g. 1.0.1 -> 1.1.0) for significant new features or capabilities.
- Use **major** bump (e.g. 1.1.0 -> 2.0.0) for breaking changes.
- Always propose the recommended version and wait for explicit user confirmation before bumping.

## 2. Bump version

- Update every file that pins the version (e.g. `package.json`, `Cargo.toml`, theme stylesheet headers, `pyproject.toml`).
- Refresh lockfiles if the package manager touches them.

## 3. Build production assets

- Run the project's build command if release artefacts are committed (Vite, webpack, esbuild, etc.).
- Skip when the repo has no build step.

## 4. Create release commit

- Stage only the version-bump files and any built artefacts.
- Commit message: `chore: release v<version>`

## 5. Tag

- Create a **lightweight** tag (not annotated): `git tag v<version>`

## 6. Push

- Push commit and tag together: `git push origin <branch> --tags`
- Confirm with the user before pushing.

## 7. Create GitHub release

- Use `GH_PAGER=cat gh release create v<version> --title "v<version>" --notes "<notes>"`
- Release notes format (use sections that apply, omit empty ones):

```markdown
### Added
- Feature description

### Fixed
- Fix description

### Changed
- Change description
```

- Summarize commits since the last release tag. Group by category. Keep descriptions concise (one line each).
