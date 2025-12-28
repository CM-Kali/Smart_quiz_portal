document.addEventListener('DOMContentLoaded', () => {
    const username = localStorage.getItem('quizUsername');
    const subject = localStorage.getItem('quizSubject');
    const level = localStorage.getItem('quizLevel');

    if(!username || !subject || !level){
        alert('Missing quiz info. Redirecting to Dashboard.');
        window.location.href = 'dashboard.html';
        return;
    }

    const questionTitle = document.getElementById('questionTitle');
    const optionsList = document.getElementById('optionsList');
    const nextBtn = document.getElementById('nextBtn');

    let questions = [];
    let currentIndex = 0;
    let correctAnswers = 0;

    // Fetch questions from backend
    fetch(`http://localhost/quiz-app/backend/getQuestions.php?subject=${encodeURIComponent(subject)}&level=${encodeURIComponent(level)}`)
    .then(res => res.json())
    .then(data => {
        questions = data;
        if(!questions || questions.length === 0){
            alert('No questions available for this level.');
            window.location.href = 'dashboard.html';
            return;
        }
        showQuestion();
    })
    .catch(err => {
        console.error(err);
        alert('Error loading questions.');
        window.location.href = 'dashboard.html';
    });

    function showQuestion(){
        nextBtn.style.display = 'none';
        const q = questions[currentIndex];
        questionTitle.textContent = `Q${currentIndex + 1}: ${q.question}`;
        optionsList.innerHTML = '';

        ['option1','option2','option3','option4'].forEach(opt => {
            const li = document.createElement('li');
            const btn = document.createElement('button');
            btn.classList.add('option-btn');
            btn.textContent = q[opt];
            btn.addEventListener('click', () => selectAnswer(btn, q.correct_answer));
            li.appendChild(btn);
            optionsList.appendChild(li);
        });
    }

    function selectAnswer(btn, correctAnswer){
        const allBtns = document.querySelectorAll('.option-btn');
        allBtns.forEach(b => b.disabled = true);

        if(btn.textContent === correctAnswer){
            btn.classList.add('correct');
            correctAnswers++;
        } else {
            btn.classList.add('wrong');
            // Highlight correct answer
            allBtns.forEach(b => {
                if(b.textContent === correctAnswer) b.classList.add('correct');
            });
        }

        nextBtn.style.display = 'block';
    }

    nextBtn.addEventListener('click', () => {
        currentIndex++;
        if(currentIndex >= questions.length){
            saveResult();
        } else {
            showQuestion();
        }
    });

    function saveResult(){
        const totalQuestions = questions.length;
        const score = Math.round((correctAnswers / totalQuestions) * 100);

        fetch('http://localhost/quiz-app/backend/saveResult.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                username,
                subject,
                level,
                total_questions: totalQuestions,
                correct_answers: correctAnswers,
                score
            })
        })
        .then(res => res.json())
        .then(data => {
            console.log('Result saved:', data);
            window.location.href = 'result.html';
        })
        .catch(err => {
            console.error('Error saving result:', err);
            alert('Error saving result. Try again.');
        });
    }
});
