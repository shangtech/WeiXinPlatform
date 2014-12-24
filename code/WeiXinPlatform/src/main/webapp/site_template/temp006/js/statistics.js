/* 
 *  统计模块：statistics
 * ----------------------------------
 *  作者：Charles
 *  时间：2014-04-26
 *  准则：CMD 规范
 *  联系：16295853（qq）
 ************************************************************/

define(function(require, exports, module){

	//引用相关模块
	var $ = require('lib/zepto/zepto');

	//appid
	var activityID = $('body').data('app-id');
	//统计接口
	var statistics = {

			//行为统计
			behaviorStatistics: function (plugType) {
				$.ajax({
					url : '/analyseplugin/plugin?activity_id='+activityID+'&plugtype='+plugType,
					type : 'get',
				});
			},
			//多点投放统计
			multiStatistics: function () {
				var channel_id = location.search.substr(location.search.indexOf("channel=") + 8);
				channel_id= channel_id.match(/^\d+/);
				if (!channel_id || isNaN(channel_id) || channel_id<0) {
					channel_id = 1;
				}

				//统计当前页数据
				$.ajax({
					type : "POST",
					cache : false,
					url : '/brand/analyse/'+activityID+'?channel='+channel_id,
					data : {channel : channel_id},
					dataType : "json",
					success : function(msg) {
						if (msg.result) {
							//alert('操作成功！');
						} else {
							//alert("操作失败，" + msg.msg);
						}
					}
				});			
			}
		};

	//PV统计
	//setTimeout(function() {
		statistics.multiStatistics();
	//}, 2000);

	//输出模块接口
	module.exports = statistics;
	
});