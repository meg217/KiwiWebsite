from flask import Flask, render_template, request
import pymysql

app = Flask(__name__, static_folder='static')

DB_HOST = 'localhost'
DB_USER = 'mmueller7'
DB_PASSWORD = 'Ladybug560!'
DB_NAME = 'kiwi_electronics'

def get_database_connection():
    return pymysql.connect(host=DB_HOST, user=DB_USER, password=DB_PASSWORD, database=DB_NAME)

@app.route('/')
def index():
    connection = get_database_connection()

    cursor = connection.cursor()
    cursor.execute("SELECT * FROM kiwi_electronics.product")
    products = cursor.fetchall()
    cursor.close()

    connection.close()

    return render_template('KiwiWebsite.html', products=products)

@app.route('/search', methods=['GET'])
def search_products():
    query = request.args.get('query', default='')
    category = request.args.get('category', default='*')
    price = request.args.get('price', default='*')

    print(f"Query: {query}, Category: {category}, Price: {price}")

    connection = get_database_connection()
    cursor = connection.cursor()

    # Modify the SQL query based on the filter parameters
    sql_query = "SELECT * FROM kiwi_electronics.product WHERE Item_Name LIKE %s"
    params = [f"%{query}%"]

    if category and category != '*':
        sql_query += " AND Category = %s"
        params.append(category)
    if price and price != '*':
        if price == 'low':
            sql_query += " AND Price < 100"
        else:
            sql_query += " AND Price >= 100"

    print("SQL Query:", sql_query, "Parameters:", params)

    # Execute the SQL query with the parameters
    cursor.execute(sql_query, params)
    search_results = cursor.fetchall()
    cursor.close()
    connection.close()

    print("Search Results:", search_results)
    print("Number of Products:", len(search_results))

    return render_template('KiwiWebsite.html', search_results=search_results)

if __name__ == '__main__':
    app.run(debug=True)
