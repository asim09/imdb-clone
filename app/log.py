import logging

class Log:
    def __init__(self):
        pass
    @staticmethod
    def init():
        logging.basicConfig(filename="/tmp/gmc.log", level=logging.ERROR)

    @staticmethod
    def log_error(msg):
        logging.error(msg)