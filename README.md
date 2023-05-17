# Dockerイメージの作成
```
$ docker compose build
```

# 実行方法
```
$ docker compose run --rm aws
```
aws, eb, amplifyコマンドが利用できます。
```
# aws
# eb
# amplify
```

# AWSプロファイルの作成
```
# aws configure [--profile PROFILE]
```

# 各種コマンド実行時にアップデートがあると表示された場合

Dockerイメージを再作成してください

```
$ docker compose build
```
