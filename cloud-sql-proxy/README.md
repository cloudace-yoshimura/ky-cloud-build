# CloudSQL接続方法
公式リファレンス 
https://cloud.google.com/sql/docs/container-engine-connect?hl=ja  

##CloudSQLをつくる 
### CloudSQL インスタンス作成
### CloudSQL ユーザー作成
### CloudSQL Admin API有効化
###  サービスアカウントと鍵生成
CloudSQLprocxyがCloudSQLへ接続するために必要 

```
gcloud iam service-accounts keys create \                                           
    key.json \
    --iam-account [サービスアカウント名]
```

## CloudSQL procxyをつくる
### CloudSQL接続用鍵ファイルをk8sのsecretに格納 
$kubectl create secret generic cloudsql-instance-credentials --from-file=credentials.json=key.json



### DB接続ユーザ用
`
$kubectl create secret generic cloudsql-db-credentials --from-literal=username=[username] --from-literal=password=[password]
`
