    // 차트 데이터
    const ctx = document.getElementById('spendingChart').getContext('2d');
    new Chart(ctx, {
        type: 'doughnut', // 도넛형 차트
        data: {
            labels: ['식비', '교통비', '엔터테인먼트', '기타'],
            datasets: [{
                data: [450000, 200000, 150000, 400000],
                backgroundColor: ['#28a745', '#17a2b8', '#ffc107', '#dc3545'],
                hoverOffset: 4
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'bottom'
                }
            }
        }
    });