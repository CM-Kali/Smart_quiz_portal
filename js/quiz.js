// Parse URL parameters
const params = new URLSearchParams(window.location.search);
const subject = params.get("subject");
const level = params.get("level");

let questions = [];
let currentIndex = 0;
let correctCount = 0;

const questionTitle = document.getElementById("questionTitle");
const optionsBox = document.getElementById("optionsBox");
const nextBtn = document.getElementById("nextBtn");

fetch(`http://localhost/quiz-app/backend/getQuestions.php?subject=${encodeURIComponent(subject)}&level=${encodeURIComponent(level)}`)
  .then(res => res.json())
  .then(data => {
    questions = data;
    showQuestion();
  })
  .catch(err => console.error("Error fetching questions:", err));

function showQuestion() {
  if(currentIndex >= questions.length) {
    saveResult();
    return;
  }
  const q = questions[currentIndex];
  questionTitle.textContent = `Q${currentIndex + 1}. ${q.question}`;
  optionsBox.innerHTML = "";

  ["option1","option2","option3","option4"].forEach(opt => {
    const btn = document.createElement("div");
    btn.classList.add("option");
    btn.textContent = q[opt];
    btn.onclick = () => checkAnswer(q.correct_answer, btn);
    optionsBox.appendChild(btn);
  });
}

function checkAnswer(correct, btn) {
  const allOptions = document.querySelectorAll(".option");
  allOptions.forEach(o => o.onclick = null); // disable all
  if(btn.textContent === correct){
    btn.classList.add("correct");
    correctCount++;
  } else {
    btn.classList.add("wrong");
    allOptions.forEach(o => { if(o.textContent === correct) o.classList.add("correct"); });
  }
  nextBtn.style.display = "block";
}

nextBtn.addEventListener("click", () => {
  currentIndex++;
  nextBtn.style.display = "none";
  showQuestion();
});

function saveResult() {
  const total = questions.length;
  fetch('http://localhost/quiz-app/backend/saveResult.php', {
    method: 'POST',
    headers: {'Content-Type':'application/json'},
    body: JSON.stringify({
      username: "Test User",
      subject: subject,
      level: level,
      total_questions: total,
      correct_answers: correctCount,
      score: Math.round((correctCount/total)*100)
    })
  })
  .then(() => {
    window.location.href = `result.html?subject=${encodeURIComponent(subject)}&level=${encodeURIComponent(level)}`;
  })
  .catch(err => console.error(err));
}
