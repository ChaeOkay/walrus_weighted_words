#[Walrus Weighted Words](https://walrus-weighted-words.herokuapp.com/)

![Walrus Exercising, as walrus' do](https://media4.giphy.com/media/FvfUDSqHruCDm/200.gif)

System dependencies:  
Postgres

Versions:  
Ruby 2.3.0  
Rails 4.2.5a  

To get started:  
$ Bundle install  
$ bin/rake db:create  
$ bin/rake db:schema:load  
$ bin/rake db:migrate  
$ bin/rake db:test:prepare  
create a .env file, see the .sample.env file  
$ rails s  
go to localhost:3000 in your favorite browser  


Project description:  
There is a desperate need to analyze the text on web pages! We'd like you to start development on a web application which allows users to submit URLs and which can perform some rudimentary analysis of the contents at the submitted URL. The people who need this analysis done are non-technical, and can be expected to submit URLs which resolve to pages containing HTML. However, it cannot be assumed that only valid URLs will be submitted.

The first analysis this application should perform is a basic word count. When a valid URL is submitted, the application should identify the 10 most common words that appear as text on the page, and show the user that list of words, along with the frequency with which they appear. (Note that "text" does not include things like on-page JavaScript or CSS.) All previously-scanned URLs should be listed on the index page of the application, along with the most common word at each URL, and the frequency with which it appeared. If a user happens to submit a URL that has already been scanned, they should be shown the results from the previous scan.
