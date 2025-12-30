document.addEventListener('DOMContentLoaded', () => {
    const container = document.getElementById('subjectsContainer');

    // 🔐 Validate username exists
    const username = localStorage.getItem('quizUsername');
    if (!username) {
        alert('Please enter your name first!');
        window.location.href = 'dashboard.html';
        return;
    }

    fetch('http://localhost/quiz-app/backend/getSubjects.php')
        .then(res => res.json())
        .then(subjects => {
            container.innerHTML = '';

            if (!subjects || subjects.length === 0) {
                container.innerHTML = '<p>No subjects found.</p>';
                return;
            }

            subjects.forEach(subject => {
                const card = document.createElement('div');
                card.className = 'subject-card';
                card.textContent = subject;

                card.onclick = () => {
                    localStorage.setItem('quizSubject', subject);
                    window.location.href = 'levels.html';
                };

                container.appendChild(card);
            });
        })
        .catch(err => {
            console.error(err);
            container.innerHTML = '<p>Error loading subjects.</p>';
        });
});
