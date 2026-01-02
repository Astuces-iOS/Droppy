---
description: Release a new version of Droppy
---

# Droppy Release Workflow

Follow these steps when releasing a new version of Droppy.

## Prerequisites
- All code changes committed and pushed to `main`
- Version number updated in Xcode project

## Steps

1. **Build the Release**
   ```bash
   cd /Users/jordyspruit/Desktop/Droppy
   DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer xcodebuild -scheme Droppy -configuration Release -derivedDataPath ./build
   ```

// turbo
2. **Create the DMG**
   ```bash
   rm -f Droppy.dmg && mkdir -p dmg_root && cp -R build/Build/Products/Release/Droppy.app dmg_root/ && ln -s /Applications dmg_root/Applications && hdiutil create -volname Droppy -srcfolder dmg_root -ov -format UDZO Droppy.dmg && rm -rf dmg_root build
   ```

// turbo
3. **Get the SHA256 hash**
   ```bash
   shasum -a 256 Droppy.dmg
   ```

4. **Update Casks/droppy.rb with the new SHA256**

5. **Commit and push changes**
   ```bash
   git add . && git commit -m "Release vX.X" && git push
   ```

6. **Create a GitHub Release**
   - Go to https://github.com/iordv/Droppy/releases/new
   - Tag: `vX.X` (e.g., `v1.1`)
   - Title: `Droppy vX.X`
   - Description: List what's new in this release
   - **Attach the Droppy.dmg file**
   - Click "Publish release"

7. **Update the Homebrew tap**
   ```bash
   cd /Users/jordyspruit/Desktop/homebrew-tap && cp /Users/jordyspruit/Desktop/Droppy/Casks/droppy.rb Casks/ && git add . && git commit -m "Update to vX.X" && git push
   ```

## Notes
- The auto-update feature checks GitHub releases, so users will be notified when a new release is published
- Make sure to attach the DMG to the GitHub release (not just commit it to the repo)
