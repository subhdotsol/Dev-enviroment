# macOS only.

[ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# LLVM from Homebrew (libclang for bindgen)
if command -v brew >/dev/null && [ -d "$(brew --prefix llvm 2>/dev/null)/lib" ]; then
  export LIBCLANG_PATH="$(brew --prefix llvm)/lib"
fi

# clang defaults to the newest MacOSX SDK (27.0), whose libSystem.B.tbd lacks
# the arm64-macos arch and breaks native C/C++ linking. Pin the 26.5 SDK when
# it is installed; set SDKROOT in ~/.zshrc.local to override.
if [ -z "${SDKROOT:-}" ] && [ -d /Library/Developer/CommandLineTools/SDKs/MacOSX26.5.sdk ]; then
  export SDKROOT=/Library/Developer/CommandLineTools/SDKs/MacOSX26.5.sdk
fi

path_prepend "$HOME/.antigravity/antigravity/bin"
[ -x "$HOME/.cache/solana/v1.52/platform-tools/llvm/bin/llvm-objdump" ] &&
  alias sbpf-objdump="$HOME/.cache/solana/v1.52/platform-tools/llvm/bin/llvm-objdump"
