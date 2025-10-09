# GitHub Pages Deployment Notes

## Date: 2025-10-07

## Issues Encountered and Solutions

### 1. Images Not Displaying on GitHub Pages

**Problem**: PNG and other image files were not showing on the online slides at https://scgeeker.github.io/Scripts_Factory/

**Root Causes**:
1. **Spaces in filenames**: Image files had spaces (e.g., "In-site framework.png", "Crowdsourcing Framework.png")
2. **Jekyll ignoring underscore directories**: GitHub Pages uses Jekyll by default, which ignores all directories starting with underscore (like `Atlas/_Media/`)

**Solutions**:
1. **Renamed files**: Replaced spaces with underscores
   - `In-site framework.png` → `In-site_framework.png`
   - `Crowdsourcing Framework.png` → `Crowdsourcing_Framework.png`
   - `Pasted Image *.{png,jpg,svg}` → `Pasted_Image_*.{png,jpg,svg}`

2. **Updated HTML references**: Modified `index.html` to match new filenames

3. **Disabled Jekyll**: Added `.nojekyll` file to the gh-pages branch root to prevent Jekyll from processing files

### 2. GitHub Pages Setup

**Branch Structure**:
- `master`: Main project code (Scripts_Factory templates and experiments)
- `working`: Development branch
- `gh-pages`: Dedicated branch for hosting presentation slides

**Configuration**:
- Source: `gh-pages` branch, `/ (root)` folder
- URL: https://scgeeker.github.io/Scripts_Factory/

**Key Files on gh-pages**:
- `.nojekyll` - Disables Jekyll processing (CRITICAL for underscore directories)
- `index.html` - Main presentation file
- `Atlas/_Media/` - Image assets directory

## Best Practices for Future Updates

1. **Avoid spaces in filenames**: Use underscores or hyphens instead
2. **Always include `.nojekyll`**: When using directories starting with underscore
3. **Test deployment**: Wait 1-2 minutes after push for GitHub Pages to rebuild
4. **Check image URLs directly**: Test individual asset URLs to verify accessibility

## Relevant Commits

- `620a9b4` - Clean up RStudio session files (working branch)
- `e580b47` - Add workshop slides for GitHub Pages (gh-pages branch)
- `5630e02` - Fix image paths by removing spaces from filenames
- `36eaea2` - Add .nojekyll to disable Jekyll processing
