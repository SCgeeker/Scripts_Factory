# Plan for Creating the Wisconsin Card Sorting Test (WCST) Template
# 威斯康辛卡片分類測驗 (WCST) 模板建立計畫

This plan outlines the steps for creating a template for the Wisconsin Card Sorting Test (WCST) in OpenSesame, based on the [official tutorial](https://osdoc.cogsci.nl/4.1/tutorials/wcst/).
本計畫概述了根據[官方教學](https://osdoc.cogsci.nl/4.1/tutorials/wcst/)，在 OpenSesame 中建立威斯康辛卡片分類測驗 (WCST) 模板的步驟。

## 1. Basic Structure (基本結構)

-   [ ] **Create the main sequence:** Set up the main `sequence` of the experiment.
    **建立主要序列:** 設定實驗的主要 `sequence`。
    > **AI溝通範例:** "I'm not sure how to set up the main sequence for the WCST experiment. Can you show me how to do it?"
-   [ ] **Add the block loop:** Create a `loop` for the blocks of trials.
    **新增區塊迴圈:** 為試驗區塊建立一個 `loop`。
    > **AI溝通範例:** "I'm having trouble creating the block loop. Can you help me set up a loop that runs for 10 trials?"
-   [ ] **Add the trial sequence:** Inside the block loop, create a `sequence` for a single trial.
    **新增試驗序列:** 在區塊迴圈內，為單一試驗建立一個 `sequence`。
    > **AI溝通範例:** "I need to create the trial sequence. It should include a sketchpad for the stimulus, a mouse response, and a feedback sketchpad. Can you help me with that?"

## 2. Stimuli and Display (刺激物與顯示)

-   [ ] **Import stimuli:** Download the stimuli from the tutorial and add them to the file pool.
    **匯入刺激物:** 從教學中下載刺激物並將其新增至檔案池。
    > **Important:** This step requires the `stimuli.zip` file to be present in this directory.
    > **重要提示:** 此步驟需要 `stimuli.zip` 檔案存在於此目錄中。
    > **AI溝通範例:** "I have downloaded the stimuli for the WCST. Can you help me add them to the file pool?"
-   [ ] **Define variables in the block loop:** Define the `stimulus` and `correct_response` variables in the block loop.
    **在區塊迴圈中定義變數:** 在區塊迴圈中定義 `stimulus` 和 `correct_response` 變數。
    > **AI溝通範例:** "I need to define the `stimulus` and `correct_response` variables in the block loop. Can you show me how to do that?"
-   [ ] **Create the card display:** Use a `sketchpad` to display the four stimulus cards and the response card.
    **建立卡片顯示:** 使用 `sketchpad` 來顯示四張刺激卡和反應卡。
    > **AI溝通範例:** "I'm not sure how to create the card display. Can you help me create a sketchpad that displays the four stimulus cards and the response card?"

## 3. Response and Feedback (反應與回饋)

-   [ ] **Collect response:** Use a `mouse_response` item to collect the participant's response.
    **收集反應:** 使用 `mouse_response` 項目來收集參與者的反應。
    > **AI溝通範例:** "I need to collect the participant's response. Can you help me add a `mouse_response` item to the trial sequence?"
-   [ ] **Determine the correct response:** Use an `inline_script` to determine the correct response based on the matching rule.
    **判斷正確反應:** 使用 `inline_script` 根據配對規則來判斷正確反應。
    > **AI溝продолжение

-   [ ] **Provide feedback:** Use a `sketchpad` to provide feedback to the participant (e.g., a green checkmark for a correct response, a red cross for an incorrect response).
    **提供回饋:** 使用 `sketchpad` 向參與者提供回饋 (例如，正確反應顯示綠色勾號，錯誤反應顯示紅色叉號)。
    > **AI溝通範例:** "I want to provide feedback to the participant. Can you help me create a sketchpad that shows a green checkmark for a correct response and a red cross for an incorrect response?"

## 4. Advanced Features (Optional) (進階功能 (可選))

-   [ ] **Add a logger:** Use a `logger` to save the experimental data.
    **新增記錄器:** 使用 `logger` 來儲存實驗資料。
    > **AI溝通範例:** "I need to save the experimental data. Can you help me add a `logger` to the experiment?"
-   [ ] **Add instructions:** Add a `sketchpad` with instructions for the participant at the beginning of the experiment.
    **新增說明:** 在實驗開始時，新增一個帶有說明的 `sketchpad`。
    > **AI溝通範例:** "I want to add instructions for the participant. Can you help me create a sketchpad with the instructions?"
-   [ ] **Dynamic matching rule:** Use an `inline_script` to dynamically change the matching rule during the experiment.
    **動態配對規則:** 在實驗過程中，使用 `inline_script` 來動態變更配對規則。
    > **AI溝通範例:** "I want to dynamically change the matching rule. Can you help me write an inline script that changes the matching rule every 10 trials?"

## 5. Running the Experiment Online with JATOS (使用 JATOS 在線運行實驗)

This section provides a detailed guide to deploying your experiment to JATOS. For a more in-depth explanation, please refer to the `OSWEB_to_JATOS_video_guide.md`.
本節提供將您的實驗部署到 JATOS 的詳細指南。如需更深入的說明，請參閱 `OSWEB_to_JATOS_video_guide.md`。

### 5.1. Key Concepts (關鍵概念)

-   **API Key (伺服器通行證):** Grants OpenSesame permission to upload your experiment to your JATOS server. You can get this from your JATOS account settings.
    **API 金鑰 (伺服器通行證):** 授予 OpenSesame 將您的實驗上傳到您的 JATOS 伺服器的權限。您可以從您的 JATOS 帳戶設定中取得。
-   **Completion URL (任務回報網址):** A URL that participants are redirected to after completing the experiment. This is used to notify the recruitment platform that the task is complete. You can get this from your recruitment platform (e.g., Amazon Mechanical Turk).
    **任務回報網址 (任務回報點):** 參與者完成實驗後被重新導向的網址。這用於通知招募平台任務已完成。您可以從您的招募平台 (例如 Amazon Mechanical Turk) 取得。

### 5.2. Setup in OpenSesame (在 OpenSesame 中設定)

1.**Open the OSWeb and JATOS control panel:** In your experiment, click on the `OSWeb and JATOS` control panel.
    **開啟 OSWeb 與 JATOS 控制面板:** 在您的實驗中，點擊 `OSWeb and JATOS` 控制面板。
2.  **Fill in the information:**
    **填寫資訊:**
    - [ ] **JATOS server:** The URL of your JATOS server (e.g., `https://mindprobe.jatos.org/`).
        **JATOS 伺服器:** 您的 JATOS 伺服器網址 (例如 `https://mindprobe.jatos.org/`)。
    - [ ] **JATOS API key:** The API key you got from your JATOS account.
        **JATOS API 金鑰:** 您從 JATOS 帳戶取得的 API 金鑰。
    - [ ] **Third-party completion URL:** The completion URL you got from your recruitment platform.
        **第三方回報網址:** 您從招募平台取得的任務回報網址。

### 5.3. Publish and Test (發布與測試)

1.  **Publish the experiment:** In the `OSWeb and JATOS` control panel, click `Save and publish to JATOS`.
    **發布實驗:** 在 `OSWeb and JATOS` 控制面板中，點擊 `儲存並發布到 JATOS`。
2.  **Generate a Study Link in JATOS:** In the JATOS interface, set up a `Study Link` for your experiment. For use with a third-party recruitment platform, it is recommended to use the `General Multiple` link type.
    **在 JATOS 中產生研究連結:** 在 JATOS 介面中，為您的實驗設定一個 `Study Link`。若要與第三方招募平台搭配使用，建議使用 `General Multiple` 連結類型。
3.  **Set up the task URL on the recruitment platform:** On your recruitment platform, paste the `Study Link` from JATOS into the "task URL" field.
    **在招募平台上設定任務網址:** 在您的招募平台上，將從 JATOS 複製的 `Study Link` 貼到「任務網址」欄位中。
4.  **Run a full test:** Use the recruitment platform's testing feature to run a full test of the experiment, from recruitment to completion.
    **進行完整測試:** 使用招募平台的測試功能，從招募到完成，對實驗進行完整測試。
5.  **Verify the results:** Check the `Results` page in JATOS to make sure that the data from your test run was saved correctly.
    **驗證結果:** 檢查 JATOS 中的 `Results` 頁面，確保您的測試回合資料已正確儲存。

## 6. Expert Advice (專家建議)

-   **Set the participant limit on the recruitment platform, not in JATOS.** This will prevent you from wasting participant slots on incomplete sessions.
    **在招募平台上設定參與者人數上限，而不是在 JATOS 中設定。** 這將防止您在未完成的工作階段上浪費參與者名額。
