/*
 * ADMIN MAIN
*/

var AdminMain = function() {
	
	function memberCountChart(user, admin) {
		$(document).ready(function(){
		    var line1 = [['Member', user],['Admin', admin]];

		    $('#chart1').jqplot([line1], {
		        title:'Total Member Count',
		        animate: !$.jqplot.use_excanvas,
		        seriesDefaults:{
		            renderer:$.jqplot.BarRenderer,
		            rendererOptions: {
		                // Set the varyBarColor option to true to use different colors for each bar.
		                // The default series colors are used.
		                varyBarColor: true,
		                fillToZero: true
		            }
		        },
		        axes:{
		            xaxis:{
		                renderer: $.jqplot.CategoryAxisRenderer
		            }
		        }
		    });
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
