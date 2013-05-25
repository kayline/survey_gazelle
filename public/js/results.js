$(document).ready(function() {
  var test_data = [2,3,1,7,2];
  var results_hash = $("#results_json").val();
  console.log(results_hash);
  var results_str = results_hash.toString();
  console.log(results_str);
 
  var real_data = [];
  var chart = d3.select(".container").append("div")
      .attr("class", "chart");
  var x = d3.scale.linear()
      .domain([0, d3.max(test_data)])
      .range(["0px", "600px"]);
  chart.selectAll("div")
      .data(test_data)
    .enter().append("div")
      .style("width", x)
      .text(function(d) { return d; });


  


});