document.addEventListener('DOMContentLoaded', () => {
    const username = localStorage.getItem('quizUsername');
    const subject = localStorage.getItem('quizSubject');
    const level = localStorage.getItem('quizLevel');

    if(!username || !subject || !level){
        alert('No quiz data found. Redirecting to Dashboard.');
        window.location.href = 'dashboard.html';
        return;
    }

    // Fetch last result for this user, subject, level
    fetch(`http://localhost/quiz-app/backend/getResults.php?username=${encodeURIComponent(username)}&subject=${encodeURIComponent(subject)}&level=${encodeURIComponent(level)}`)
    .then(res => res.json())
    .then(data => {
        if(!data || data.length === 0){
            document.getElementById('resultText').textContent = 'No result found!';
            return;
        }

        // Use the last result
        const result = data[data.length - 1];
        const total = result.total_questions;
        const correct = result.correct_answers;
        const score = result.score;

        document.getElementById('resultText').textContent = `${username}, you scored ${score}% (${correct}/${total})`;

        // Chart.js Pie
        const ctx = document.getElementById('scoreChart').getContext('2d');
        new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: ['Correct', 'Wrong'],
                datasets: [{
                    data: [correct, total - correct],
                    backgroundColor: ['#28a745','#dc3545']
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { position: 'bottom' }
                }
            }
        });
    })
    .catch(err => {
        console.error(err);
        document.getElementById('resultText').textContent = 'Error loading result.';
    });
});
