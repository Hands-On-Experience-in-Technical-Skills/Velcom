from flask import Flask
from flask import render_template
from flask import request


# 全局变量
message_list = []


def process_input(request: request):

    one_message = request.form.get('msg')

    # message_list.append('here comes from process input.')
    message_list.append(one_message)
    pass


def process_output():
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
