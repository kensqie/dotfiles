# Dotfiles

## Preview deployment

```sh
chezmoi -S . diff
```

## Deploy all

```sh
chezmoi -S . apply
```

## Deploy selectively

```sh
chezmoi -S . apply --recursive <target>
```
