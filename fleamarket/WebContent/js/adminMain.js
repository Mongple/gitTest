/*
 * ADMIN MAIN
*/

var AdminMain = function() {
	
	function memberCountChart(user, admin) {
		$(document).ready(function(){

		    $.jqplot.config.enablePlugins = true;
		    var s1 = [['Member', user],['Admin', admin]];
		    
		     
		    plot1 = $.jqplot('chart1', [s1], {
		    	title: 'Total Member Count',
		        animate: !$.jqplot.use_excanvas,
		        seriesColors:['#ff3d00', '#ff3d00'],
		        negativeSeriesColors:['#bdbdbd', '#bdbdbd'],
		        seriesDefaults:{
		            renderer:$.jqplot.BarRenderer,
		            rendererOptions: {
		                fillToZero: true
		            },
		            pointLabels: { show: true }
		        },
		        axes: {
		            xaxis: {
		                renderer: $.jqplot.CategoryAxisRenderer
		               
		            }
		        },
		        highlighter: { show: false }
		    });
		 
		    $('#chart1').bind('jqplotDataClick', 
		        function (ev, seriesIndex, pointIndex, data) {
		            $('#info1').html('series: '+seriesIndex+', point: '+pointIndex+', data: '+data);
		        }
		    );
		    
		    
		    
		    
		    
		});
	}

	function boardCountChart(notice, wear, product) {
		var data = [ [ 'Notice Board', notice]
				, [ 'Wear Board', wear]
				, [ 'Product Board', product] ];
		var plot2 = jQuery.jqplot('chart2', [ data ], {
			title:'Board Type Data Rate',
			seriesDefaults : {
				renderer : jQuery.jqplot.PieRenderer,
				rendererOptions : {
					// Turn off filling of slices.
					fill : false,
					showDataLabels : true,
					// Add a margin to seperate the slices.
					sliceMargin : 4,
					// stroke the slices with a little thicker line.
					lineWidth : 5
				}
			},
			legend : {
				show : true,
				location : 'e'
			}
		});
	}
	
	return {
		memberCountChart : memberCountChart,
		boardCountChart : boardCountChart
	}
	
}
