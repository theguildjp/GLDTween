GLDTween
========

GLDTweenはiOS用のハンディなアニメーションエンジンです。iOSにおけるアニメーションを1行で、シンプルかつパワフルに記述できます。

iOSでは「手触り」が重要ですが、プログラミング環境ではアニメーションに対する資産が不足していました。UIAnimationは機能が貧弱であり、CoreAnimationは強力なものの複雑で、どちらも直感的に表現をコーディングするには向きません。GLDTweenはこの問題を解決するため、Flashの伝説的アニメーションエンジン[Tweener](https://code.google.com/p/tweener/)をベースに設計されました。シンプルなAPIでパワフルな表現を実現します。




## GLDTweenの特徴
##### シンプルな記法
大抵のアニメーションを1行で記述できます。型変換などはライブラリが自動で行います。

##### UIや画面の遷移に特化
数個〜数十個のUI要素や画面遷移を行うためのライブラリです。パーティクルのような万単位で同時に動かすアニメには向いていません。

##### 競合への冗長性
たとえばオブジェクトをアニメーション中に、さらに別のアニメーションを行った場合、GLDTweenは自動で同じプロパティのマージや上書きを行い競合や衝突を防ぎます。

##### 何でもアニメーションできる
GLDTweenのサポートする数値型（float等）のプロパティであれば、何でもアニメーション可能です。数値型でさえあれば音楽のボリュームや、ビデオの再生位置すらアニメーション可能です！

##### 高い拡張性
またプラグイン方式を採用。アニメーション関数や、特殊な計算を行うプロパティを自分追加できます。



## インストール

##### CocoaPods
[CocoaPods](http://cocoapods.org/)を使っている場合、以下をPodfileに追加します。
```
pod 'GLDTween', '~> 1.0'
```

##### GitあるいはZip
通常通りダウンロードやPushでインストールしてください。
ライブラリの依存性としてはQuartzCore.frameworkが必要となります。


## サンプル


例えば、viewの移動をする場合、以下のように1行で書けます。

##サンプル

###UIViewを座標(200,300)に2秒で移動させる。
```
[GLDTween addTween:myView params:{
  @"duration": @2.0, //時間
  @"easing": GLDEasingTypeEaseInOutExpo, //任意のアニメーションカーブ 
  @"centerX": @200,
  @"centerY": @300,
}];
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
