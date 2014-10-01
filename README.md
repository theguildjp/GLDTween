GLDTween
========

## ライブラリについて
### 概要
GLDTweenはiOS用のハンディなアニメーションエンジンです。

iOSでは手触りやアニメーションが重要視されながら、実際のプログラミング環境ではアニメーションに対する資産が不足していました。UIAnimationは機能が貧弱であり、CoreAnimationは強力であるものの記述が複雑でアニメーションを直感的に制御するにはほぼ遠いものです。Facebookがリリースした[POP](https://github.com/facebook/pop)は、



このライブラリはAdobe Flashの伝説的なアニメーションエンジンTweenerをベースに設計されています。
。


GLDTweenはそれらの問題を解決し、複雑なアニメーションをシンプルに記述できます。


例えば、viewの移動をする場合、以下のように1行で書けます。

##サンプル

###UIViewのCenterを1秒で移動させる。
```
GLDTween.addTween(myView, {"duration":1.0, "transition":"EaseInOutExpo", "center":CGPoint(x:100,y:400)})
```

###UIViewの大きさを変形させる。0.5秒後にアニメーションを開始し3秒で変形。
```
GLDTween.addTween(myView, {"duration":3.0, "delay":0.5, "transition":"EaseInOutExpo", "frame":CGRect(x:100,y:400,width:50,height:50)})
```

## 指定可能なパラメータ
アニメーションのパラメータは、GLDTween.addTweenの第2引数で指定します。第2引数は<String, Any>型のDictionaryで、あらゆるデータ型を内包可能です。


<dl>
  <dt>duration:Double</dt>
  <dd>アニメーションの再生時間（秒）</dd>
  <dt>delay:Double</dt>
  <dd>アニメーション開始までの遅延（秒）</dd>
  <dt>transition:String</dt>
  <dd>イージングカーブ（後述）の指定</dd>
  <dt>repeat:Int</dt>
  <dd>繰り返し回数。ディフォルトは0。completeクロージャは繰り返しが全て終わった時に呼ばれる</dd>
  <dt>x:Double</dt>
  <dd>frame.origin.xの省略記法</dd>
  <dt>y:Double</dt>
  <dd>frame.origin.yの省略記法</dd>
  <dt>width:Double</dt>
  <dd>frame.size.widthの省略記法</dd>
  <dt>height:Double</dt>
  <dd>frame.size.heightの省略記法</dd>
  <dt>frame:CGRect</dt>
  <dd></dd>
  <dt>frame.origin:CGPoint</dt>
  <dd></dd>
  <dt>frame.size:CGSize</dt>
  <dt>center:CGPoint</dt>
  <dt>centerX:Double</dt>
  <dt>centerY:Double</dt>
  <dt>Start:GLDTweenClosure</dt>
  <dd>アニメーション開始時に実行される()->Void型クロージャ。クロージャをDictionaryに入れられるよう、GLDTweenClosureクラスでラップをすること。</dd>
  <dt>Completion:GLDTweenClosure</dt>
  <dd>アニメーション終了時に実行される()->Voidクロージャ。クロージャをDictionaryに入れられるよう、GLDTweenClosureクラスでラップをすること。</dd>
  <dt>その他</dt>
  <dd>CGFloat型のNSObjectのプロパティはプロパティ名でそのまま指定可能（例えばalpha等）。</dd>
</dl>


## 対応プロパティ・データタイプ
アニメーション対象として指定したNSObjectサブクラスから、valueForKeyで取得できる下記型のプロパティに対応しています。またNSObjectを拡張した場合、これらの型の値を返す全てのGetter/Setterもアニメーション可能です。

<dl>
  <dt>CGFloat</dt>
  <dd>UIView.alpha等</dd>
  <dt>CGPoint</dt>
  <dd>UIView.center、CALayer.position等</dd>
  <dt>CGSize</dt>
  <dd>UIScrollView.contentSize等</dd>
  <dt>CGRect</dt>
  <dd>UIView.frame等</dd>
  <dt>CGAffineTransform</dt>
  <dd>UIView.transform等</dd>
  <dt>CATranform3D</dt>
  <dd>CALayer.transform等</dd>
  <dt>UIColor</dt>
  <dd>UIView.backgroundColor等</dd>
</dl>



#対応予定機能

- 無限リピート
- オートリバース？
- アニメーション中に同じターゲットのアニメーションをOverWrite
- アップデート時クロージャ
- 削除時クロージャ



##Known Issue

- アニメーション中に同じプロパティを再度アニメーションさせると動きが競合する。（上書きを実装すること）
- TestCaseを書く事
