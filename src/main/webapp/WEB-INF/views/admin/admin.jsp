<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Spike 은행 관리자 페이지</title>
    <link rel="stylesheet" href="assets/css/admin-styles.css">
</head>
<body>
    <div class="container">
        <header>
        	<a href="index.jsp" style="text-decoration: none; color: inherit;">
            <h1>Spike 관리자 페이지</h1>
            </a>
            <nav>
                <ul>
                    <li><a href="#dashboard">대시보드</a></li>
                    <li><a href="#users">사용자 관리</a></li>
                    <li><a href="#transactions">거래 내역</a></li>
                    <li><a href="#reports">보고서</a></li>
                </ul>
            </nav>
        </header>

        <main>
            <section id="dashboard">
                <h2>대시보드</h2>
                <div class="dashboard-stats">
                    <div class="stat-card">
                        <h3>총 사용자 수</h3>
                        <p>10,234</p>
                    </div>
                    <div class="stat-card">
                        <h3>오늘의 거래량</h3>
                        <p>1,234</p>
                    </div>
                    <div class="stat-card">
                        <h3>이번 달 수익</h3>
                        <p>₩123,456,789</p>
                    </div>
                </div>
            </section>

            <section id="users">
                <h2>사용자 관리</h2>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>이름</th>
                                <th>이메일</th>
                                <th>가입일</th>
                                <th>작업</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>홍길동</td>
                                <td>hong@example.com</td>
                                <td>2024-03-15</td>
                                <td>
                                    <button class="btn btn-edit">수정</button>
                                    <button class="btn btn-delete">삭제</button>
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>김철수</td>
                                <td>kim@example.com</td>
                                <td>2024-03-14</td>
                                <td>
                                    <button class="btn btn-edit">수정</button>
                                    <button class="btn btn-delete">삭제</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>

            <section id="transactions">
                <h2>거래 내역</h2>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>거래 ID</th>
                                <th>보내는 사람</th>
                                <th>받는 사람</th>
                                <th>금액</th>
                                <th>날짜</th>
                                <th>상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>T1001</td>
                                <td>홍길동</td>
                                <td>김철수</td>
                                <td>₩100,000</td>
                                <td>2024-03-15 14:30</td>
                                <td><span class="status completed">완료</span></td>
                            </tr>
                            <tr>
                                <td>T1002</td>
                                <td>이영희</td>
                                <td>박민수</td>
                                <td>₩50,000</td>
                                <td>2024-03-15 15:45</td>
                                <td><span class="status pending">대기중</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>

            <section id="reports">
                <h2>보고서</h2>
                <ul>
                    <li><a href="#">월간 거래 보고서</a></li>
                    <li><a href="#">연간 재무 보고서</a></li>
                    <li><a href="#">사용자 활동 보고서</a></li>
                    <li><a href="#">위험 평가 보고서</a></li>
                </ul>
            </section>
        </main>

        <footer>
            <p>&copy; 2024 Spike.  All rights reserved.</p>
        </footer>
    </div>
</body>
</html>