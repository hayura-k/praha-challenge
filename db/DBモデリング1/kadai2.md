## 今後はわさびの有無のみならずシャリの大小も選べるようになりました。どのようにテーブル設計をするべきでしょうか?

food_orders テーブルに下記カラム追加
shari_size: integer

今後シャリのサイズが大小以外も追加される可能性を考えて、integer 型で作成。enum を用いて、管理予定。

## 人気の寿司ネタを特定したいので、「はな」「わだつみ」などのセット商品の売り上げとは別に、寿司ネタが毎月何個売れているのか知る必要が生じました。どのようにテーブル設計をするべきでしょうか?

現状の food_orders テーブルで対応できそう。food_id に値が入っているレコードに絞って取得するイメージ。
下記のようなクエリで取ることを想定。

```sql
SELECT food_id, COUNT(food_id)
FROM food_orders
WHERE
  food_id IS NOT NULL AND
  BETWEEN 月初 AND 月末
GROUP BY food_id
```
