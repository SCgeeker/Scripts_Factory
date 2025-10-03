# Development Process for the Web-Based Need for Cognition (NfC) Scale
# 認知需求量表網頁版開發流程

This document summarizes the development process for creating a web-based version of the Need for Cognition (NfC) scale using OpenSesame and JATOS.
本文件總結了使用 OpenSesame 和 JATOS 建立認知需求量表 (NfC) 網頁版的開發流程。

## 1. Final Solution (最終解決方案)

The final solution consists of a single `inline_html` item in OpenSesame that contains all the HTML, CSS, and JavaScript code for the questionnaire. This approach is the most robust and compatible with JATOS.
最終解決方案是在 OpenSesame 中使用單一的 `inline_html` 項目，其中包含問卷的所有 HTML、CSS 和 JavaScript 程式碼。這種方法最為穩健且與 JATOS 相容。

### `inline.html` Code

```html
<style>
  .question {
    margin-bottom: 1em;
  }
  .likert-scale {
    display: flex;
    justify-content: space-between;
    list-style-type: none;
    padding: 0;
  }
  .likert-item {
    text-align: center;
  }
</style>

<div id="question-container"></div>
<button id="next-button" disabled>Next</button>

<script>
  const questions = [
    { text: "我比較喜歡複雜而不喜歡簡單的問題。", reverse: false },
    { text: "我願意負責解決要花很多腦筋的事。", reverse: false },
    { text: "我不以思考為樂。", reverse: true },
    { text: "我比較喜歡去做不用思考的事,而不願去做需要思考的事。", reverse: true },
    { text: "我對那些要花很多心思去想事情的情境,避之唯恐不及。", reverse: true },
    { text: "我從深思和長考中得到滿足。", reverse: false },
    { text: "我不費心去多想。", reverse: true },
    { text: "與其去想一些長期計劃,我寧願想一些小的日常計劃。 ", reverse: true },
    { text: "我喜歡那些一旦學會就不用再想的工作。", reverse: true },
    { text: "靠著思考去往上爬的想法正合我意。", reverse: false },
    { text: "我喜歡那些需要想出新的方法來解決問題的工作。", reverse: false },
    { text: "學習新的思考方式沒有甚麼意思。", reverse: true },
    { text: "我願我這一生充滿著我必須解決的難題。", reverse: false },
    { text: "我喜歡抽象地思考。", reverse: false },
    { text: "我喜歡需要動腦筋且困難的重要工作,而不喜歡還算重要但不需多想的工作。", reverse: false },
    { text: "當我完成一件很費心力的工作後,我感到的是解脫而不是滿足。", reverse: true },
    { text: "我只在乎工作是否完成,我不在意 它是如何或爲何做成的。", reverse: true },
    { text: "即使一些事務跟我個人沒有切身關係,我常會去對它們深思熟慮一番。", reverse: false }
  ];

  let currentQuestionIndex = 0;
  let responses = [];
  let randomizedQuestions = [];

  function shuffle(array) {
    for (let i = array.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [array[i], array[j]] = [array[j], array[i]];
    }
  }

  function showQuestion() {
    const questionContainer = document.getElementById('question-container');
    const question = randomizedQuestions[currentQuestionIndex];
    questionContainer.innerHTML = `
      <div class="question">
        <p>${currentQuestionIndex + 1}. ${question.text}</p>
        <ul class="likert-scale">
          <li class="likert-item"><input type="radio" name="q" value="0" required> 非常不符合</li>
          <li class="likert-item"><input type="radio" name="q" value="1"></li>
          <li class="likert-item"><input type="radio" name="q" value="2"></li>
          <li class="likert-item"><input type="radio" name="q" value="3"></li>
          <li class="likert-item"><input type="radio" name="q" value="4"></li>
          <li class="likert-item"><input type="radio" name="q" value="5"> 非常符合</li>
        </ul>
      </div>
    `;
    const nextButton = document.getElementById('next-button');
    nextButton.disabled = true;
    const radioButtons = document.querySelectorAll('input[name="q"]');
    radioButtons.forEach(button => {
      button.addEventListener('change', () => {
        nextButton.disabled = false;
      });
    });
  }

  function nextQuestion() {
    const selectedValue = document.querySelector('input[name="q"]:checked');
    if (selectedValue) {
      let score = parseInt(selectedValue.value);
      if (randomizedQuestions[currentQuestionIndex].reverse) {
        score = 5 - score;
      }
      responses.push({
        question: randomizedQuestions[currentQuestionIndex].text,
        score: score
      });
      currentQuestionIndex++;
      if (currentQuestionIndex < randomizedQuestions.length) {
        showQuestion();
      } else {
        showTotalScore();
      }
    }
  }

  function showTotalScore() {
    const container = document.getElementById('question-container');
    const totalScore = responses.reduce((acc, curr) => acc + curr.score, 0);
    container.innerHTML = `
      <h2>問卷完成</h2>
      <p>您的總分是：${totalScore}</p>
    `;
    document.getElementById('next-button').style.display = 'none';
    jatos.appendResultData({ nfc_score: totalScore, responses: responses });
    setTimeout(() => {
      jatos.startNextComponent();
    }, 2000);
  }

  randomizedQuestions = [...questions];
  shuffle(randomizedQuestions);
  showQuestion();
  const nextButton = document.getElementById('next-button');
  nextButton.addEventListener('click', nextQuestion);
</script>
```

## 2. Development Journey (開發歷程)

The development of this web-based questionnaire involved several iterations and debugging sessions. Here is a summary of the key steps and lessons learned:

1.  **Initial Approach:** The first attempt involved using `fetch()` to load the questions from a separate text file. This failed because `fetch()` cannot access local files in the JATOS environment.
2.  **Second Approach:** The second attempt involved separating the HTML and JavaScript into two separate `inline_html` and `inline_javascript` items. This also failed due to an incorrect assumption about how OpenSesame handles form submissions and the use of a Python script in a JavaScript-only environment.
3.  **Debugging:** The user reported that the "submit" button was not working. Through a process of elimination and by adding debugging code (`console.log()` statements), we were able to identify the problem.
4.  **Final Solution:** The final, successful approach was to create a single `inline_html` file with embedded JavaScript. This approach is based on the user's feedback and a careful reading of the OpenSesame documentation.

## 3. Recommendations for Creating OSWeb HTML Questionnaires (OSWeb HTML 問卷製作建議事項)

Based on this work process, here are my recommendations for creating OSWeb HTML questionnaires:

*   **Use a Single `inline_html` Item:** For simple questionnaires, it's often easiest to put all your HTML, CSS, and JavaScript in a single `inline_html` item.
*   **Separate Questions:** To display one question at a time, use JavaScript to dynamically update the content of a single `div` element.
*   **Disable Buttons:** To ensure that participants answer each question, disable the "Next" button until a response has been selected.
*   **Randomize Questions:** To avoid order effects, use a JavaScript function to randomize the order of the questions before displaying them.
*   **Handle Scoring in JavaScript:** Do all your scoring, including reverse-scoring, in JavaScript before saving the data to JATOS.
*   **Provide Feedback:** It's good practice to provide feedback to the participant, such as their total score, at the end of the questionnaire.
*   **Use `jatos.appendResultData()` and `jatos.startNextComponent()`:** These are the essential functions for saving data and advancing the experiment in JATOS.
*   **Start Simple:** Begin with a simple HTML structure and gradually add complexity. This will make it easier to identify and fix any problems that may arise.
*   **Use the Browser's Developer Console:** The developer console is an invaluable tool for debugging JavaScript code. Use `console.log()` to print messages to the console and track the execution flow of your code.