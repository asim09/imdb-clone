import MySQLdb
import MySQLdb.cursors
import settings,jwt
from flask import request


def db_connection():
    return (MySQLdb.connect(settings.HOST, settings.USER, settings.PASSWORD,
                            settings.DATABASE, cursorclass=MySQLdb.cursors.DictCursor,
                            charset="utf8"))


#generate accessToke
def get_accessToken(email_id,role):
    accessToken = jwt.encode({"email_id": email_id, "role": role}, settings.SECRET_KEY,
    algorithm='HS256').decode('utf-8')
    return accessToken


#accessToken Verification
def verify_token(token):
    status = True
    if 'accessToken' in request.headers:
        token = request.headers['accessToken']
        try:
            decode_data = jwt.decode(token,settings.SECRET_KEY)
        except:
            status = False
            return status
        if status:
            conn = db_connection()
            cursor = conn.cursor()
            sql = "select email_id,role from users where email_id = %s"
            cursor.execute(sql,(decode_data['email_id'],))
            user_data = cursor.fetchall()
            if user_data[0]['role'] == decode_data['role']:
                return decode_data
    status = False
    return status
