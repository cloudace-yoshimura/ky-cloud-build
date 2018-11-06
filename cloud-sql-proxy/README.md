# CloudSQL接続方法
公式リファレンス　
https://cloud.google.com/sql/docs/container-engine-connect?hl=ja  
　
## 作業概要 
### ①CloudSQLのサービスアカウントの鍵を作る 
### ②k8s.yamlのインスタンス名編集 
### ③cloudbuild! 

cloudsql-proxyが誕生  
cloudsql-proxyに3306で接続しにいく   

##  事前作業 
### CloudSQL インスタンス作成
### CloudSQL ユーザー作成
### CloudSQL Admin API有効化
### CloudSQL接続用のサービスアカウントと鍵生成
CloudSQLprocxyがCloudSQLへ接続するために必要 
鍵生成コマンド 
```
gcloud iam service-accounts keys create \                                           
    key.json \
    --iam-account [サービスアカウント名]
```

## CloudSQL procxyをつくる
### CloudSQL接続用鍵ファイルをk8sのsecretに格納 
$kubectl create secret generic cloudsql-instance-credentials --from-file=credentials.json=key.json

yaml解説
３４行目のコマンド句　インスタンス名を変える


### DB接続ユーザ用
接続用のDBアカウント情報もsecret化して環境変数で参照する形にすると便利、安全
`
$kubectl create secret generic cloudsql-db-credentials --from-literal=username=[username] --from-literal=password=[password]
`
