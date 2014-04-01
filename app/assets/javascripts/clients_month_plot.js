$(document).ready(function(){

console.log($('#clients_month_json').val())

var object_json = JSON.parse($('#clients_month_json').val());
    
    // object_json.each 
var d1 = [];
var ticks = [];

$.each(object_json, function(idx, obj) {
    // alert(obj.tagName);
   var d = [idx, obj.amount] 
   var dname = [idx, obj.name] 
   d1.push(d);
   ticks.push(dname);
});
console.log(d1);
// JSON.stringify(d1)

// var d1 = [[0, 3], [1, 3], [2, 5], [3, 7], [4, 8], [5, 10], [6, 11], [7, 9], [8, 5], [9, 13]];
// var d1 = [[0, 3], [1, 3], [2, 5], [3, 7], [4, 8], [5, 10]];
// var dataset = [{ label: "2012 Average Temperature", data: d1, color: "#5482FF" }];
var dataset = [{ label: "Clientes del mes Anterior", data: d1, color: "#5482FF" }];
// var ticks = [[0, "London"], [1, "New York"], [2, "New Delhi"], [3, "Taipei"],[4, "Beijing"], [5, "Sydney"]];
 

var options = {
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
        ticks: ticks
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
$.plot($("#placeholder_month"), dataset, options);
// $.plot($("#placeholder1"), dataset, options);

});



});