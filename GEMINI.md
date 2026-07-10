# SWAT+ Local Development Workspace

This is the root directory for SWAT+ development, learning, and experimentation. It contains the official source code, local build projects, and space for demos or debugging.

## 📁 Workspace Structure

- **`SRC_GitHub_Repository/`**: The official SWAT+ source code cloned from GitHub.
  - Contains the `src/` directory with `.f90` files.
  - Managed via CMake for command-line builds and testing.
  - See `SRC_GitHub_Repository/GEMINI.md` for detailed model architecture and build instructions.
- **`VSProj/`**: Local Visual Studio projects.
  - Used for debugging with the Intel Fortran compiler and Visual Studio 2026.
  - Ideal for step-by-step code execution and logic verification.
- **`Demos/` (Planned)**: Placeholder for running specific SWAT+ demos or case studies.
- **`Debug/` (Planned)**: Placeholder for isolated bug reproduction or experimental code changes.

## 🛠️ Development & Debugging Workflows

### **1. Command Line (CMake)**
Use the `SRC_GitHub_Repository` for standard builds and running the built-in scenario tests. This is the primary way to verify that new functions don't break existing logic.

### **2. Visual Studio (Intel Fortran)**
Use the `VSProj/SWAT` project for deep debugging.
- **Purpose:** Set breakpoints, inspect variables, and trace the simulation flow.
- **Linking:** Ensure the source files in `VSProj` are linked or copied from `SRC_GitHub_Repository/src` to keep them in sync.

### **3. Running Demos**
When running a demo:
1. Create a subfolder under a new `Demos/` directory.
2. Copy the necessary input files (usually from a reference scenario in `data/`).
3. Point the SWAT+ executable (built via CMake or VS) to this input folder.

## 📝 General Notes
- **Source of Truth:** Always treat the files in `SRC_GitHub_Repository/src` as the primary source code.
- **Local Changes:** For temporary experiments or debugging, prefer creating a separate folder to avoid polluting the main repository.
