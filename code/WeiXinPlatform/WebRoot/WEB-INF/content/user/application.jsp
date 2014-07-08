<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="/WEB-INF/content/user/common/resources.jsp"></jsp:include>
  	<title>仪表盘</title>
  </head>
  <body>
    <div id="in-nav">
      <div class="container">
        <div class="row">
          <div class="span12">
            <ul class="pull-right">
              <li>xxx，下午好。<a href="login.html">退出</a></li>
            </ul>
            <a id="logo" href="index.html">
            <h4>xxx<strong>微信运营平台</strong></h4></a>
          </div>
        </div>
      </div>
    </div>
    <jsp:include page="/WEB-INF/content/user/common/menu.jsp">
    	<jsp:param value="application" name="current"/>
    </jsp:include>
    <div class="page">
      <div class="page-container">
<div class="container">
  <div class="row">
    <jsp:include page="/WEB-INF/content/user/common/menu-application.jsp">
    	<jsp:param value="wxmenu" name="current"/>
    </jsp:include>
    <div class="span9">
      <h4 class="header">Sales</h4>
      <div id="d3" style="width: 100%; margin-top: -30px"></div><br />
      <div class="row-fluid">
        <div class="span3 knob">
          <h4>Knobs</h4>
          <input type="text" value="70" data-width="120" data-fgcolor="#14B8D4" data-readonly="true" class="dial" />
        </div>
        <div class="span3 knob">
          <h4>Inactive</h4>
          <input type="text" value="30" data-width="120" data-fgcolor="#EA494A" data-readonly="true" class="dial" />
        </div>
        <div class="span3 knob">
          <h4>Warning</h4>
          <input type="text" value="66" data-width="120" data-fgcolor="#FFA93C" data-readonly="true" class="dial" />
        </div>
        <div class="span3 knob">
          <h4>Total</h4>
          <input type="text" value="92" data-width="120" data-fgcolor="#333" data-readonly="true" class="dial" />
        </div>
      </div>
      <div class="row-fluid">
        <div class="span4">
          <ul class="stat-list">
            <li>
              <label class="label-warning"><i class="icon-fire icon-white"></i></label>
              <h4>375</h4>
              <h4 class="sub">fires</h4>
            </li>
            <li>
              <label class="label-important"><i class="icon-heart icon-white"></i></label>
              <h4>103</h4>
              <h4 class="sub">hearts</h4>
            </li>
            <li>
              <label class="label-success"><i class="icon-leaf icon-white"></i></label>
              <h4>92</h4>
              <h4 class="sub">bugs</h4>
            </li>
            <li>
              <label class="label-info"><i class="icon-tint icon-white"></i></label>
              <h4>865</h4>
              <h4 class="sub">leaks</h4>
            </li>
            <li>
              <label class="label-inverse"><i class="icon-road icon-white"></i></label>
              <h4>65</h4>
              <h4 class="sub">miles</h4>
            </li>
          </ul>
        </div>
        <div class="span4">
          <div class="peity"><span class="pbar">5,3,8,7,9,1,2,6,5,8</span>
            <h4>71 </h4>
            <h4 class="sub">signups</h4>
          </div>
          <div class="peity"><span class="pbar">2,7,6,2,9,8,6,0,1,3</span>
            <h4>96</h4>
            <h4 class="sub">bounces</h4>
          </div>
          <div class="peity"><span class="pbar">8,9,6,5,7,3,1,4,2,1</span>
            <h4>25</h4>
            <h4 class="sub">ad views</h4>
          </div>
          <div class="peity"><span class="pbar">4,5,3,7,4,6,5,6,3,4</span>
            <h4>82</h4>
            <h4 class="sub">comments</h4><br />
          </div>
        </div>
        <div class="span4">
          <div class="spark">
            <h4>DAX <span class="sparklines"></span></h4>
            <h4 class="sub">310.5 <span class="minus">-0.45</span></h4>
          </div>
          <div class="spark">
            <h4>mPAX <span class="sparklines"></span></h4>
            <h4 class="sub">6170.4 <span class="plus">+0.21</span></h4>
          </div>
          <div class="spark">
            <h4>FTSE <span class="sparklines"></span></h4>
            <h4 class="sub">5711.1 <span class="plus">+0.31</span></h4>
          </div>
        </div>
      </div>
      <hr />
      <h4>Status Widgets</h4>
      <div class="stats">
        <div class="row-fluid">
          <div class="span3">
            <div class="stat info">
              <h2>21</h2>
              <h6>Tweets</h6>
            </div>
          </div>
          <div class="span3">
            <div class="stat danger">
              <h2>04</h2>
              <h6>Comments</h6>
            </div>
          </div>
          <div class="span3">
            <div class="stat warning">
              <h2>17</h2>
              <h6>Photos</h6>
            </div>
          </div>
          <div class="span3">
            <div class="stat inverse">
              <h2>12</h2>
              <h6>Followers</h6>
            </div>
          </div>
        </div>
      </div>
      <div class="row-fluid">
        <div class="span6">
          <div class="widget">
            <table style="width:100%">
              <tr>
                <td class="bar-label">Laptop</td>
                <td class="bar-number">324</td>
                <td>
                  <div class="progress">
                    <div style="width:75%" class="bar"></div>
                  </div>
                </td>
              </tr>
              <tr>
                <td class="bar-label">Desktop</td>
                <td class="bar-number">91</td>
                <td>
                  <div class="progress">
                    <div style="width: 30%;" class="bar"></div>
                  </div>
                </td>
              </tr>
              <tr>
                <td class="bar-label">Mobile</td>
                <td class="bar-number">284</td>
                <td>
                  <div class="progress">
                    <div style="width: 60%;" class="bar"></div>
                  </div>
                </td>
              </tr>
            </table>
          </div>
        </div>
        <div class="span6">
          <div class="widget">
            <table style="width:100%">
              <tr>
                <td class="bar-label">Laptop</td>
                <td class="bar-percent">23<span>%</span></td>
                <td>
                  <div class="progress">
                    <div style="width:23%" class="bar bar-danger"></div>
                  </div>
                </td>
              </tr>
              <tr>
                <td class="bar-label">Desktop</td>
                <td class="bar-percent">91<span>%</span></td>
                <td>
                  <div class="progress">
                    <div style="width: 91%;" class="bar bar-success"></div>
                  </div>
                </td>
              </tr>
              <tr>
                <td class="bar-label">Server</td>
                <td class="bar-percent">18<span>%</span></td>
                <td>
                  <div class="progress">
                    <div style="width: 18%;" class="bar bar-warning"></div>
                  </div>
                </td>
              </tr>
            </table>
          </div>
        </div>
      </div>
      <hr />
      <div class="row-fluid">
        <div class="span6">
          <div class="table-panel">
            <h4> <i class="icon-eye-open"></i>Browsers</h4>
            <table class="table table-striped sortable">
              <thead>
                <tr>
                  <th>Browser</th>
                  <th>Visitors</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Firefox</td>
                  <td>9580</td>
                </tr>
                <tr>
                  <td>Chrome</td>
                  <td>7668</td>
                </tr>
                <tr>
                  <td>Safari</td>
                  <td>3021</td>
                </tr>
                <tr>
                  <td>Internet Explorer</td>
                  <td>1011</td>
                </tr>
                <tr>
                  <td>Opera</td>
                  <td>922</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <div class="span6">
          <div class="table-panel">
            <h4> <i class="icon-share-alt"></i>Referrers</h4>
            <table class="table table-striped sortable">
              <thead>
                <tr>
                  <th>URL</th>
                  <th>Visits</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td> <a href="">google.com</a></td>
                  <td>17665</td>
                </tr>
                <tr>
                  <td><a href="">bing.com</a></td>
                  <td>24588</td>
                </tr>
                <tr>
                  <td><a href="">logobro.com</a></td>
                  <td>13022</td>
                </tr>
                <tr>
                  <td><a href="">yahoo.com</a></td>
                  <td>8922</td>
                </tr>
                <tr>
                  <td><a href="">duckduckgo.com</a></td>
                  <td>11014</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <hr />
      <h4>Status Panels</h4>
      <div class="panel">
        <div class="top primary"><i class="batch-big b-database"></i>
          <h6>database</h6>
        </div>
        <div class="bottom">
          <h2>7720</h2>
          <h6>rows</h6>
        </div>
      </div>
      <div class="panel">
        <div class="top warning"><i class="batch-big b-flag"></i>
          <h6>warnings</h6>
        </div>
        <div class="bottom">
          <h2>21</h2>
          <h6>service requests</h6>
        </div>
      </div>
      <div class="panel">
        <div class="top success"><i class="batch-big b-code"></i>
          <h6>Code Size</h6>
        </div>
        <div class="bottom">
          <h2>2034</h2>
          <h6>loc</h6>
        </div>
      </div>
      <div class="panel">
        <div class="top danger"><i class="batch-big b-comment"></i>
          <h6>Communication</h6>
        </div>
        <div class="bottom">
          <h2>596</h2>
          <h6>comments</h6>
        </div>
      </div>
      <div class="panel">
        <div class="top"><i class="batch-big b-alarm"></i>
          <h6>Time Remaining</h6>
        </div>
        <div class="bottom">
          <h2>51</h2>
          <h6>minutes</h6>
        </div>
      </div>
      <div class="panel">
        <div class="top purple"><i class="batch-big b-wifi"></i>
          <h6>WiFi Range</h6>
        </div>
        <div class="bottom">
          <h2>86%</h2>
          <h6>availability</h6>
        </div>
      </div>
      <div class="panel">
        <div class="top info"><i class="batch-big"></i>
          <h6>Locations</h6>
        </div>
        <div class="bottom">
          <h2>45</h2>
          <h6>sites</h6>
        </div>
      </div>
    </div>
  </div>
</div><script type="text/javascript">
(function() {
  var delay;

  delay = function(ms, func) {
    return setTimeout(func, ms);
  };

  toastr.options = {
    positionClass: 'toast-bottom-left'
  };

}).call(this);
</script>
      </div>
    </div>
    <footer>
      <div class="container">
        <div class="row">
          <div class="span12">
            <p class="pull-right">Admin Theme by Nathan Speller</p>
            <p>&copy; Copyright 2013 FreelanceLeague</p>
          </div>
        </div>
      </div>
    </footer>
  </body>
</html>