var months = new Array(12);
months[0] = "January";
months[1] = "February";
months[2] = "March";
months[3] = "April";
months[4] = "May";
months[5] = "June";
months[6] = "July";
months[7] = "August";
months[8] = "September";
months[9] = "October";
months[10] = "November";
months[11] = "December";

var current_date = new Date();
// current_date.setDate(current_date.getDate() + 15);
month_value = current_date.getMonth();
day_value = current_date.getDate();
year_value = current_date.getFullYear();

// document.write("The current date is " + months[month_value] + " " + day_value + ", " + year_value);