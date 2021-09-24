
import socket
#==============================
from tensorflow import keras
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import re
import urllib.request
from konlpy.tag import Okt
import tensorflow as tf
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences
from tensorflow.keras.layers import Embedding, Dense, LSTM
from tensorflow.keras.models import Sequential
from tensorflow.keras.models import load_model
from tensorflow.keras.callbacks import EarlyStopping, ModelCheckpoint
import pickle


# TCP/IP 소켓을 생성하고
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# 소켓을 포트에 연결
server_address = ('localhost', 2222)
print('Startinf up on {} port {}'.format(*server_address))
sock.bind(server_address)

# 연결을 기다림
sock.listen()

while True:
    # 연결을 기다림
    print('통신 대기중입니다')
    connection, client_address = sock.accept()
    try:
        print('접속 시도한 아이피 :', client_address)

        # 작은 데이터를 받고 다시 전송
        while True:
            data = connection.recv(128)
            data = f'{data.decode()}'

            print(data)

            okt = Okt()
            stopwords = ['의', '가', '이', '은', '들', '는', '좀', '잘', '걍', '과', '도', '를', '으로', '자', '에', '와', '한', '하다']
            max_len = 100

            with open('tokenizer.pickle', 'rb') as handle:
                tokenizer = pickle.load(handle)

            def sentiment_predict(data):
                model = keras.models.load_model('best_model.h5')

                data = okt.morphs(data, stem=True)  # 토큰화
                data = [word for word in data if not word in stopwords]  # 불용어 제거
                encoded = tokenizer.texts_to_sequences([data])  # 정수 인코딩
                pad_new = pad_sequences(encoded, maxlen=max_len)  # 패딩
                score = float(model.predict(pad_new))  # 예측

                if (score > 0.5):
                    print("{:.2f}% 확률로 긍정.\n".format(score * 100))

                else:
                    print("{:.2f}% 확률로 부정.\n".format((1 - score) * 100))

            sentiment_predict(data)
    finally:
        # 연결 모두 지움
        print("통신이 종료되었습니다")
        connection.close()