import Chart from 'chart.js'

let requestsChart = () => {
  var element = document.getElementById('requestsChart')
  var ctx = element.getContext('2d')
  var failures = element.dataset.failures
  var success = element.dataset.success

  var chart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'bar',

    // The data for our dataset
    data: {
      labels: ['Successes', 'Failures'],
      datasets: [{
        backgroundColor: [
          '#008F39',
          '#fb5454'
        ],
        borderColor: 'none',
        data: [success, failures]
      }]
    },

    // Configuration options go here
    options: {
      legend: {
        display: false
      },
      scales : {
        xAxes : [ {
          gridLines : {
            display : false
          }
        } ],
        yAxes: [{
          gridLines: {
            drawBorder: false
          },
          ticks: {
            padding: 20,
            beginAtZero: true
          }
        }]
      }
    }
  });
}

$(document).on('turbolinks:load', () => {
	if ($('#requestsChart').length) requestsChart()
})