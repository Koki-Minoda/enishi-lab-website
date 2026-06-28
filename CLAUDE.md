# ENISHI-LAB Website — Claude Code Guide

## AI Behavior

AI Employeeとしての原則・ガバナンス・ロール定義は ENISHI-LAB-OS が Source of Truth。
このファイルはProject固有の技術的文脈のみを記載する。

## Project Context

- Framework: Astro 7.x (static output)
- Styling: Tailwind CSS v4 (`@theme` in `src/styles/global.css`)
- Language: TypeScript strict
- Linter/Formatter: Biome
- Package Manager: pnpm

## Development

Dev serverはbackgroundモードで起動する:

```
pnpm dev
```

stop/status/logsはAstro CLIで管理:

```
pnpm astro dev --help
```

## Key Docs

- Architecture: `docs/architecture/overview.md`
- Design System: `docs/design/system.md`
- ADR一覧: `docs/adr/`
- Bootstrap DoD: `docs/bootstrap-dod.md`

## Astro References

- [Routing](https://docs.astro.build/en/guides/routing/)
- [Components](https://docs.astro.build/en/basics/astro-components/)
- [Content Collections](https://docs.astro.build/en/guides/content-collections/)
- [Styling / Tailwind](https://docs.astro.build/en/guides/styling/)
