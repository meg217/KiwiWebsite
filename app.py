from flask import Flask, render_template
import pymysql

app = Flask(__name__, static_folder='static')

DB_HOST = 'localhost'
DB_USER = 'mmueller'
DB_PASSWORD = 'rosebud560'
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

    print(products)

    connection.close()

    return render_template('KiwiWebsite.html', products=products)

if __name__ == '__main__':
    app.run(debug=True)
