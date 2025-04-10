# Dockerイメージの作成
```
$ make build
```

# Dockerイメージの再作成
```
$ make rebuild
```

# 実行方法
```
$ make run
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
$ make rebuild
```
