from flask import Flask, render_template, request, redirect, url_for, session, flash
from flask_session import Session
import pymysql
import uuid
import decimal


app = Flask(__name__, static_folder='static')
app.config['SESSION_TYPE'] = 'filesystem'
app.config['SESSION_PERMANENT'] = False
Session(app)

DB_HOST = 'localhost'
DB_USER = 'mmueller7'
DB_PASSWORD = 'Ladybug560!'
DB_NAME = 'kiwi_electronics'

def get_database_connection():
    return pymysql.connect(host=DB_HOST, user=DB_USER, password=DB_PASSWORD, database=DB_NAME)

@app.route('/index')
def index():
    if 'session_id' not in session:
        session['session_id'] = str(uuid.uuid4())  

    connection = get_database_connection()

    cursor = connection.cursor()
    cursor.execute("SELECT * FROM kiwi_electronics.product")
    products = cursor.fetchall()
    cursor.close()

    connection.close()

    return render_template('KiwiWebsite.html', products=products)

@app.route('/process_checkout', methods=['POST'])
def process_checkout():
    if request.method == 'POST':
        account_id = session.get('account_id')
        session_id = session.get('session_id')
        connection = get_database_connection()
        cursor = connection.cursor()

        user_info_query = "SELECT First_Name, Last_Name, Ship_Street, Ship_City, Ship_State, Ship_zip FROM kiwi_electronics.user_account WHERE Account_ID = %s"
        cursor.execute(user_info_query, (account_id,))
        user_info = cursor.fetchone()

        first_name, last_name, shipping_street, shipping_city, shipping_state, shipping_zip = user_info

        cart_query = "SELECT * FROM kiwi_electronics.cart WHERE Session = %s AND Account_ID = %s"
        cursor.execute(cart_query, (session_id, account_id))
        items = cursor.fetchall()
        cursor.close()

        # Convert float to decimal for all relevant values
        cart_total = sum(decimal.Decimal(str(item[5])) * item[3] for item in items)
        tax_rate = 0.0825
        tax_amount = cart_total * decimal.Decimal(str(tax_rate))
        final_total = cart_total + tax_amount

        # Handle the coupon code
        coupon_code = request.form.get('coupon_code')
        if coupon_code:
            coupon_query = "SELECT value FROM kiwi_electronics.discounts WHERE code = %s"
            cursor.execute(coupon_query, (coupon_code,))
            coupon_value = cursor.fetchone()

            if coupon_value:
                coupon_value = coupon_value[1]
                final_total -= coupon_value

        cart_total = round(cart_total, 2)
        final_total = round(final_total, 2)

        checkout_query = "INSERT INTO kiwi_electronics.checkout (account_id, Session, cart_total, shipping_name, shipping_street, shipping_region, final_total) VALUES (%s, %s, %s, %s, %s, %s, %s)"
        checkout_params = (account_id, session_id, cart_total, f"{first_name} {last_name}", shipping_street, f"{shipping_city}, {shipping_state}, {shipping_zip}", final_total)
        cursor = connection.cursor()
        cursor.execute(checkout_query, checkout_params)
        connection.commit()

        delete_query = "DELETE FROM kiwi_electronics.cart WHERE Session = %s AND Account_ID = %s"
        cursor.execute(delete_query, (session_id, account_id))
        connection.commit()

        cursor.close()
        connection.close()

        flash("Checkout successful!")
        
        return redirect(url_for('checkout_page'))

        
@app.route('/checkout')
def checkout_page():
    connection = get_database_connection()
    session_id = session.get('session_id')
    cursor = connection.cursor()

    checkout_query = "SELECT * FROM kiwi_electronics.checkout WHERE Session = %s ORDER BY Checkout_ID DESC LIMIT 1"
    cursor.execute(checkout_query, (session_id,))
    record = cursor.fetchone()
    cursor.close()
    connection.close()

    # Check if a coupon was applied and update the record accordingly
    coupon_code = request.form.get('coupon_code')
    if coupon_code and 'final_total' in record:
        record['coupon_code'] = coupon_code
        connection = get_database_connection()
        cursor = connection.cursor()
        update_query = "UPDATE kiwi_electronics.checkout SET coupon_code = %s WHERE Checkout_ID = %s"
        cursor.execute(update_query, (coupon_code, record['Checkout_ID']))
        connection.commit()
        cursor.close()
        connection.close()

    return render_template('checkout.html', record=record)





@app.route('/invoice')
def invoice_page():
        connection = get_database_connection()
        session_id = session.get('session_id')
        cursor = connection.cursor()

        checkout_query = "SELECT * FROM kiwi_electronics.checkout WHERE Session = %s"
        cursor.execute(checkout_query, (session_id,))
        record = cursor.fetchone()
        cursor.close()
        connection.close()
        return render_template('invoice.html', record = record)


@app.route('/add', methods=['POST'])
def add_product_to_cart():
    if request.method == 'POST':
        product_id = request.form.get('product_id')
        if not product_id:
            flash("Product ID not found")
            return redirect(url_for('index'))
        
        account_id = session.get('account_id')
        if not account_id:
            flash("account is not logged in")
        
        connection = get_database_connection()
        cursor = connection.cursor()

        cursor.execute("SELECT * FROM kiwi_electronics.product WHERE Item_ID = %s", (product_id,))
        product = cursor.fetchone()

        if not product:
            flash("Product not found")
            cursor.close()
            connection.close()
            return redirect(url_for('index'))
        
        print("product",product)
        print("session",session)
        print("account id", account_id)
        
        cart_query = "INSERT INTO kiwi_electronics.cart (Session, Account_ID, Item_ID, Quantity, Price, Timestamp, Item_Name) VALUES (%s, %s, %s, %s, %s, NOW(), %s)"
        cart_params = (session['session_id'], account_id, product_id, 1, product[4], product[1])
        cursor.execute(cart_query, cart_params)

        connection.commit()
        cursor.close()
        connection.close()

        flash("Product added! YAY!")
        return redirect(url_for('index'))


