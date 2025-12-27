#!/bin/bash

BINARY_NAME="pdf-merge"
PLATFORMS=(
    "linux/386"           # 32-bit x86 Linux
    "linux/amd64"         # 64-bit x86_64 Linux
    "linux/arm"           # 32-bit ARM (Raspberry Pi, etc.)
    "linux/arm64"         # 64-bit AArch64 Linux
    "darwin/amd64"        # macOS Intel
    "darwin/arm64"        # Apple Silicon Macs (M1/M2)
    "windows/386"         # 32-bit Windows
    "windows/amd64"       # 64-bit Windows
    "windows/arm64"       # ARM64 Windows (Surface Pro X, etc.)
)

echo "Starting cross-compilation..."

for PLATFORM in "${PLATFORMS[@]}"; do
    OS=$(echo $PLATFORM | cut -d'/' -f1)
    ARCH=$(echo $PLATFORM | cut -d'/' -f2)

    OUTFILE="tmp/${BINARY_NAME}_${OS}_${ARCH}"

    if [[ "$OS" == "windows" ]]; then
        OUTFILE="${OUTFILE}.exe"
    fi

    echo "Building for $OS/$ARCH -> $OUTFILE"

    env GOOS=$OS GOARCH=$ARCH go build -o "$OUTFILE" main.go
done

echo "✅ All builds completed!"

