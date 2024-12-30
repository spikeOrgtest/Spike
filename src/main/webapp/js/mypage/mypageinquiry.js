    // Chart.js를 사용한 투자 현황 차트
    const ctx = document.getElementById('investmentChart').getContext('2d');
    const investmentChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['주식', '채권', '펀드'],
            datasets: [{
                label: '투자 금액 (₩)',
                data: [500000, 300000, 150000],
                backgroundColor: ['#007bff', '#28a745', '#ffc107'],
                borderColor: ['#007bff', '#28a745', '#ffc107'],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });