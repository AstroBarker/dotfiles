# Bash Configuration

This package installs `~/.bashrc` and supporting Bash modules under
`~/.config/bash/`. The main `.bashrc` is intentionally small: it only checks
that the shell is interactive Bash, defines a safe source helper, and loads the
module files in order.

## Load Order

Modules are sourced in this order:

```text
history -> prompt -> functions -> ssh -> aliases -> completions -> projects -> toolchains -> local
```

The order matters. General functions load before modules that use them, and
aliases load after function definitions to avoid Bash alias-expansion surprises
when re-sourcing an existing shell.

## Module Guide

- `history`: readline bindings and history behavior.
- `prompt`: prompt colors, virtualenv display, and git branch integration.
- `functions`: reusable shell helpers such as `extract`.
- `ssh`: SSH agent setup.
- `aliases`: interactive command aliases.
- `completions`: optional integrations such as `fzf`.
- `projects`: project environment variables, and
  project-specific `PYTHONPATH` entries.
- `toolchains`: compiler and toolchain setup functions.
- `local`: machine settings such as private SSH aliases or editor choices.

## Tracked and Local Files

Tracked examples document expected local customization:

```text
~/.config/bash/projects.example
~/.config/bash/toolchains.example
~/.config/bash/local.example
```

Copy an example to the corresponding local file and edit it:

```sh
cp ~/.config/bash/toolchains.example ~/.config/bash/toolchains
```

The real `projects`, `toolchains`, and `local` files are ignored by git so
machine-specific paths, hostnames, and credentials stay out of the repository.

## Validation

After edits, run:

```sh
shellcheck bash/.bashrc bash/.config/bash/*
bash -n bash/.bashrc bash/.config/bash/*
stow -n -v bash
```
