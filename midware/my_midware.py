from flask import Flask
from flask import render_template
from flask import request

import pymysql
from pymysql import cursors

import os

db_host = os.environ.get('DB_HOST')

if not db_host:
    db_host = '127.0.0.1'

contaienr_name = "velcom-database"

db_username = "velcom"
db_userpass = "velcom_alksdjflkakjei"
db_rootpass = "velcom_rootlkdjalienfklae"

db_name = "velcom"
table_msg_name = "velcom_msg"

# 全局变量
message_list = []


def process_input(request: request):

    one_message = request.form.get('msg')

    # message_list.append('here comes from process input.')
    # message_list.append(one_message)

    db = pymysql.connect(host=db_host,
                         user=db_username,
                         password=db_userpass,
                         database=db_name)
    cursor = db.cursor()
    if one_message:
        cursor.execute(
            f'INSERT INTO {table_msg_name} (msg) VALUES ("{one_message}")')
    db.commit()
    db.close()

    pass


def process_output():
    db = pymysql.connect(host=db_host,
                         user=db_username,
                         password=db_userpass,
                         database=db_name)
    cursor = db.cursor()
    cursor.execute(f'SELECT * FROM {table_msg_name}')
    results = cursor.fetchall()

    message_list.clear()

    for row in results:
        message_list.append(row[1])

    db.close()

    pass

    output_dict = {}
    output_dict['messages'] = message_list

    return output_dict


app = Flask(__name__)


@app.route("/")
def index():
    process_input(request)
    output_dict = process_output()

    return render_template('echo_ui.jinja2', bean=output_dict)


@app.route("/echo.php", methods=['POST', 'GET'])
def do_echo():
    process_input(request)
    output_dict = process_output()

    # message_list = output_dict['messages']
    # message_list.append('here from /echo.php')

    return render_template('echo_ui.jinja2', bean=output_dict)


if __name__ == '__main__':
    app.run()
