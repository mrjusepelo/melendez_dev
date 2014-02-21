$(document).ready(function(){

console.log($('#products_json3').val())

var object_json3 = JSON.parse($('#products_json3').val());
    
    // object_json.each 
var d3 = [];
var ticks3 = [];

$.each(object_json3, function(idx, obj) {
    // alert(obj.tagName);
   var d = [idx, obj.amount] 
   var dname = [idx, obj.name] 
   d3.push(d);
   ticks3.push(dname);
});
console.log(d3);
// JSON.stringify(d1)

// var d1 = [[0, 3], [1, 3], [2, 5], [3, 7], [4, 8], [5, 10], [6, 11], [7, 9], [8, 5], [9, 13]];
// var d1 = [[0, 3], [1, 3], [2, 5], [3, 7], [4, 8], [5, 10]];
// var dataset = [{ label: "2012 Average Temperature", data: d1, color: "#5482FF" }];
var dataset3 = [{ label: "2014 Productos mas Vendidos", data: d3, color: "#5482FF" }];
// var ticks = [[0, "London"], [1, "New York"], [2, "New Delhi"], [3, "Taipei"],[4, "Beijing"], [5, "Sydney"]];
 

var options3 = {
    series: {
        bars: {
            show: true
        }
    },
    bars: {
        align: "center",
        barWidth: 0.5
    },
    xaxis: {
        axisLabel: "World Cities",
        axisLabelUseCanvas: true,
        axisLabelFontSizePixels: 12,
        axisLabelFontFamily: 'Verdana, Arial',
        axisLabelPadding: 10,
        ticks: ticks3
    },
    yaxis: {
        axisLabel: "Average Temperature",
        axisLabelUseCanvas: true,
        axisLabelFontSizePixels: 12,
        axisLabelFontFamily: 'Verdana, Arial',
        axisLabelPadding: 3,
        // tickFormatter: function (v, axis) {
        //     return v + "°C";
        // }
    },
    legend: {
        noColumns: 0,
        labelBoxBorderColor: "#000000",
        position: "nw"
    },
    grid: {
        hoverable: true,
        borderWidth: 2,
        backgroundColor: { colors: ["#ffffff", "#EDF5FF"] }
    }
};







$(document).ready(function () {
//     $.plot($("#placeholder"), [
//         {
//             data: d1,
//             bars: {
//                 show: true
//             }
//         }
//     ]);
$.plot($("#placeholder3"), dataset3, options3);
// $.plot($("#placeholder1"), dataset, options);

});



});