// Parse URL params
const params = new URLSearchParams(window.location.search);
const subject = params.get("subject");
const level = params.get("level");

const scoreText = document.getElementById("scoreText");
const ctx = document.getElementById("scoreChart").getContext('2d');
const allResultsDiv = document.getElementById("allResults");

// Fetch last user result
fetch('http://localhost/quiz-app/backend/getResults.php')
  .then(res => res.json())
  .then(results => {
    // Filter for current user/subject/level (here we use Test User)
    const userResult = results.find(r => r.username === "Test User" && r.subject === subject && r.level === level);

    if(userResult){
      const correct = userResult.correct_answers;
      const total = userResult.total_questions;
      const score = userResult.score;

      scoreText.innerHTML = `Score: ${score}% (${correct}/${total} correct)`;

      // Chart.js - Pie chart
      new Chart(ctx, {
        type: 'doughnut',
        data: {
          labels: ['Correct', 'Incorrect'],
          datasets: [{
            data: [correct, total-correct],
            backgroundColor: ['#28a745','#dc3545']
          }]
        },
        options: {
          responsive: true
        }
      });
    } else {
      scoreText.textContent = "Result not found!";
    }

    // Show all users results
    allResultsDiv.innerHTML = "";
    results.forEach(r => {
      const row = document.createElement('div');
      row.classList.add('result-row');
      row.textContent = `${r.username} - ${r.subject} - ${r.level} - Score: ${r.score}% (${r.correct_answers}/${r.total_questions})`;
      allResultsDiv.appendChild(row);
    });
  })
  .catch(err => console.error(err));
