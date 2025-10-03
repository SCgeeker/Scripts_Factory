# Scripts Factory: A Project for Creating and Managing Experimental Scripts
# 腳本工廠：一個用於建立與管理實驗腳本的專案

This project is a workspace for developing and managing experimental scripts for research, with a focus on using OpenSesame and JATOS for online experiments. It is designed to be used with an AI assistant to streamline the development process.
本專案是一個用於開發和管理研究用實驗腳本的工作空間，重點在於使用 OpenSesame 和 JATOS 進行線上實驗。它被設計為與 AI 助理一同使用，以簡化開發流程。

## Getting Started (開始使用)

To get started with this project, follow these steps:
若要開始使用本專案，請遵循以下步驟：

1.  **Familiarize yourself with the project structure:** The project is organized as a "factory pipeline" for creating experiment scripts. The main directories are:
    **熟悉專案結構:** 本專案以「工廠流水線」的概念組織，用於建立實驗腳本。主要目錄包括：
    *   `0_settings`: Contains project settings, guides, and to-do lists. (包含專案設定、指南和待辦事項清單)
    *   `1_Templates`: Contains templates for experiment scripts. (包含實驗腳本的模板)
    *   `2_Packaging`: For combining and modifying templates to create a complete experiment. (用於組合和修改模板以建立完整的實驗)
    *   `3_Products`: Contains the final, executable experiment scripts. (包含最終可執行的實驗腳本)
    *   `__Media`: For storing media files and other assets. (用於儲存媒體檔案和其他資產) <專案模板不提供此項>

2.  **Review the preparation guide:** The `0_settings/OSWEB_JATOS_prepare.md` file provides a comprehensive guide to setting up your environment and understanding the workflow for creating and deploying online experiments with OpenSesame and JATOS.
    **查閱準備指南:** `0_settings/OSWEB_JATOS_prepare.md` 檔案提供了設定環境、理解使用 OpenSesame 和 JATOS 建立與部署線上實驗工作流程的全面指南。

3.  **Check the to-do list:** The `AI prompts.md` file contains the to-do list for the project. Review this file to see the current tasks and add new tasks as needed.
    **檢查待辦事項清單:** `AI prompts.md` 檔案包含本專案的待辦事項清單。請查閱此檔案以檢視目前任務，並視需要新增任務。<專案模板不提供此項>

## Resources (資源)

*   **Preparation Guide (準備指南):** `0_settings/OSWEB_JATOS_prepare.md`
*   **To-Do List (待辦事項清單):** `__Media/AI prompts.md`
*   **Instructional Files (說明檔案):** The `0_settings` directory contains instructional files for each stage of the script factory pipeline. ( `0_settings` 目錄包含腳本工廠流水線各階段的說明檔案)

## AI Agent Setup (AI 代理程式設定)

This project is designed to be used with an AI assistant. To set up the AI assistant, you will need to:
本專案設計為與 AI 助理一同使用。若要設定 AI 助理，您需要：

1.  **Install the gemini CLI:** Follow the instructions in this [tutorial by Auden](https://codelove.tw/@tony/post/qvpDJ3) to install and configure the gemini CLI.
    **安裝 gemini CLI:** 遵循此 [Auden 的教學](https://codelove.tw/@tony/post/qvpDJ3) 中的說明來安裝和設定 gemini CLI。

2.  **Grant permissions:** The AI assistant needs permission to manage the files in this project.
    **授予權限:** AI 助理需要權限來管理本專案中的檔案。

## Communicating with the AI Agent (與 AI 代理程式溝通)

To communicate tasks to the AI agent, add your description as a to-do item to the to-do list in the `AI prompts.md` file. Use the following format to describe the tasks you need the agent to perform:
若要向 AI 代理程式傳達任務，請將你的描述以待辦事項的格式，新增至 `AI prompts.md` 的待辦事項清單。請使用以下格式的描述需要代理AI進行的事項：

```markdown
-[ ] Your to-do item description
```

The AI agent will automatically detect new to-do items and execute them. When a task is complete, the AI agent will mark it as done by changing `-[ ]` to `-[x]`.
AI 代理程式將自動偵測新的待辦事項並執行它們。任務完成後，AI 代理程式會將 `-[ ]` 變更為 `-[x]` 來標示為完成。

## Pre-requirements (先決條件)

*   R & Rstudio (latest version)
*   Powershell (WIN)
*   [Node.js](https://nodejs.org/en/download)
*   google account (with google one authority)
*   OpenSesame
*   JATOS servers accounts (cortex, mindprobe)
