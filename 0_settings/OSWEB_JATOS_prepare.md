# OSWEB & JATOS 專業人員訓練手冊

本手冊旨在為專業研究人員提供一個完整的指引，從實驗設計、腳本開發、到線上部署與資料分析，全面掌握使用 OpenSesame (OSWeb) 與 JATOS 進行線上實驗的流程。使用本手冊進行學習時，建議搭配[開發指南](https://scgeeker.github.io/Online_EXP/VibeJATOS.html)。

## 1. 核心概念與工作流程 (Core Concepts & Workflow)

線上實驗的生命週期包含以下幾個階段：

1.  **實驗設計 (Experiment Design):** 在 OpenSesame 中設計實驗流程、刺激材料與變項。
2.  **腳本開發 (Scripting):** 使用 OpenSesame 的圖形化介面或 Python/JavaScript 編寫腳本。
3.  **本機測試 (Local Testing):** 在本機端進行完整測試，確保實驗流程與邏輯正確。
4.  **網頁預覽 (OSWeb Preview):** 預覽為 OSWeb 網頁格式，確保在瀏覽器中能正常運作。
5.  **JATOS 部署 (JATOS Deployment):** 將實驗上傳至 JATOS 伺服器。
6.  **線上測試 (Online Testing):** 透過 JATOS 提供的連結進行最終測試。
7.  **受試者招募 (Participant Recruitment):** 發放實驗連結給受試者。
8.  **資料收集與分析 (Data Collection & Analysis):** 從 JATOS 下載資料，並使用 R/Python 等工具進行分析。

**強烈建議**使用 Git 對您的實驗腳本進行版本控制，以便追蹤修改歷史與團隊協作。

## 2. 環境設定 (Environment Setup)

### 2.1. 核心工具 (Core Tools)

- **OpenSesame:** [官方文件](https://osdoc.cogsci.nl/)
    - **定義:** 問卷及實驗腳本設計工具，屬於“發包管理模組”。
    - **說明:** 用於建立心理學、神經科學及實驗經濟學的桌面及線上實驗。
- **JATOS:** [MindProbe 伺服器](https://mindprobe.eu/)
    - **定義:** 遠端部署管理工具，屬於“發包管理模組”。
    - **說明:** 用於管理及寄存線上實驗，可與 OpenSesame/OSWeb、jsPsych 等工具整合。

### 2.2. 輔助工具 (Auxiliary Tools)

- **R & RStudio:** [官方網站](https://www.r-project.org/)
    - **定義:** 與“問卷及實驗腳本設計工具”串連的研究專案介面。
    - **說明:** 強烈建議使用 RStudio Project 來管理您的實驗，整合腳本、資料與分析報告。
- **gemini CLI:**
    - **定義:** 與“問卷及實驗腳本設計工具”串連的 AI 平台。
    - **說明:** 可用於輔助腳本開發、除錯與文件撰寫。

## 3. 軟體安裝與設定 (Software Installation & Configuration)

### 3.1. 安裝 OpenSesame

- **步驟:** 從 [OpenSesame 官網](https://osdoc.cogsci.nl/4.1/download/)下載並安裝最新版本。
- **最佳實踐:**
    - 熟悉 OpenSesame 的介面與核心概念 (e.g., `sequence`, `loop`, `sampler`)。
    - 學習使用 `logger` 元件來記錄所有您需要的變項。

### 3.2. 建立 JATOS 帳號

- **步驟:** 在 [MindProbe](https://mindprobe.eu/) 或其他 JATOS 伺服器上建立研究帳號。
- **注意:** MindProbe 為免費服務，但有使用條款與限制。商業或大型研究計畫可能需要自架 JATOS 伺服器。

### 3.3. 設定 JATOS 與 OSWEB 連動

- **目標:** 讓 OpenSesame 可以將實驗上傳到 JATOS 伺服器。
- **步驟:**
    1. 在 OpenSesame 中打開 `Tools -> JATOS` 設定。
    2. 輸入 JATOS 伺服器的網址以及您的 API token。
- **除錯提示:**
    - 確認 JATOS 伺服器網址正確無誤。
    - 確認 API token 未過期或被撤銷。

## 4. 測試與部署 (Testing & Deployment)

### 4.1. 腳本上線測試

- **步驟:**
    1. **本機測試 (Local Test):** 在 OpenSesame 中直接執行腳本，確保所有功能正常。
    2. **OSWeb 預覽 (OSWeb Preview):** 使用 OpenSesame 的 OSWeb 預覽功能，在瀏覽器中測試腳本，確保網頁相容性。
    3. **JATOS 測試 (JATOS Test):** 將腳本上傳到 JATOS 伺服器，並透過 JATOS 提供的連結進行線上測試，確認實驗流程與資料記錄都正確無誤。
- **最佳實踐:**
    - 在 JATOS 中使用 "Test Link" 進行測試，避免浪費 "Worker" 的名額。
    - 多次測試，並檢查從 JATOS 下載的資料是否符合預期格式。

## 5. 資料管理與分析 (Data Management & Analysis)

### 5.1. 從 JATOS 下載資料

- **步驟:**
    1. 登入 JATOS 伺服器。
    2. 進入您的實驗頁面，點擊 "Results"。
    3. 選擇您要下載的資料，並點擊 "Export Results"。

### 5.2. 資料前處理與分析

- **建議:**
    - 使用 R 或 Python 撰寫腳本來自動化資料前處理的流程。
    - 將您的分析腳本與原始資料一同存放在 RStudio Project 中。

## 6. 倫理考量 (Ethical Considerations)

- **您的責任:**
    - 確保您的研究符合倫理審查委員會 (IRB) 的規範。
    - 在實驗開始前提供完整的實驗說明與同意書。
    - 保護受試者的隱私與資料安全。

## 7. 疑難排解 (Troubleshooting)

- **常見問題:**
    - **實驗在 OSWeb 中無法正常運作:**
        - **原因:** 可能是使用了 OSWeb 不支援的 Python 函式庫或元件。
        - **解決方案:** 參考 OSWeb 的官方文件，並使用 JavaScript 或 OSWeb 支援的元件來改寫。
    - **JATOS 無法接收資料:**
        - **原因:** 可能是網路連線問題，或是 JATOS 伺服器設定錯誤。
        - **解決方案:** 檢查 JATOS 的設定，並確認您的實驗腳本中有正確的 `jatos.submitResultData()` 語法 (如果使用 jsPsych)。
