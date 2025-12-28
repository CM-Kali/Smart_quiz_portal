document.addEventListener('DOMContentLoaded', () => {
    const tbody = document.querySelector('#resultsTable tbody');

    fetch('http://localhost/quiz-app/backend/getAllResults.php')
    .then(res => res.json())
    .then(data => {
        tbody.innerHTML = ''; // clear loading row
        if(!data || data.length === 0){
            tbody.innerHTML = '<tr><td colspan="7">No results found</td></tr>';
            return;
        }

        data.forEach(result => {
            const tr = document.createElement('tr');
            tr.innerHTML = `
                <td>${result.username}</td>
                <td>${result.subject}</td>
                <td>${result.level}</td>
                <td>${result.total_questions}</td>
                <td>${result.correct_answers}</td>
                <td>${result.score}%</td>
                <td>${result.created_at}</td>
            `;
            tbody.appendChild(tr);
        });
    })
    .catch(err => {
        console.error(err);
        tbody.innerHTML = '<tr><td colspan="7">Error loading results</td></tr>';
    });
});
