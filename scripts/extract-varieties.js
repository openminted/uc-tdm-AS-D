// This script extracts the list of varieties for a specific search made on the European Commission
// Plant variety database
// such as "Triticum aestivum" http://ec.europa.eu/food/plant/plant_propagation_material/plant_variety_catalogues_databases/search//public/index.cfm?event=SearchVariety&ctl_type=A&species_id=258&variety_name=&listed_in=0&show_current=on&show_deleted=

// This script should be executed in the console of a web browser
// and a CSV file will be proposed to be downloaded

// go to first "page"
document.getElementsByTagName('a')[43].click();

// get the number of varieties to extract
nb_varieties = document.getElementById('searchresults_var_info').innerText.split('of ')[1].split(' entries')[0].replace(/,/, '');

// force the number of items per page in the html table [TODO:] extract from html
list_length = 10;

// get number of pages in the html table
nb_pages = document.querySelectorAll('li.paginate_button>a')[7].innerText;
variety_list = [];


k = 0;
// parse each page of the html table
for (i=0;i<nb_pages;i++){
  j = 0;
  // parse each row of the html table
  for (line of document.querySelectorAll('tbody>tr')){
    // extract only varieties
    if (j < list_length){
      // limit the number of elements extracted to the number of varieties
      if (k < nb_varieties){
        // extract the name of the variety
        variety = line.querySelectorAll('td')[1].innerText;
        // store the variety
        variety_list.push(variety);
      }
      k++;
    }
    j++;
  }
  // go to next html table page
  document.getElementsByTagName('a')[50].click()
}

// format the string to be csv compliant
var csv_content = "data:text/csv;charset=utf-8," + variety_list.join('\n');
var encodedUri = encodeURI(csv_content);

// create a download link to download the csv file
var link = document.createElement("a");
link.setAttribute("href", encodedUri);
// name the file, keeping track of the date of the download
date = Date().split(' ');
filename = 'triticum-aestivum-varieties-' + date[1] + '-' + date[2] + '-' + date[3] + '.csv';

// download file
link.setAttribute("download", filename);
document.body.appendChild(link);
link.click();

console.log('Varieties extracted, see the downloaded file');
