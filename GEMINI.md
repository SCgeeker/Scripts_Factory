## Project Overview

This project is a workspace for developing and managing experimental scripts for research, with a focus on creating web-based experiments using OpenSesame and JATOS. The project is structured as a "factory pipeline" for creating experiment scripts, with templates for common psychological tasks.

Currently, the project contains templates for the following experiments:

*   **Wisconsin Card Sorting Test (WCST):** A neuropsychological test of set-shifting.
*   **Need for Cognition (NfC) Scale:** A questionnaire to measure the tendency for an individual to engage in and enjoy thinking.
*   **Consent Form:** A template for creating consent forms for online experiments.

The project is organized into the following directories:

*   `0_settings`: Contains project settings and guides.
*   `1_Templates`: Contains templates for experiment scripts.
*   `2_Packaging`: For combining and modifying templates to create a complete experiment.
*   `3_Products`: Contains the final, executable experiment scripts.

The goal of this project is to use an AI assistant to streamline the development process, from creating new templates to deploying experiments on JATOS.

## Key Technologies

*   **Experiment Development:** OpenSesame, OSWeb
*   **Web Technologies:** HTML, CSS, JavaScript
*   **Online Experiment Platform:** JATOS
*   **Scripting/Analysis:** R and RStudio
*   **Shell:** PowerShell

## Development Workflow

The development workflow is as follows:

1.  **Create a new template:** Create a new directory in the `1_Templates` directory for the new experiment.
2.  **Develop the experiment:** Use OpenSesame and the OSWeb tools to develop the experiment. For web-based questionnaires, you can use the `inline_html` item to create the form and the questions.
3.  **Package the experiment:** Use the `2_Packaging` directory to combine and modify templates to create a complete experiment.
4.  **Test the experiment:** Test the experiment locally in OpenSesame and in a web browser.
5.  **Deploy to JATOS:** Use the JATOS integration in OpenSesame to deploy the experiment to a JATOS server.
6.  **Test on JATOS:** Test the experiment on the JATOS server to ensure that it works correctly and that the data is being saved.
7.  **Finalize the product:** The final, executable experiment script is stored in the `3_Products` directory.


## AI Agent Interaction

To interact with the AI agent, add a to-do item to the `__Media/AI prompts.md` file. The AI agent will automatically detect new to-do items and execute them. When a task is complete, the AI agent will mark it as done.

## Git and GitHub

The project is under Git version control. The `__Media` directory is excluded from version control via the `.gitignore` file.