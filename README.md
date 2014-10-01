GLDTween
========

## ライブラリについて
### 概要
GLDTweenはiOS用のハンディなアニメーションエンジンです。iOSにおけるアニメーションを1行で、行動な機能を維持したまま簡略に記述することができます。

### 背景
iOSでは手触りが重要視されながら、実際のプログラミング環境ではアニメーションに対する資産が不足していました。UIAnimationは機能が貧弱であり、CoreAnimationは強力であるものの記述が複雑で、表現のプログラミングを直感的に書くにはミスマッチです。Facebookの[POP](https://github.com/facebook/pop)は新しい解の１つですが、残念ながら最低限の機能しか搭載しておりません。このため高度なアニメーションを行うには大量のカスタムクラスを書く必要があり、デザイナもプログラマも限られたプリセットに表現が限定されていました。

### ソリューション
GLDTweenはそれらの問題を解決するため、Flashの伝説的なアニメーションエンジン[Tweener](https://code.google.com/p/tweener/)をベースに設計されたiOS用のアニメーションエンジンです。
シンプルなAPIでパワフルな表現を実現します。


### GLDTweenの長所
<dl>
  <dt>シンプルな記法</dt>
  <dd></dd>
</dl>

##サンプル


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
