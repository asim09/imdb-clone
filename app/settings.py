import os
current_dir = os.getcwd()
if 'getmecab' in current_dir:

    HOST           = "127.0.0.1"
    USER           = "root"
    PASSWORD       = "root"
    DATABASE       = "movie_arena"
    SECRET_KEY     = "bruce wayne is the mask"
elif 'ubuntu' in current_dir:
    HOST           = "127.0.0.1"
    USER           = "myuser"
    PASSWORD       = "root@1234"
    DATABASE       = "movie_arena"
    SECRET_KEY     = "bruce wayne is the mask"


