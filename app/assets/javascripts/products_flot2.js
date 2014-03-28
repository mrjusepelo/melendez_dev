$(document).ready(function(){

console.log($('#products_json2').val())

var object_json2 = JSON.parse($('#products_json2').val());
    
    // object_json.each 
var d2 = [];
var ticks2 = [];

$.each(object_json2, function(idx, obj) {
    // alert(obj.tagName);
   var d = [idx, obj.amount] 
   var dname = [idx, obj.name] 
   d2.push(d);
   ticks2.push(dname);
});
console.log(d2);
// JSON.stringify(d1)

// var d1 = [[0, 3], [1, 3], [2, 5], [3, 7], [4, 8], [5, 10], [6, 11], [7, 9], [8, 5], [9, 13]];
// var d1 = [[0, 3], [1, 3], [2, 5], [3, 7], [4, 8], [5, 10]];
// var dataset = [{ label: "2012 Average Temperature", data: d1, color: "#5482FF" }];
var dataset2 = [{ label: "Productos mas Vendidos mes Anterior", data: d2, color: "#5482FF" }];
// var ticks = [[0, "London"], [1, "New York"], [2, "New Delhi"], [3, "Taipei"],[4, "Beijing"], [5, "Sydney"]];
 

var options2 = {
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
        ticks: ticks2
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
$.plot($("#placeholder2"), dataset2, options2);
// $.plot($("#placeholder1"), dataset, options);

});



});