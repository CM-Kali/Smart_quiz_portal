document.addEventListener('DOMContentLoaded', () => {
    const container = document.getElementById('subjectsContainer');
    const usernameInput = document.getElementById('username');

    fetch('http://localhost/quiz-app/backend/getSubjects.php')
    .then(res => res.json())
    .then(subjects => {
        container.innerHTML = '';
        if(!subjects || subjects.length === 0){
            container.innerHTML = '<p>No subjects found.</p>';
            return;
        }
        subjects.forEach(subject => {
            const btn = document.createElement('button');
            btn.classList.add('subject-btn');
            btn.textContent = subject;
            btn.addEventListener('click', () => {
                const username = usernameInput.value.trim();
                if(!username){
                    alert('Please enter your name!');
                    return;
                }
                localStorage.setItem('quizUsername', username);
                localStorage.setItem('quizSubject', subject); // store subject for levels
                window.location.href = 'levels.html';
            });
            container.appendChild(btn);
        });
    })
    .catch(err => {
        console.error(err);
        container.innerHTML = '<p>Error loading subjects.</p>';
    });
});
