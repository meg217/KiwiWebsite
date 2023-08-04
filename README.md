# KiwiWebsite
using mySQL database:
    
    -make sure to remember your password when setting up mysql

    -install mySQL, download the dump file from discord from Venny
    
    -install python https://www.python.org/downloads/windows/ ... windowns installer 64 bit
    
    -router config checkbox the bootstrap and name the host localhost and any other user pass you want
    
    -first thig is to set up mysql, select the all and download
   
    -go to mysql and import data, import it from the dump file into a new schema named kiwi_website
    
    -the datatable should now be set up

using the flask db connector:

    -pip install flask

    -pip install pymysql 

    -pip install cryptography

    -pip install flask-session

    -python app.py

    -then the create the connection run python app.py
    
using the css and html code:
    
    -the app.py creates the connection and everything should be all set up for that
    
    -working on querrying through the products from the database
    
    to do:
    
    -all of the image url's still need to be set up
    
    -all of the html's need to be set o=up on that app.py
    
    -retreiving the info from the user from the inputs (ie email and password)
   
    -creating all of the features ie search bar


    link examples: 
    
    imput text from website to database: https://stackoverflow.com/questions/42662502/getting-the-input-from-html- 
    form-and-storing-it-in-mysql-through-flask

    adding htmls to app.py: https://stackoverflow.com/questions/58147040/python-flask-sql-query-to-html-page-table

    querrying through products in html: https://stackoverflow.com/questions/66212883/python-and-flask-display-data-out-of-mysql-db-on-html-page

When trying to run the project:

    -download KiwiWebsiteVersion(FINAL).zip 

    -extract it and take the extracted folder and place it into your python virtual environment, which is where all the aforementioned libraries should be

    -after which download kiwi_elec(FINAL).sql 

    -open your MySQL root local server, navigate to the File button on the top left and press Open SQL Script in the drop down, after which you navigate to
    where you stored kiwi_elec(FINAL).sql and click it once you run the SQL script it should create the database used to run the website

    -If you complete all the previous steps exactly you simply need to run the command python app.py in the python terminal to run the website, following
    which you crtl+left click the url in the python terminal to go the website on your browser.    
    


    