@app.route('/cart')
def cart():
    connection = get_database_connection()
    session_id = session.get('session_id')
    account_id = session.get('account_id')
    print("Session ID:", session_id)
    print("Account ID:", account_id)
    cursor = connection.cursor()

    cart_query = "SELECT * FROM kiwi_electronics.cart WHERE Session = %s AND Account_ID = %s"
    cursor.execute(cart_query, (session_id, account_id))
    items = cursor.fetchall()
    cursor.close()
    connection.close()
    total_price = sum(item[5] for item in items)

    return render_template('cart.html', items = items, total_price = total_price)

@app.route('/clear_cart', methods=['POST'])
def clear_cart():
    connection = get_database_connection()
    cursor = connection.cursor()

    session_id = session.get('session_id')
    account_id = session.get('account_id')

    # need to add a way to only delete the user's cart and not other user carts
    delete_query = "DELETE FROM kiwi_electronics.cart WHERE Session = %s AND Account_ID = %s"
    cursor.execute(delete_query, (session_id, account_id))

    connection.commit()
    cursor.close()
    connection.close()

    flash("Cart data cleared!")
    return redirect(url_for('cart'))

@app.route('/delete_item', methods=['POST'])
def delete_item():
    cart_id = int(request.form.get('Cart_ID'))
    connection = get_database_connection()
    cursor = connection.cursor()

    session_id = session.get('session_id')
    account_id = session.get('account_id')

    delete_query = "DELETE FROM kiwi_electronics.cart WHERE Session = %s AND Account_ID = %s AND Cart_ID = %s "
    cursor.execute(delete_query, (session_id, account_id, cart_id))

    connection.commit()
    cursor.close()
    connection.close()

    flash("Item deleted!")
    return redirect(url_for('cart'))


@app.route('/search', methods=['GET'])
def search_products():
    query = request.args.get('query', default='')
    category = request.args.get('category', default='*')
    price = request.args.get('price', default='*')

    print(f"Query: {query}, Category: {category}, Price: {price}")

    connection = get_database_connection()
    cursor = connection.cursor()

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

    cursor.execute(sql_query, params)
    search_results = cursor.fetchall()
    cursor.close()
    connection.close()

    print("Search Results:", search_results)
    print("Number of Products:", len(search_results))

    return render_template('KiwiWebsite.html', search_results=search_results)

#new
@app.route('/', methods=['GET', 'POST'])
def login_or_register():
    if 'account_id' in session:
        return redirect(url_for('index'))


    if request.method == 'POST':
        if 'login' in request.form:
            return handle_login()
        elif 'register' in request.form:
            return handle_registration()
        else:
            flash("Invalid action")

    #default value for welcome msg
    session['msg_status'] = True
    #returning a render template along with a variable show_welcome
    return render_template('login.html', show_welcome = session['msg_status'])

#new
@app.route('/login', methods=['GET', 'POST'])
def handle_login():
#     if 'account_id' in session:
#          return redirect(url_for('index'))
    
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')
        account_id = validate_credentials(email, password)

        #session['session_id'] = f"{session['session_id']}_{account_id}"
        session['session_id'] = str(uuid.uuid4())

        if account_id is not None:
            session['account_id'] = account_id
            flash("Login successful")
            return redirect(url_for('index'))
        else:
            flash("Invalid email or password")
            return redirect(url_for('login_or_register'))

#new
@app.route('/registration', methods=['GET', 'POST'])
def handle_registration():
    
    #get information from registration form
    if request.method == 'POST':
        first_name = request.form.get('firstName')
        last_name = request.form.get('lastName')
        email = request.form.get('email')
        password = request.form.get('password')
        phone_number = request.form.get('phoneNumber')
        street = request.form.get('street')
        city = request.form.get('city')
        state = request.form.get('state')
        zip_code = request.form.get('zip')

    #get DB connection
    connection = get_database_connection()
    cursor = connection.cursor()

    #insert into user_account
    insert_query = "INSERT INTO kiwi_electronics.user_account (First_Name, Last_Name, Email, Password, Phone_Number, Ship_Street, Ship_City, Ship_State, Ship_zip, Bill_Street, Bill_City, Bill_State, Bill_zip) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
    user_params = (first_name, last_name, email, password, phone_number, street, city, state, zip_code, street, city, state, zip_code)
    cursor.execute(insert_query, user_params)


    connection.commit()
    cursor.close()
    connection.close()


    flash("Registration successful! You can now log in.")
    return redirect(url_for('login_or_register'))

#new
@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('login_or_register'))


def validate_credentials(email, password):
    connection = get_database_connection()
    cursor = connection.cursor()
    print(email)
    print(password)
    cursor.execute("SELECT Account_ID FROM kiwi_electronics.user_account WHERE Email = %s AND Password = %s", (email, password))
    account = cursor.fetchone()
    print(account)
    cursor.close()
    connection.close()

    if account is None:
        return None
    else:
        return account[0]

if __name__ == '__main__':
    app.run(debug=True)
