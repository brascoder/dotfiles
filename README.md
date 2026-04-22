# dotfiles

Personal macOS dotfiles managed with [RCM](https://github.com/thoughtbot/rcm).

## Installation

```bash
brew install rcm
git clone https://github.com/brasco/dotfiles ~/.dotfiles
rcup -d ~/.dotfiles
```

## Neovim

### Prerequisites

```bash
brew install neovim ripgrep fd node
xcode-select --install
```

- `ripgrep` and `fd` are required by Telescope for live grep and file finding
- `node` is required by `typescript-language-server`, `tailwindcss-language-server`, `emmet-ls`, and `eslint-lsp`
- Xcode Command Line Tools provide the C compiler required to build Tree-sitter parsers

Ensure Ruby is available in your `$PATH` (via asdf, rbenv, or system Ruby) — required by `solargraph`.

Install the [Claude Code](https://claude.ai/code) CLI.

### Elixir LSP (Expert)

[Expert](https://github.com/elixir-lang/expert) is the official Elixir language server. Download the pre-built binary for your architecture from the [releases page](https://github.com/elixir-lang/expert/releases) and place it in your `$PATH`:

```bash
# Example — adjust filename for your architecture
curl -L https://github.com/elixir-lang/expert/releases/latest/download/expert-macos-arm64 \
  -o ~/.local/bin/expert
chmod +x ~/.local/bin/expert
```

### Flutter / Dart

Install the [Flutter SDK](https://docs.flutter.dev/get-started/install/macos) and ensure the `dart` and `flutter` binaries are in your `$PATH`. The Dart LSP is managed automatically by [flutter-tools.nvim](https://github.com/akinsho/flutter-tools.nvim).

### First launch

On first launch, Neovim will automatically:

1. Bootstrap [Lazy.nvim](https://github.com/folke/lazy.nvim) and install all plugins
2. Install Tree-sitter parsers for all configured languages
3. Install LSP servers and formatters via Mason:
   - `lua-language-server`
   - `solargraph` (Ruby)
   - `typescript-language-server`
   - `tailwindcss-language-server`
   - `emmet-ls`
   - `eslint-lsp`
   - `efm` (Elixir linting via `mix credo`)
   - `prettier`

Run `:checkhealth` to verify everything is set up correctly.
