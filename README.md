# 💤 LazyVim

## Treesitter on Jetson / aarch64 Linux (GLIBC mismatch)

On Jetson boards (JetPack/L4T Ubuntu, e.g. 20.04 with glibc 2.31 or 22.04 with
glibc 2.35), Treesitter parser installs can fail with:

```
error: during tree sitter build: tree-sitter /lib/aarch64-linux-gnu/libc.so version GLIBC_2.39 not found
```

This happens because Mason's `tree-sitter-cli` package downloads a prebuilt
`linux-arm64` binary built against a newer glibc than the Jetson ships. The
fix is to build `tree-sitter-cli` from source with Cargo so it links against
the system's actual glibc:

```bash
sudo apt update && sudo apt install -y build-essential clang libclang-dev pkg-config
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"

cargo install tree-sitter-cli
```

Then in Neovim:
- Remove `tree-sitter-cli` from Mason's `ensure_installed` (or run
  `:MasonUninstall tree-sitter-cli`) so Mason doesn't overwrite the
  Cargo-built binary on a future update.
- Make sure `~/.cargo/bin` comes before Mason's bin dir on `$PATH`.
- Run `:TSUpdate` to rebuild parsers with the working CLI.
