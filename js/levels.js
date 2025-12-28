document.addEventListener('DOMContentLoaded', () => {
    
    const params = new URLSearchParams(window.location.search);
const subject = localStorage.getItem('quizSubject');

    if(!subject){
        alert('No subject selected!');
        window.location.href = 'dashboard.html';
    }


    document.getElementById('subjectTitle').textContent = `Select Level for "${subject}"`;

    const buttons = document.querySelectorAll('.level-btn');
    buttons.forEach(btn => {
       btn.addEventListener('click', () => {
    const level = btn.getAttribute('data-level');
    // Save subject + level in localStorage for quiz
    localStorage.setItem('quizSubject', subject);
    localStorage.setItem('quizLevel', level);
    // Make sure path matches your folder
    window.location.href = `quiz.html`;
});

    });
});
