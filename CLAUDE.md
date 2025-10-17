# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Scripts_Factory is a research workspace for developing and managing experimental scripts for online psychology experiments. It follows a "factory pipeline" approach with three main stages:

1. **1_Templates**: Reusable experiment script templates (WCST, NfC Scale, Consent Forms)
2. **2_Packaging**: Combining and customizing templates for specific research projects
3. **3_Products**: Final, tested, deployable experiment scripts

The project uses **OpenSesame/OSWeb** for experiment design and **JATOS** for online deployment.

## Core Technologies

- **Experiment Development**: OpenSesame (`.osexp` files), OSWeb for web-based experiments
- **Deployment**: JATOS servers (MindProbe)
- **Analysis**: R/RStudio (project managed via `.Rproj`)
- **Scripting**: JavaScript (for web experiments), Python (for desktop OpenSesame), PowerShell
- **Version Control**: Git (excludes `__Media/` directory)

## Project Structure

```
0_settings/         # Guides, instructions, and workflow documentation
1_Templates/        # Reusable experiment templates
  ├── WCST/        # Wisconsin Card Sorting Test
  ├── NfC/         # Need for Cognition Scale (HTML forms)
  └── Consent/     # Consent form templates
2_Packaging/       # Experiment assembly workspace
3_Products/        # Final deployable experiments
__Media/           # Media files and assets (gitignored)
```

## Development Workflow

### Creating Templates (1_Templates)
- Templates should be modular and well-documented
- Use OpenSesame GUI or inline scripts (Python/JavaScript)
- HTML-based surveys use `inline_html` items (see NfC template)
- Templates don't need to be directly executable

### Packaging Experiments (2_Packaging)
- Select appropriate templates from `1_Templates`
- Combine and customize for specific research needs
- Create project-specific subdirectories for organization
- Document which templates were used and modifications made

### Finalizing Products (3_Products)
- Only fully tested, executable scripts go here
- Use version control for all scripts
- Include detailed documentation on execution and functionality

## OpenSesame & JATOS Integration

### Local Development
1. Design in OpenSesame GUI
2. Test locally in OpenSesame (desktop mode)
3. Preview with OSWeb (browser compatibility check)
4. Upload to JATOS via `Tools -> JATOS` in OpenSesame

### JATOS Setup
- **JATOS Server URL**: Configure in OpenSesame (e.g., `https://mindprobe.jatos.org/`)
- **API Key**: Required for uploading experiments (get from JATOS account settings)
- **Completion URL**: Third-party recruitment platform redirect URL

### Testing Protocol
1. Local test in OpenSesame
2. OSWeb browser preview
3. JATOS test link (don't waste worker slots)
4. Verify data export from JATOS Results page

## Key Configuration Files

- **Scripts_Factory.Rproj**: RStudio project configuration
- **.gitignore**: Excludes `__Media/` directory
- **0_settings/OSWEB_JATOS_prepare.md**: Comprehensive setup and deployment guide
- **GEMINI.md**: Google Gemini AI assistant instructions (if using Gemini CLI)

## Common Experiment Components

### OpenSesame Elements
- `sequence`: Experiment flow control
- `loop`: Trial repetition with variables
- `sketchpad`: Visual stimulus display
- `inline_script`: Custom Python/JavaScript code
- `logger`: Data recording
- `mouse_response`/`keyboard_response`: Input collection
- `inline_html`: Custom HTML forms for surveys

### OSWeb Limitations
- Not all Python libraries are supported
- Use JavaScript or OSWeb-compatible components for web deployment
- Refer to OSWeb documentation for supported features

## Data Management

### Exporting from JATOS
1. Login to JATOS server
2. Navigate to experiment → Results
3. Export Results (CSV/JSON)

### Analysis
- Use R scripts in RStudio project
- Automate preprocessing workflows
- Keep analysis scripts with raw data in project

## Important Considerations

- **Ethics**: Ensure IRB compliance, provide informed consent, protect participant privacy
- **Version Control**: Commit experiments at each stage (template → packaging → product)
- **Testing**: Always test through full pipeline (local → OSWeb → JATOS) before deployment
- **Documentation**: Each template should have README explaining functionality and usage
- **Git Workflow**: Main branch is typically used for PRs (currently on `working` branch)

## Troubleshooting

**OSWeb not working**: Check for unsupported Python libraries, rewrite with JavaScript or OSWeb components

**JATOS data loss**: Verify network connection, check `jatos.submitResultData()` syntax in scripts

**API upload fails**: Confirm JATOS server URL and API key validity

**HTML form submit button not continuing to next item in OSWeb/JATOS**:

This occurs when JavaScript event handlers (especially `e.preventDefault()`) block the natural form submission. OSWeb detects form submission via an `<input type="submit">` element and uses that to continue to the next experiment item.

**Solution**:
1. Change visible submit button to `type="button"` with an `onclick` handler
2. Add a hidden `<input type="submit">` element to the form
3. In the button's click handler:
   - Validate the form
   - Collect and store all data in OpenSesame `vars` object
   - Programmatically click the hidden submit input: `document.getElementById('hiddenSubmit').click()`

**Example**:
```html
<!-- Visible button -->
<button type="button" onclick="submitForm()">Submit</button>

<!-- Hidden submit for OSWeb -->
<input type="submit" id="hiddenSubmit" style="display: none;">

<script>
function submitForm() {
    // Validate and collect data
    if (typeof vars !== 'undefined') {
        vars.response = document.getElementById('myInput').value;
    }
    // Trigger OSWeb continuation
    document.getElementById('hiddenSubmit').click();
}
</script>
```

This separates data collection logic from OSWeb's form submission mechanism, allowing proper continuation to the next experiment item.

## Resources

- [OpenSesame Documentation](https://osdoc.cogsci.nl/)
- [OSWeb Guide](https://osdoc.cogsci.nl/4.1/manual/osweb/osweb/)
- [MindProbe JATOS](https://mindprobe.eu/)
- [Development Guide](https://scgeeker.github.io/Online_EXP/VibeJATOS.html)
- Repository: https://github.com/SCgeeker/Scripts_Factory
