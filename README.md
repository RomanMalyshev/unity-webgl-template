# 🧱 Unity Project Setup & CI/CD Notes

This document contains setup steps, project configuration, and dependency notes for the Unity project.

---

## ⚙️ CI/CD Pipeline (GameCI + WSL)

### 1. Install WSL
Install **WSL** (Windows Subsystem for Linux) from the Microsoft Store.

### 2. Configure Ubuntu Environment
Follow the official GameCI setup guide:  
🔗 [Host Provisioning - Ubuntu Setup](https://game.ci/docs/self-hosting/host-provisioning/ubuntu-setup)

After installation:
- Create a new user for the build agent.
- Grant required permissions for GitHub Actions runner.

### 3. Configure Unity License & Secrets
> **TODO**: Add your Unity license activation and project secrets here.  
Include:
- `UNITY_LICENSE` (Base64)
- `ITCH_API_KEY`
- `PROJECT_NAME`

---

## 🏗️ Unity Project Settings

### General Settings
- **Disable Scene and Domain Reload** (to speed up play mode iteration)
- **WebGL Build Settings** — review publishing target and compression options.

### Performance Tips
- Remove unused Unity modules (see below).
- Use incremental GC and script compilation caching where possible.

---

## 📦 Additional Packages

| Package | Purpose |
|----------|----------|
| Hot Reload | Enables live code iteration without domain reload |
| MCP + Cursor IDE | AI-assisted coding and testing layer - [CoplayDev/unity-mcp](https://github.com/CoplayDev/unity-mcp) |

---

## 🧹 Disabled Unity Modules

These modules were manually removed to reduce build size and memory footprint:

```json
"com.unity.modules.video": "1.0.0",
"com.unity.modules.vr": "1.0.0",
"com.unity.modules.wind": "1.0.0",
"com.unity.modules.xr": "1.0.0",
"com.unity.modules.unityanalytics": "1.0.0",
"com.unity.modules.cloth": "1.0.0"
