<h2 align="center">Bokete</h2>

<p align="center">
  <img src="https://i.gyazo.com/7e462ae0d2db65c3258fd02c5011ebac.png" width="250px;"/>
</p>

# 概要
**既存のお笑いWebサービス「bokete」のスマホアプリ版**です。表示される写真に対して、ボケるコメントをつけ、写真フォルダに保存したり、SNSでシェアすることができます。

# 制作期間
3日間

# 制作背景(意図)
某人気お笑い番組が好きで、その中のコンテンツにある「写真で一言」をスマホで気軽に行うことができたら面白いと感じました。また、Swiftの新しい項目としてAPIとJSON解析、スクリーンショットを撮影する方法、UIActivityViewControllerを学習したいと思ったため、制作に至りました。
 
# DEMO
## 1 お気に入りのお題の写真を探す
### 1-1 PixabayのAPIを活用し、検索バーからキーワード検索をする
### 1-2 「次へ」を押すことで、キーワードに沿った次の写真に移る
<p align="center">
  <img src="761e05c4504c78416e55e63d43f4897b.gif" width="250px;"/>
</p>

## 2 ボケるコメントを載せ、シェアする
<p align="center">
  <img src="9c4fdf5499764ed3d45cda4810e33423.gif" width="250px;"/>
</p>

# 工夫したポイント
- pixabayの外部APIを用いたことで、エディタ内に直接挿入するのではなく、お題の写真を大量に扱うことができます
- 機能を限定的にすることで、ユーザーの操作性を高く保つように設計しました。
- ログインなどを経る事なく、シェアボタンを押すと、スクリーンショットが撮られる仕組みを構築し、気軽に企画に参加できるようにしました。

# 使用技術(開発環境)
Swift/Xcode/Github

# 課題や今後実装したい機能
<dl>
  <dt>相互評価（いいね）ができない</dt>
  <dd>DBを作成し、ユーザー同士が評価できるようにしたい</dd>
  <dt>初見の人は、このアプリの趣旨がわからない</dt>
  <dd>トップ画面でアプリの説明を挿入する</dd>
</dl>

