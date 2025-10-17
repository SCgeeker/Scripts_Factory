# Survey Packaging
# 問卷封裝

This directory contains packaged survey experiments ready for deployment.
此目錄包含準備部署的封裝問卷實驗。

---

## 1. Need for Cognition Scale Test Version (認知需求量表測試版)

### Component Source (組件來源)

- "1_Templates/Consent"
- "1_Templates/NfC"

### Files (檔案)
- `NfC_packing.osexp` - Complete OpenSesame experiment file ready for JATOS deployment

---

## 2. Workshop Readiness Survey (工作坊準備度問卷)

A pre-workshop assessment survey to evaluate participants' readiness for the Scripts_Factory workshop.
用於評估參與者對 Scripts_Factory 工作坊準備程度的前置評估問卷。

### Files (檔案)
- `Workshop_Readiness_Survey.md` - Survey questions and structure (問卷題目與結構)
- `Workshop_Readiness_Survey.html` - HTML form code for OpenSesame inline_html item (用於 OpenSesame inline_html 項目的 HTML 表單程式碼)

### How to Use in OpenSesame (如何在 OpenSesame 中使用)

#### Step 1: Create New Experiment (建立新實驗)
1. Open OpenSesame (開啟 OpenSesame)
2. Create a new experiment (建立新實驗)
3. Set backend to "osweb" for web-based experiments (將後端設為 "osweb" 以建立網頁實驗)

#### Step 2: Add Title Sketchpad (新增標題 Sketchpad)
1. Add a `sketchpad` item before the survey
   在問卷前新增 `sketchpad` 項目
2. Add the title text: "Workshop Readiness Survey 工作坊準備度問卷"
   新增標題文字：「Workshop Readiness Survey 工作坊準備度問卷」
3. Set duration appropriately (e.g., 2000 ms)
   適當設定持續時間（例如 2000 毫秒）

#### Step 3: Add Survey Form (新增問卷表單)
1. Add an `inline_html` item to your experiment sequence
   在實驗序列中新增 `inline_html` 項目
2. Open `Workshop_Readiness_Survey.html`
   開啟 `Workshop_Readiness_Survey.html`
3. Copy the entire HTML content and paste into the `inline_html` item
   複製整個 HTML 內容並貼到 `inline_html` 項目中
4. The survey will automatically store responses in OpenSesame variables
   問卷將自動將回應儲存在 OpenSesame 變數中

#### Step 4: Add Logger (新增記錄器)
Add a `logger` item after the survey to save all data.
在問卷後新增 `logger` 項目以儲存所有資料。

**Note**: The survey automatically calculates the following scores:
**注意**：問卷自動計算以下分數：
- `software_readiness`: Count of installed software (0-5)
- `knowledge_score`: Sum of knowledge ratings (8-40)
- `knowledge_avg`: Average knowledge rating (1.0-5.0)
- `prep_score`: Count of completed preparation activities (0-4)

#### Step 5: Test and Deploy (測試與部署)
1. Test locally in OpenSesame
2. Preview with OSWeb
3. Upload to JATOS
4. Test on JATOS server

### Survey Sections (問卷部分)

1. **Software Installation** (5 questions) - Yes/No/Not sure
   **軟體安裝**（5 題）
2. **Account Setup** (2 questions) - Yes/No/Local server
   **帳號設定**（2 題）
3. **Knowledge & Skills** (8 questions) - 5-point scale (1=No knowledge to 5=Expert)
   **知識與技能**（8 題）- 5 點量表（1=無知識 到 5=專家）
4. **Preparation Activities** (4 questions) - Yes/No/Partially
   **準備活動**（4 題）
5. **Workshop Goals** (3 questions) - Open-ended text
   **工作坊目標**（3 題）- 開放文字

### Data Analysis (資料分析)

**Calculated Metrics:**
- Software Readiness Score (0-5)
- Account Readiness Score (0-2)
- Knowledge Score (8-40)
- Preparation Score (0-4)

**Example R code:**
```r
# Load data
data <- read.csv("workshop_readiness.csv")

# Calculate scores
data$software_ready <- rowSums(data[, paste0("q", 1:5)] == "yes")
data$knowledge_avg <- rowMeans(data[, paste0("q", 8:15)])
data$prep_score <- rowSums(data[, paste0("q", 16:19)] %in% c("yes", "partial"))

# Identify participants needing support
summary(data[, c("software_ready", "knowledge_avg", "prep_score")])
```

### Features (功能特色)
- **Multi-page layout** - Each section on a separate page with navigation
  **多頁式佈局** - 每個部分在單獨頁面上，帶有導航
- **Progress indicator** - Visual progress bar showing completion status
  **進度指示器** - 顯示完成狀態的視覺進度條
- **Page validation** - Requires all questions answered before proceeding
  **頁面驗證** - 需要回答所有問題才能繼續
- **Dark text colors** - Improved readability with high contrast text
  **深色文字** - 使用高對比度文字改善可讀性
- **Auto-scoring** - Automatically calculates readiness scores
  **自動評分** - 自動計算準備度分數
- **Fully bilingual** - English/Chinese throughout 完全雙語
- **OSWeb/JATOS compatible** - Ready for deployment 可直接部署

### Notes (注意事項)
- Title should be added on a separate sketchpad before the survey
  標題應在問卷前的單獨 sketchpad 上新增
- All questions on a page must be answered to proceed to next page
  必須回答頁面上的所有問題才能繼續到下一頁
- Responses are automatically saved to OpenSesame variables
  回應自動儲存到 OpenSesame 變數中