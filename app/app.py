
from flask import Flask,jsonify,request
# from utility import db_connection,verify_token,get_accessToken
import json,helpers
# from werkzeug.security import generate_password_hash,check_password_hash
from uuid import uuid4
# import helpers
from log import Log
import ast,datetime

app = Flask(__name__)

@app.route('/',methods=['GET'])
def home():
    return 'Greeetings Asim'

# @app.route('/api/search-movie-by-title',methods=['GET'])
# def search_movie_by_title():
#     '''
#     This function add new movies.
#     '''
#     access_role = verify_token(request.headers)
#     if access_role:
#         if access_role['role'] == 'admin' or access_role['role'] == 'viewer':
#             movie_list = []
#             data = request.get_json()
#             if 'title' in data.keys():
#                 conn = db_connection()
#                 cursor = conn.cursor()
#                 sql = "select title,director,imdb_score,popularity from movies where title = %s"
#                 cursor.execute(sql,(data['title'],))
#                 movies = cursor.fetchall()
#                 for movie in movies:
#                     movie_list.append(movie)
#                 return jsonify({'movie_data':movie_list,'status':True})
#         return jsonify({'message':'You are not authorized to access this endpoint!'})
#     return jsonify({'message':'accessToken issue! Pls login again'})
#
#
# @app.route('/api/add-movie',methods=['POST'])
# def add_movie():
#     '''
#     This function add new movies.
#     '''
#     access_role = verify_token(request.headers)
#     if access_role:
#         if access_role['role'] == 'admin':
#             data = request.get_json()
#             if 'movies' in data.keys():
#                 try:
#                     popularity = data['movies']['99popularity']
#                     director = data['movies']['director']
#                     imdb_score = data['movies']['imdb_score']
#                     title = data['movies']['name']
#                     genres = data['movies']['genre']
#                     conn = db_connection()
#                     cursor = conn.cursor()
#                     sql = """INSERT into movies (title,director,popularity,imdb_score,created_at) values(%s,%s,%s,%s,%s)"""
#                     cursor.execute(sql,(title,director,popularity,imdb_score,datetime.datetime.now()))
#                     movie_id = cursor.lastrowid
#                     for genre in genres:
#                         sql2 = "select id from genres where genre = %s"
#                         cursor.execute(sql2,(genre,))
#                         genre_id = cursor.fetchall()[0]['id']
#                         print(genre_id)
#                         sql3 = "INSERT into movies_genre (movie_id,genre,created_at) values(%s,%s,%s)"
#                         cursor.execute(sql3,(movie_id,genre_id,datetime.datetime.now()))
#                     conn.commit()
#                 except Exception as e:
#                     cursor.close()
#                     conn.close()
#                     helpers.getErrorLine()
#                     Log.log_error(e)
#                     return jsonify({'message':'Some error occured','status': False})
#                 cursor.close()
#                 conn.close()
#                 return jsonify({'message':'Movie Added succcessfully','status': True})
#             else:
#                 return jsonify({'message':'Pls check the parameters','status': False})
#         return jsonify({'message':'You are not authorized to access this endpoint!'})
#     return jsonify({'message':'accessToken issue! Pls login again'})
#
#
# @app.route('/api/login',methods=['GET'])
# def login():
#     '''
#     This function will authenticate the user.
#     '''
#     data = request.get_json()
#     if data:
#         if 'email_id' in data and 'password' in data:
#             conn = db_connection()
#             cursor = conn.cursor()
#             sql1 = "select email_id, password,role from users where email_id = %s"
#             cursor.execute(sql1,(data['email_id'],))
#             user_data = cursor.fetchall()
#             if len(user_data) > 0:
#                 pwd_hash = user_data[0]['password']
#                 if check_password_hash(pwd_hash,data['password']):
#                     token = get_accessToken(user_data[0]['email_id'],user_data[0]['role'])
#                     return jsonify({'message':'LoggedIn Successfully','status': True,
#                     'accessToken':token,
#                     'data':[{'Email ID':user_data[0]['email_id'],'Role':user_data[0]['role']}]})
#                 else:
#                     return jsonify({'message':'Wrong Password','status': False})
#             else:
#                 return jsonify({'message':'User does not Exist','data':data})
#             cursor.close()
#             conn.close()
#         return jsonify({'message':'Email or password missing','status': False})
#     return jsonify({'message':'Empty Json','status': False})
#
#
# @app.route('/api/create-user',methods=['POST'])
# def create_user():
#     '''
#     This function will create user.
#     '''
#     access_role = verify_token(request.headers)
#     if access_role:
#         if access_role['role'] == 'admin':
#             data = request.get_json()
#             password = generate_password_hash(data['password'], method="sha256")
#             conn = db_connection()
#             cursor = conn.cursor()
#             soft_delete = 0
#             is_active = 1
#             try:
#                 sql = "select email_id from users where email_id = %s"
#                 cursor.execute(sql,(data['email_id'],))
#                 user_data = cursor.fetchall()
#                 if len(user_data) > 0:
#                     return jsonify({'message':'Email Id already Registered!'})
#                 else:
#                     print(data)
#                     try:
#                         sql = """INSERT into users (username,password,soft_delete,is_active,role,email_id) values(%s,%s,%s,%s,%s,%s)"""
#                         info = (data['username'],password,soft_delete,is_active,data['role'],data['email_id'])
#                         cursor.execute(sql,info)
#                         conn.commit()
#                         cursor.close()
#                         conn.close()
#                     except Exception as e:
#                         cursor.close()
#                         conn.close()
#                         helpers.getErrorLine()
#                         Log.log_error(e)
#                         return jsonify({'message':'User Not Created, Please Try Again!'})
#                     return jsonify({'message':'Created Successfully.','data':data})
#             except Exception as e:
#                 cursor.close()
#                 conn.close()
#                 helpers.getErrorLine()
#                 Log.log_error(e)
#             return jsonify({'message':'Some Error Occured!'})
#         return jsonify({'message':'You are not authorized to access this endpoint!'})
#     return jsonify({'message':'accessToken issue! Pls login again'})
#
#
# @app.route('/api/add-genre',methods=['POST'])
# def add_genre():
#     '''
#     This function will insert the genres.
#     '''
#     access_role = verify_token(request.headers)
#     print(access_role)
#     if access_role:
#         if access_role['role'] == 'admin':
#             data = request.get_json()
#             for i,j in data.items():
#                 genres = eval(j)
#                 conn = db_connection()
#                 cursor = conn.cursor()
#                 for item in genres:
#                     sql = """INSERT into genres (genre,created_at) values(%s,%s)"""
#                     cursor.execute(sql,(item,datetime.datetime.now()))
#                     conn.commit()
#                 cursor.close()
#                 conn.close()
#             return jsonify({'message':'You are not authorized to access this endpoint!'})
#     return jsonify({'message':'accessToken issue! Pls login again'})



if __name__ == "__main__":
    app.debug = True
    app.run()
    # app.run(host="0.0.0.0", debug=True)
