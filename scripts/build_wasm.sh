#!/bin/bash
#
# Builds the WebAssembly version of GaborFilter,
# to be used by the 'Run' page of the website.
#
# Requires Emscripten (em++) to be installed and activated.
#
# Usage:
#
#   ./scripts/build_wasm.sh
#
# Output: docs/app/gaborfilter_wasm.js and docs/app/gaborfilter_wasm.wasm

set -e

if [[ "$PWD" =~ scripts$ ]]; then
    echo "FATAL ERROR."
    echo "Please run the script from the project root. "
    echo "Present working director: $PWD"
    echo " "
    echo "Tip: like this"
    echo " "
    echo "  ./scripts/build_wasm.sh"
    echo " "
    exit 42
fi

mkdir -p docs/app

# gaborfilter.cpp relies on <cmath> and <stdexcept> being included
# transitively, which is not the case for Emscripten's libc++
em++ \
  -std=c++17 -O3 \
  -I. \
  -include cmath -include stdexcept \
  -sUSE_BOOST_HEADERS=1 \
  -sMODULARIZE=1 \
  -sEXPORT_NAME=createGaborFilterModule \
  -sALLOW_MEMORY_GROWTH=1 \
  -sEXPORTED_FUNCTIONS=_gabor_render,_gabor_suggest_sigma \
  -sEXPORTED_RUNTIME_METHODS=HEAPU8 \
  wasm/gaborfilter_wasm.cpp gaborfilter.cpp \
  -o docs/app/gaborfilter_wasm.js

echo "Created docs/app/gaborfilter_wasm.js and docs/app/gaborfilter_wasm.wasm"
