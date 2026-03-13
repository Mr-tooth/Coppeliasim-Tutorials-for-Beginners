## MATLAB Remote API Setup

The `remoteApi` binary is **not included** in this repository. You need to copy it from your local CoppeliaSim installation.

### Windows

```batch
copy "%COPPELIASIM_ROOT%\programming\remoteApiBindings\lib\lib\Windows\remoteApi.dll" .
```

### Linux

```bash
cp $COPPELIASIM_ROOT/programming/remoteApiBindings/lib/lib/Linux/remoteApi.so .
```

### macOS

```bash
cp $COPPELIASIM_ROOT/programming/remoteApiBindings/lib/lib/macOS/remoteApi.dylib .
```

> ⚠️ Make sure the binary version matches your CoppeliaSim version (v4.2.0 recommended).
