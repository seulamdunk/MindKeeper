import pymysql
import pandas as pd
import numpy as np
import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import linear_kernel
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import linear_kernel
import socket, threading


                                        ## 데이터 로드


#mysql 연결
mindDB=pymysql.connect(
        user="root",
        password="1234",
        host="127.0.0.1",
        db="mindDB",
        charset="UTF8"
    )

#커서 오픈
cursor= mindDB.cursor(pymysql.cursors.DictCursor)

#sql 문
sql='''
select y.youtube_num, youtube_Tag,y.youtube_title, youtube_Ch,youtube_Cnt,ylog.customer_num,c.identity_Num from youtube y
left outer join youtubelog ylog on y.youtube_Num = ylog.youtube_Num 
left outer join customer  c on c.Customer_Num = ylog.Customer_Num;

'''
#sql 동작
cursor.execute(sql)

#결과 데이터 DADAFrame으로
dataDF =pd.DataFrame(cursor.fetchall())
#커밋
mindDB.commit()
cursor.close()
mindDB.close()



                                        ##데이터 전처리
# 성별 컬럼 생성
def genderCheck(indenti):
        if (indenti == None):
                gender = '0'
        elif (indenti[-1] == '1'):
                gender = "남"
        elif (indenti[-1] == '2'):
                gender = "여"
        else:
                gender = '0'
        return gender


dataDF["gender"] = dataDF["identity_Num"].apply(genderCheck)


# 나이 컬럼 생성
def ageCheck(indenti):
        if (indenti == None):
                age = 0
        else:
                age = indenti[0:2]
        return age


dataDF["age"] = dataDF["identity_Num"].apply(ageCheck)
del dataDF['identity_Num']
dataDF['count'] =dataDF.groupby(["youtube_num","youtube_Tag","youtube_Ch","youtube_Cnt","gender","age"]).customer_num.transform("count")
dataDF = dataDF.fillna(0)

                                        #데이터 전처리  -워드임베딩
vectorizer = TfidfVectorizer(ngram_range = (1, 2))

vector= vectorizer.fit_transform(dataDF['youtube_title'])
cosine_sim = linear_kernel(vector, vector)


#타이틀 입력하면 인덱스를 주기 위한 테이블
indices = pd.Series(dataDF.index, index=dataDF['youtube_num']).drop_duplicates()


                                            #추천-함수



def get_recommendations(title, cosine_sim=cosine_sim):
    # 선택한 영화의 타이틀로부터 해당되는 인덱스를 받아옵니다. 이제 선택한 영화를 가지고 연산할 수 있습니다.
    idx = indices.loc[title]

    # 모든 영화에 대해서 해당 영화와의 유사도를 구합니다.
    sim_scores = list(enumerate(cosine_sim[idx]))

    # 유사도에 따라 영화들을 정렬합니다.
    sim_scores = sorted(sim_scores, key=lambda x: x[1], reverse=True)

    # 가장 유사한 10개의 영화를 받아옵니다.
    sim_scores = sim_scores[1:21]

    # 가장 유사한 10개의 영화의 인덱스를 받아옵니다.
    movie_indices = [i[0] for i in sim_scores]

    # 가장 유사한 10개의 영화의 제목을 리턴합니다.
    return dataDF['youtube_num'].iloc[movie_indices]

def convert_string(list):
    res=""
    for a in list:
        res= res + str(a)  +"#"

    res=res[0:-1]
    print("String  결과 : ",res)
    return res



# binder함수는 서버에서 accept가 되면 생성되는 socket 인스턴스를 통해 client로 부터 데이터를 받으면 echo형태로 재송신하는 메소드이다.
def binder(client_socket, addr):
    print('Connected by', addr)

    try:
        while True:
            # socket의 recv함수는 연결된 소켓으로부터 데이터를 받을 대기하는 함수입니다. 최초 4바이트를 대기합니다
            # 아마 통신하는 포트 번호 4자리
            data = client_socket.recv(4)
            # 최초 4바이트는 전송할 데이터의 크기이다. 그 크기는 little 엔디언으로 byte에서 int형식으로 변환한다.
            length = int.from_bytes(data, "little")
            # 다시 데이터를 수신한다.  실제 데이터
            data = client_socket.recv(length)
            # 수신된 데이터를 str형식으로 decode한다.
            msg = data.decode()
            print('Received from', addr, msg)
            result = get_recommendations(int(msg))
            last_result = convert_string(result)




            data = last_result.encode()
            # 바이너리의 데이터 사이즈를 구한다.
            length = len(data)
            # 데이터 사이즈를 little 엔디언 형식으로 byte로 변환한 다음 전송한다.
            client_socket.sendall(length.to_bytes(4, byteorder='little'))
            # 데이터를 클라이언트로 전송한다.
            client_socket.sendall(data)

    except Exception as e:
        print(e)
        # 접속이 끊기면 except가 발생한다.
        print("except : ", addr)
    finally:
        # 접속이 끊기면 socket 리소스를 닫는다.
        client_socket.close()


# 소켓을 만든다.
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
# 소켓 레벨과 데이터 형태를 설정한다.
server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
# 서버는 복수 ip를 사용하는 pc의 경우는 ip를 지정하고 그렇지 않으면 None이 아닌 ''로 설정한다.
# 포트는 pc내에서 비어있는 포트를 사용한다. cmd에서 netstat -an | find "LISTEN"으로 확인할 수 있다.
server_socket.bind(('', 9001))
# server 설정이 완료되면 listen를 시작한다.
server_socket.listen()

try:
    # 서버는 여러 클라이언트를 상대하기 때문에 무한 루프를 사용한다.
    while True:
        # client로 접속이 발생하면 accept가 발생한다.
        # 그럼 client 소켓과 addr(주소)를 튜플로 받는다.
        client_socket, addr = server_socket.accept()
        th = threading.Thread(target=binder, args=(client_socket, addr))
        # 쓰레드를 이용해서 client 접속 대기를 만들고 다시 accept로 넘어가서 다른 client를 대기한다.
        th.start();
        print("통신시작")
except:
    print("server")
finally:
    server_socket.close()

