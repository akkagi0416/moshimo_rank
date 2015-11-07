<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title></title>
</head>
<body>
  <header>
    <div class="container">
      <h1 class="logo">logo</h1>
    </div>
    <div class="nav_wrap">
      <div class="container">
        <nav>
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">menu1</a></li>
            <li><a href="#">menu2</a></li>
            <li><a href="#">menu3</a></li>
          </ul>
        </nav>
      </div>
    </div>
  </header>

  <div class="container">
    <div class="row">
      <aside class="col-md-3">
        <h2>sub</h2>
        <div class="">
          <div><input type="radio" name="radio" id="radio1"><label for="radio1">フード・ドリンク・スイーツ</label></div>
          <div><input type="radio" name="radio" id="radio2"><label for="radio2">ファッション</label></div>
          <div><input type="radio" name="radio" id="radio3"><label for="radio3">AV・デジモノ</label></div>
          <button class="btn btn-primary">検索</button>
        </div>
      </aside>
      <div class="col-md-9">
        <h2>main</h2>
        <section>
          <div class="media">
            <div class="media-left"><a href="#"><img src="http://placehold.jp/100x100.png" alt=""></a></div>
            <div class="media-body">
              <h3>商品名</h3>
              <table>
                <tr>
                  <th>卸価格</th>
                  <th>最低販売価格</th>
                  <th>利益</th>
                  <th>利益率</th>
                  <th>販売価格</th>
                </tr>
                <tr>
                  <td>9,186円</td>
                  <td>9,186円</td>
                  <td>750円</td>
                  <td>8%</td>
                  <td>9,936円</td>
                </tr>
              </table>
              <p>ダイエット・健康 &gt; 健康器具 &gt; 吸入器</p>
            </div>
          </div>
        </section>
        <section>
          <h3>グラフ</h3>
          <div id="curve_chart" style="height: 400px;"></div>
        </section>
      </div>
    </div>
  </div>

  <footer>
  </footer>

  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" integrity="sha512-K1qjQ+NcF2TYO/eI3M6v8EiNYZfA95pQumfvcVrTHtwQVDG+aHRqLi/ETn2uB+1JqwYqVG3LIvdm9lj6imS/pQ==" crossorigin="anonymous"></script>
  <script type="text/javascript" src="https://www.google.com/jsapi"></script>
  <script>
    google.load('visualization', '1.0', {'packages':['corechart']});
    google.setOnLoadCallback(drawChart);

    function drawChart(){
      var data = google.visualization.arrayToDataTable([
        ['Year', 'Sales', 'Expenses'],
        ['2004',  1000,      400],
        ['2005',  1170,      460],
        ['2006',  660,       1120],
        ['2007',  1030,      540]
      ]);

      var options = {
      title: 'Company Performance',
        curveType: 'function',
        legend: { position: 'bottom' }
      };

      var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

      chart.draw(data, options);
    };
  </script>
  <style>
    .nav_wrap{
      background-color: #eee;
    }
    th, td{
      border: 1px solid #ccc;
    }
    footer{
      height: 50px;
      background-color: #666;
    }
  </style>
</body>
</html>
