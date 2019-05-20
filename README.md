# pv-analizer
Google AnalyticsライクなWEBアプリを作りました。「所要時間：24時間　１週間程度」

# ポイント
1. 計測タグを発行できる。
2. 1で発行したタグをページに埋め込むと、該当ページでのPV数が計測ができる。
3. URL別、日付別でフィルターをかけることができ、それぞれ昇順、降順でもソート可能


# Heroku
[https://pv-analytics.herokuapp.com](https://pv-analytics.herokuapp.com)

# 使用したgem
- 'bootstrap', '~> 4.3.1'
- 'jquery-rails'
- 'devise'
- 'grape'
- 'rack-cors'
- 'devise-i18n'
- 'devise-i18n-views'
- 'kaminari'

# 制作手順
1. 通常の`rails new`コマンドを使用し、登録するサイトをdeviseで構築
2. アクセスを保存するpvモデルを作成
3. pvモデルに対して、外部からAPIモードで通信ができるようにgrape, rack-corsを使用
4. データの取得が確認できたら、成形して見やすいようにビューに表示させていく
5. 見た目を整えるため、bootstrap, kaminari, 各i18nを使用
6. 完成

# 苦労したところ
1. まず、API化が初めてだったため、どこから始めたらいいのかがわからなかった。  
調べているとAPIだけのアプリばかり出てきたので、適切な情報を見つけるのに時間がかかった。
2. grapeを今回使用したが、データを保存する処理を記述するファイルが見当がつかなかったため、root.rbに直書きする形となった。  
外部サービスからのPOSTリクエストにはCSRF攻撃の危険性があったが、application全体のprotect_from_forgeryをfalseにする形で進めた。
3. 取得してきたデータをフィルターにかけていくのだが、一つ一つのリクエストの値を、各フォームタグのhidden_fieldに記憶させていくことで、利用しやすいUXを実装できた。
