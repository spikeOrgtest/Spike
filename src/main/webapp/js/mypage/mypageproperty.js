        // 자산 추이 그래프
        var ctx = document.getElementById('assetChart').getContext('2d');
        var assetChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['1주', '2주', '3주', '4주'],
                datasets: [{
                    label: '자산 변화',
                    data: [10000000, 10500000, 11000000, 11500000],
                    borderColor: 'rgba(75, 192, 192, 1)',
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    fill: true,
                    tension: 0.1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { position: 'top' },
                    tooltip: { enabled: true }
                }
            }
        });

        // "조회" 버튼 클릭 시 각 섹션 표시
        document.getElementById("viewButton").addEventListener("click", function () {
            var assetSummary = document.getElementById("assetSummary");
            var transactionHistory = document.getElementById("transactionHistory");
            var assetTrend = document.getElementById("assetTrend");

            // 각 섹션을 펼침
            assetSummary.classList.toggle("show");
            transactionHistory.classList.toggle("show");
            assetTrend.classList.toggle("show");
        });