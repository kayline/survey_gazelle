$(document).ready(function() {
  var test_data = [2,3,1,4,2];
  var results_hash = $("#results_json").val();
  console.log(results_hash);
  var results_obj = $.parseJSON(results_hash);
  console.log(results_obj);
  $.each(results_obj, function(question,answers){
    console.log(question);
    var option_counts = [];
    var option_names = [];
    $.each(answers, function(choice){
      $.each(answers[choice], function(content, count){
        option_names.push(content);
        option_counts.push(count);
      });
    });
    console.log(option_names);
    console.log(option_counts);
    var chart_title = d3.select(".container").append("div")
      .attr("class", "chart_title"); 
    chart_title.text(question);
    var chart = d3.select(".container").append("div")
      .attr("class", "chart");
    var x = d3.scale.linear()
      .domain([0, d3.max(option_counts)])
      .range(["0px", "600px"]);
    chart.selectAll("div")
      .data(option_counts)
    .enter().append("div")
      .style("width", x)
      .text(function(d, index) { return option_names[index] + " " + d });
    
  });
});