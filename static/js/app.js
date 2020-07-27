// function for plotting pie
function plotPie(labels, values){
    var trace = {
        type: 'pie',
        labels: labels,
        values: values
    }   
    var layout = {
        width: 450,
        height: 450,
        title:'Suicides by Gender'
    }
    var config = {responsive: true}
    Plotly.newPlot('pie_gender', [trace], layout, config);
}

// Load the data and plot the default pie chart
d3.json('/api/suicides_by_gender').then(function(data){
    // console.log(data) 
    var labels = Object.keys(data)
    var values = Object.values(data)
    plotPie(labels,values)
});

d3.json('/api/suicides_and_gdp').then(function(data){
   
    var countries = []
    var suicides = []
    var gdp = []

    Object.entries(data).forEach(function([key,value]){
        countries.push(key);
        suicides.push(value.suicides);
        gdp.push(value.gdp)
    })
    
    var trace1 = {
        x: gdp,
        y: suicides,
        mode: 'markers',
        type: 'scatter',
        name: 'Suicides vs GDP',
        text: countries,
        marker: { size: 12 }
      };
    
    var data = [trace1];
    
    var layout = {
        width: 450,
        height: 450,
        xaxis: {
            title: 'gdp per capita'
        },
        yaxis: {
            title: 'suicides rates per 100k'
        },
        title:'Suicides vs GDP'
    };
    
    var config = {responsive: true}

    Plotly.newPlot('scatter_gdp', data, layout, config);
});



d3.json("/api/suicides_by_country").then(function(data){
    
    var data = [{
            x: Object.keys(data),
            y: Object.values(data),
            type: 'bar'
        }];

    var layout = {
        width: 450,
        height: 450,
        title:'Suicides by Country'
    }
    var config = {responsive: true}

    Plotly.newPlot('bar_by_country', data, config);
})



d3.json('/api/suicides_per_100k_by_year').then(function (data) {
    var gd = document.getElementById('lineDiv');
    var data = [{
        mode: 'lines',
        x:Object.keys(data),
        y:Object.values(data)
    }]
    
    var layout = {
        width: 450, 
        height: 450,
        title: "Average number of suicides per 100K <br>(from 1997 to 2014)",
        xaxis: {
            title: 'year'
        },
        yaxis: {
            title: 'suicides per 100k'
        },
    }
    var config = {responsive: true}

    Plotly.newPlot('line_yearly', data, layout, config);
});



// Suicides by Age
d3.json('/api/suicides_by_age').then(function(data){
    // console.log(data);
    var ageLabels = Object.keys(data)
    var ageValues = Object.values(data)
    // console.log(ageLabels,ageValues);
    var trace1 = {
      type: "scatter",
      mode: "markers",
      x: ageLabels,
      y: ageValues
    }
    
    var layout = {
        width: 450,
        height: 450,
        xaxis: {
            title: 'Age Group'
        },
        yaxis: {
            title: 'Suicides'
        },
        title: 'Suicides by Age'
    }
    var config = {responsive: true}

    Plotly.newPlot("scatter_age", [trace1], layout, config);
  });


d3.json('/api/suicides_and_hdi').then(function(data){
    // console.log(data)
    
    var countries = []
    var suicides = []
    var hdi = []

    Object.entries(data).forEach(function([key,value]){
        countries.push(key);
        suicides.push(value.suicides);
        hdi.push(value.hdi)
    })

    var trace1 = {
        type: "scatter",
        mode: "markers",
        x: hdi,
        y: suicides,
        text: countries,
        marker: {
            size: 8,
            color:'orange'
        }
      }
      
    var layout = {
        width: 450,
        height: 350,
        xaxis: {
            title: 'Human Development Index'
        },
        yaxis: {
            title: 'Suicides'
        },
        title: 'Suicides vs HDI'
    }
    
    var config = {responsive: true}

    Plotly.newPlot("scatter_hdi", [trace1], layout, config);
})