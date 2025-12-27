let questions = [];
let score = 0;
let timeLeft = 60;
let timer;

// Get username from URL
const params = new URLSearchParams(window.location.search);
const username = params.get("username");

// Save username for later use
localStorage.setItem("username", username);

// Show welcome message
document.getElementById("welcome").innerText = 
    "Welcome, " + username;

// Fetch questions from backend
fetch("backend/getQuestions.php")
    .then(response => response.json())
    .then(data => {
        questions = data;
        displayQuestions();
        startTimer();
    });

// Display questions
function displayQuestions() {
    const quizBox = document.getElementById("quiz-box");
    quizBox.innerHTML = "";

    questions.forEach((q, index) => {
        quizBox.innerHTML += `
            <div class="question">
                <p><strong>Q${index + 1}:</strong> ${q.question}</p>

                <label>
                    <input type="radio" name="q${index}" value="${q.option1}">
                    ${q.option1}
                </label><br>

                <label>
                    <input type="radio" name="q${index}" value="${q.option2}">
                    ${q.option2}
                </label><br>

                <label>
                    <input type="radio" name="q${index}" value="${q.option3}">
                    ${q.option3}
                </label><br>

                <label>
                    <input type="radio" name="q${index}" value="${q.option4}">
                    ${q.option4}
                </label>
            </div><hr>
        `;
    });
}

// Timer logic
function startTimer() {
    timer = setInterval(() => {
        timeLeft--;
        document.getElementById("time").innerText = timeLeft;

        if (timeLeft <= 0) {
            clearInterval(timer);
            submitQuiz();
        }
    }, 1000);
}

// Submit quiz
function submitQuiz() {
    clearInterval(timer);
    score = 0;

    questions.forEach((q, index) => {
        const selected = document.querySelector(
            `input[name="q${index}"]:checked`
        );

        if (selected && selected.value === q.correct_answer) {
            score++;
        }
    });

    // Save score locally
    localStorage.setItem("score", score);

    // Send result to backend
    const formData = new FormData();
    formData.append("username", username);
    formData.append("score", score);

    fetch("backend/saveResult.php", {
        method: "POST",
        body: formData
    });

    // Redirect to result page
    window.location.href = "result.html";
}
