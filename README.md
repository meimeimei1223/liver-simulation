# 🫀 Liver Soft-Body Simulation

Real-time soft-body physics simulation of a liver using XPBD (Extended Position Based Dynamics) running in the browser via WebAssembly.

## 🎮 Live Demo

**[Try it now!](https://meimeimei1223.github.io/)**

## ✨ Features

- **Real-time Physics**: XPBD-based soft-body simulation
- **Interactive**: Grab and drag the liver with your mouse
- **WebAssembly**: High-performance C++ physics compiled to WASM
- **WebGL Rendering**: Hardware-accelerated 3D graphics
- **Cross-platform**: Works on any modern browser (Chrome, Firefox, Edge, Safari)

## 🎯 Controls

| Input | Action |
|-------|--------|
| Left Drag (empty space) | Rotate camera |
| Left Click (on mesh) | Grab and drag |
| Mouse Wheel | Zoom in/out |
| F1 | Toggle wireframe |
| F2 | Reset shape |

## 🛠️ Technology Stack

- **Physics Engine**: Custom XPBD solver (C++)
- **Compilation**: Emscripten (C++ → WebAssembly)
- **Rendering**: WebGL 1.0

## 📄 License

MIT License
