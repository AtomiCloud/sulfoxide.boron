---
id: commit-conventions
title: Commit Conventions
---
This project uses [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/) loosely as the specification
for our commits.

Commit message will be in the format:

```
type(scope): title

body
```

This page will document the types and scopes used.

# Types

| Type                  | Description                                         |
| --------------------- | --------------------------------------------------- |
| [upstream](#upstream) | Changes from dependencies upstream                  |
| [config](#config)     | Changes to configuration files and scripts          |
| [release](#release)   | Initiate a release (machine initiated)              |
| [docs](#docs)         | Documentation only changes                          |
| [feat](#feat)         | A new feature                                       |
| [action](#action)     | Imperative action, mainly changing the values files |
| [fix](#fix)           | A bug fix                                           |
| [chore](#chore)       | Menial Tasks                                        |

## upstream

Changes from dependencies upstream

| **V.A.E**       | V.A.E values                                                                          |
| --------------- | ------------------------------------------------------------------------------------- |
| verb            | update upstream                                                                       |
| application     | when this commit is applied, it will _update upstream_ `<scope>, <title>`             |
| example         | upstream(mysql): from v5.7 to v8.0                                                    |
| example applied | when this commit is applied, it will _update upstream_ `mysql`, **from v5.7 to v8.0** |

| Scope   | Description                               | Bump    |
| ------- | ----------------------------------------- | ------- |
| default | Generic update from upstream dependencies | `minor` |

## config

Changes to configuration files and scripts

| **V.A.E**       | V.A.E values                                                                            |
| --------------- | --------------------------------------------------------------------------------------- |
| verb            | configure                                                                               |
| application     | when this commit is applied, it will _configure_ `<scope> to <title>`                   |
| example         | config(ci): setup nix before executing                                                  |
| example applied | when this commit is applied, it will _configure_ `ci` to **setup nix before executing** |

| Scope    | Description                                                                  | Bump  |
| -------- | ---------------------------------------------------------------------------- | ----- |
| default  | Updates the configuration of the repository, not related to the other scopes | `nil` |
| `lint`   | Add, update or remove linters                                                | `nil` |
| `fmt`    | Add, updatge or remove formatters                                            | `nil` |
| `build`  | Add, update or change build pipelines and generators                         | `nil` |
| `nix`    | Add, update or change nix shell                                              | `nil` |
| `env`    | Add, update or change environment                                            | `nil` |
| `ignore` | Add, update or change ignore configurations                                  | `nil` |
| `ci`     | Add, update or change CI configuration files                                 | `nil` |

## release

Initiate a release (machine initiated)

| Scope   | Description               | Bump  |
| ------- | ------------------------- | ----- |
| default | Machine initiated release | `nil` |

## docs

Documentation only changes

| **V.A.E**       | V.A.E values                                                                                                 |
| --------------- | ------------------------------------------------------------------------------------------------------------ |
| verb            | add                                                                                                          |
| application     | when this commit is applied, it will _add_ `<scope> documention <title>`                                     |
| example         | docs(developer): on how to install dependency packages                                                       |
| example applied | when this commit is applied, it will _add_ `developer` documention **on how to install dependency packages** |

| Scope   | Description                       | Bump  |
| ------- | --------------------------------- | ----- |
| default | Update generic documentation file | `nil` |

## feat

A new feature

| **V.A.E**       | V.A.E values                                                            |
| --------------- | ----------------------------------------------------------------------- |
| verb            | add                                                                     |
| application     | when this commit is applied, it will _add_ `<scope> <title>`            |
| example         | feat(rapid): new withdraw api                                           |
| example applied | when this commit is applied, it will _add_ `rapid` **new withdraw api** |

| Scope   | Description            | Bump    |
| ------- | ---------------------- | ------- |
| default | Release a new features | `minor` |

## action

Imperative action, mainly changing the values files

| Scope   | Description                                         | Bump  |
| ------- | --------------------------------------------------- | ----- |
| default | Imperative action, mainly changing the values files | `nil` |

## fix

A bug fix

| **V.A.E**       | V.A.E values                                                         |
| --------------- | -------------------------------------------------------------------- |
| verb            | fix                                                                  |
| application     | when this commit is applied, it will _fix_ `<title>`                 |
| example         | fix(rapid): deposit api for rapid                                    |
| example applied | when this commit is applied, it will _fix_ **deposit api for rapid** |

| Scope   | Description   | Bump    |
| ------- | ------------- | ------- |
| default | Generic fixes | `patch` |

## chore

Menial Tasks

| Scope   | Description  | Bump  |
| ------- | ------------ | ----- |
| default | Menial Tasks | `nil` |

# Special Scopes

| Scope        | Description                    | Bump  |
| ------------ | ------------------------------ | ----- |
| `no-release` | Prevent release from happening | `nil` |
