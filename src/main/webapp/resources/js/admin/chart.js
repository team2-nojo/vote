const data = {
  labels: [
    '10일 전',
    '9일 전',
    '8일 전',
    '7일 전',
    '6일 전',
    '5일 전',
    '4일 전',
    '3일 전',
    '2일 전',
    '어제',
  ],
  datasets: [
    {
      label: '회원 가입',
      data: [10, 5, 8, 12, 7, 10, 9, 14, 11, 13],
      borderColor: 'rgb(75, 192, 192)',
      tension: 0.1,
    },
    {
      label: '회원 탈퇴',
      data: [2, 4, 1, 3, 5, 6, 2, 3, 4, 1],
      borderColor: 'rgb(255, 99, 132)',
      tension: 0.1,
    },
  ],
};

const config = {
  type: 'line',
  data: data,
  options: {},
};

var myChart = new Chart(document.getElementById('myChart'), config);
