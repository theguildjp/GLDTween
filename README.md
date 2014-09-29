GLDTween
========

GLDTweenはSwiftで書かれた、アニメーションエンジンです。

このエンジンはFlashのアニメーションエンジンTweenerの基礎設計に着想を得ています。

iOSではアニメーションが非常に重要視されながら、プログラミング的な資産はそれほど充実していません。

UIAnimationは機能が貧弱であり、逆にCoreAnimationは強力であるものの複雑かつ冗長なものになりがちでした。

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



<dl>
  <dt>duration:Double</dt>
  <dd>アニメーションの再生時間（秒）</dd>
  <dt>delay:Double</dt>
  <dd>アニメーション開始までの遅延（秒）</dd>
  <dt>transition:String</dt>
  <dd>イージングカーブ（後述）の指定</dd>
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
  <dt>その他</dt>
  <dd>CGFloat型のNSObjectのプロパティはプロパティ名でそのまま指定可能（例えばalpha等）。</dd>
</dl>


## 対応予定
以下の型の全てのプロパティに対応予定

- CGPoint
- CGSize
- CGRect
- CGAffineTransform
- CATransform3D
- UIColor
