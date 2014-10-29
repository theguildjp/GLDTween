GLDTween
========
GLDTweenはiOS用のハンディなアニメーション用ライブラリです。高度なアニメーションを、シンプルかつパワフルに記述できます。


## 作成の背景
iOSでは「手触り」が重要視されながらも、アニメーションに関するプログラミング資産は不足していました。UIAnimationはAppleの要求するアニメーション品質を実現するにはあまりに貧弱です。一方でCoreAnimationは強力なものの複雑でした。結局のところ、どちらも直感的に表現をコーディングするには向きません。

GLDTweenはこの問題を解決するために開発されました。アニメーションの表現と技術で多くの蓄積があったFlashのノウハウをベースに、ActionScriptの伝説的アニメーションエンジン[Tweener](https://code.google.com/p/tweener/)をベースに設計されました。シンプルなAPIでパワフルな表現を実現します。




## GLDTweenの特徴
##### シンプルな記法
大抵のアニメーションを1行で記述できます。型変換はライブラリが自動で行うので、CGPointやCATransform3Dなど様々な型を横断する必要がありません。

##### 競合への冗長性
たとえばオブジェクトをアニメーション中に、さらに別のアニメーションを行った場合、GLDTweenは自動で同じプロパティのマージや上書きを行い競合や衝突を防ぎます。

##### 何でもアニメーションできる
GLDTweenのサポートする一般的な数値型あれば、あらゆるプロパティがアニメーション可能です。数値型でさえあれば音楽のボリュームや、ビデオの再生位置すらアニメーション可能です！

##### 高い拡張性
プラグイン方式を採用しているため、ライブラリそのものに手をいれずに独自のカスタマイズができます。アニメーション関数や、特殊な計算を行うプロパティを自分追加できます。

##### UIや画面の遷移に特化
数個〜数十個のUI要素や画面遷移を行うためのライブラリです。パーティクルのような万単位で同時に動かすアニメには向いていません。


## インストール

##### CocoaPods
[CocoaPods](http://cocoapods.org/)を使っている場合、以下をPodfileに追加します。
```
pod 'GLDTween', '~> 1.0'
```

##### GitあるいはZip
通常通りダウンロードやPushでインストールしてください。
ライブラリの依存性としてはQuartzCore.frameworkが必要となります。



例えば、viewの移動をする場合、以下のように1行で書けます。

##サンプルコード

GLDTweenでは任意のNSObjectに対し、NSDictionaryでプロパティのアニメーションを指定します。
NSValueを用いてラップをすることで、CGPoint、CGSize、CGRect、CGAffineTransformなどのプロパティも指定可能です。

###アニメーションを開始
UIViewを座標(200,300)に2秒で移動させる。
```
[GLDTween addTween:myView 
            params:@{@"duration": @2.0, //時間
                     @"delay": @0.0
                     @"easing": GLDEasingTypeEaseInOutExpo, //任意のアニメーションカーブ 
                     @"center": [NSValue valueWithCGPoint:CGPointMake(200, 300)] 
            }];
```


あるいは標準プラグインの力で、CGPointのかわりにcenterX、centerYでも指定できます。

```
[GLDTween addTween:myView 
            params:@{@"duration": @2.0, //時間
                   @"delay": @0.0
                   @"easing": GLDEasingTypeEaseInOutExpo, //任意のアニメーションカーブ 
                   @"centerX": @200, //center.xのショートカット
                   @"centerY": @300, //center.yのショートカット
            }];
```

###アニメーションの削除
実行中の任意のNSObjectのアニメーションを削除します。
```
[GLDTween removeTween:myView];
```

あるいは特定のプロパティのアニメーションだけ削除することも可能です。

```
[GLDTween removeTween:myView params:@[@"x",@"width"]];
```

#####全てを削除する場合
```
[GLDTween removeAllTweens];
```


#####アニメーションの一次停止と再開除
実行中のアニメーションの一時停止
```
[GLDTween pauseTween:myView];
```

#####一時停止中のアニメーションの再開

```
[GLDTween resumeTween:myView];
```

#####全てを一時停止
```
[GLDTween pauseAllTweens];
```

#####全ての一時停止を再開
```
[GLDTween resumeAllTweens];
```




###複数のアニメーション
#####複数のプロパティを同時に指定
```
[GLDTween addTween:myView 
            params:@{@"duration": @2.0, //時間
                   @"delay": @0.0
                   @"easing": GLDEasingTypeEaseInOutExpo, //任意のアニメーションカーブ 
                   @"width": @100,
                   @"height": @100,
                   @"centerX": @200,
                   @"centerY": @300,
                   @"alpha": @0.0
            }];
```

#####複数のオブジェクトに同じ動きをさせる。
パラメータの辞書を再利用することで、同じアニメーションを複数のNSObjectに適用できます。
```
[GLDTween addTween:myView0 params:myDict}];
[GLDTween addTween:myView1 params:myDict}];
[GLDTween addTween:myView2 params:myDict}];
```


#####連続でアニメーション
右に1秒移動してから下に1秒移動する。
2つのアニメーションと、delayのパラメータ指定で連続的なアニメーションも記述できる。
```
//右に移動
[GLDTween addTween:myView 
            params:@{@"duration": @1.0, //時間
                   @"delay": @0.0,
                   @"easing": GLDEasingTypeEaseInOutExpo,
                   @"centerX": @200,
            }];
//下に移動
[GLDTween addTween:myView 
            params:@{@"duration": @1.0, //時間
                   @"delay": @1.0, //1.0秒遅延させて実行
                   @"easing": GLDEasingTypeEaseInOutExpo, 
                   @"centerY": @300,
            }];
```

###アニメーションの上書き、競合
同じ時間帯にアニメーションが競合する場合、２つ目のアニメーションへ自動で上書きされます。
下記の２つのアニメーションではXが競合するので、Xのみ2番目のアニメーションが優先されます。
```
[GLDTween addTween:myView 
            params:@{@"duration": @3.0, //時間
                   @"delay": @0.0,
                   @"easing": GLDEasingTypeEaseInOutExpo,
                   @"x": @200,
                   @"y": @100
            }];
[GLDTween addTween:myView 
            params:@{@"duration": @1.5, //時間
                   @"delay": @1.0,
                   @"easing": GLDEasingTypeEaseInOutExpo, 
                   @"x": @300
            }];
```

###アニメ開始時、終了時に特殊な処理を行う
ブロックあるいはセレクターで、イベントハンドリングが可能。ただしNSDictionaryに格納するためにGLDTweenBlockあるいは、GLDTweenSelectorでラップする必要がある。

#####クロージャによるイベント処理
```
__weak id s = self;
[GLDTween addTween:myView 
            params:@{@"duration": @1.0, //時間
                   @"delay": @0.0,
                   @"easing": GLDEasingTypeEaseInOutExpo,
                   @"startBlock": [GLDTweenBlock block:^(void){
                        [s animationDidStart:nil]; //ブロック
                   }],
                   @"completionBlock": [GLDTweenBlock block:^(void){
                        [s animationDidComplete:nil]; //ブロック
                   }]
            }];
```


#####セレクターによるイベント処理
```
[GLDTween addTween:myView 
            params:@{@"duration": @1.0, //時間
                   @"delay": @0.0,
                   @"easing": GLDEasingTypeEaseInOutExpo,
                   @"startSelector": [GLDTweenSelector selector:@selector(animationDidStart:) withTarget:self],
                   @"completionSelector": [GLDTweenSelector selector:@selector(animationDidComplete:) withTarget:self]
            }];
```

### アニメーション中の操作ロック

lockInteraction、unlockInteractionパラメータで、アニメーション中のユーザー操作をロックできます。
```
[GLDTween addTween:myView 
            params:@{@"duration": @1.0, //時間
                   @"delay": @0.0,
                   @"easing": GLDEasingTypeEaseInOutExpo,
                   @"lockInteraction": @true, //追加時に操作系をロック
                   @"unlockInteraction": @true //完了 or 削除時に操作系をアンロック
            }];
```

## 指定可能なパラメータ
アニメーションのパラメータは、GLDTween.addTweenの第2引数で指定します。第2引数は<String, Any>型のDictionaryで、あらゆるデータ型を内包可能です。


<dl>
  <dt>duration: NSNumber</dt>
  <dd>アニメーションの再生時間（秒）</dd>
  <dt>delay: NSNumber</dt>
  <dd>アニメーション開始までの遅延（秒）</dd>
  <dt>transition: NSString</dt>
  <dd>イージングカーブ（後述）の指定</dd>
  <dt>repeat: NSNumber</dt>
  <dd>繰り返し回数。ディフォルトは0。-1を指定した場合は無限ループ。</dd>
  <dt>lockInteraction: BOOL</dt>
  <dd>アニメーション登録時にユーザーインタラクション（タッチ等）をロック。</dd>
  <dt>unlockInteraction: BOOL</dt>
  <dd>アニメーション完了/削除時に、ユーザーインタラクション（タッチ等）をアンロック。</dd>
  <dt>x: NSNumber</dt>
  <dd>frame.origin.xの省略記法</dd>
  <dt>y: NSNumber</dt>
  <dd>frame.origin.yの省略記法</dd>
  <dt>width: NSNumber</dt>
  <dd>frame.size.widthの省略記法</dd>
  <dt>height: NSNumber</dt>
  <dd>frame.size.heightの省略記法</dd>
  <dt>frame: CGRect</dt>
  <dd></dd>
  <dt>origin: CGPoint</dt>
  <dd></dd>
  <dt>size: CGSize</dt>
  <dt>center: CGPoint</dt>
  <dt>centerX: Double</dt>
  <dt>centerY: Double</dt>
  <dt>startBlock: GLDTweenBlock</dt>
  <dd>アニメーション開始時に実行されるブロック。GLDTweenBlockでラップをすること。</dd>
  <dt>completionBlock: GLDTweenBlock</dt>
  <dd>アニメーション開始時に実行されるブロック。GLDTweenBlockでラップをすること。</dd>
  <dt>updateBlock: GLDTweenBlock</dt>
  <dd>アニメーション終了時に実行されるブロック。GLDTweenBlockでラップをすること。</dd>
  <dt>repeatBlock: GLDTweenBlock</dt>
  <dd>アニメーション終了時に実行されるブロック。GLDTweenBlockでラップをすること。</dd>
  <dt>startSelector: GLDTweenSelector</dt>
  <dd>アニメーション開始時に実行されるセレクター。GLDTweenSelectorでラップをすること。</dd>
  <dt>completionSelector: GLDTweenSelector</dt>
  <dd>アニメーション更新時に実行されるセレクター。GLDTweenSelectorでラップをすること。</dd>
  <dt>updateSelector: GLDTweenSelector</dt>
  <dd>アニメーションリピート時に実行されるセレクター。GLDTweenSelectorでラップをすること。</dd>
  <dt>repeatSelector: GLDTweenSelector</dt>
  <dd>アニメーション終了時に実行されるセレクター。GLDTweenSelectorでラップをすること。</dd>
  <dt>その他</dt>
  <dd>CGFloat、CGPoint、CGSize、CGRect、CGAffineTransform、CATransform3D型のプロパティはそのまま指定可能（例えばalpha等）。</dd>
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
  <dt>UIColor（対応予定）</dt>
  <dd>UIView.backgroundColor等</dd>
</dl>

## 指定可能なアニメーションカーブ
いわゆるRobert Pennerによる[主要アニメーションカーブ](http://easings.net/en)は全てサポートしています。

<ul>
<li>GLDEaseTypeLinear</li>
<li>GLDEaseTypeInSine</li>
<li>GLDEaseTypeOutSine</li>
<li>GLDEaseTypeInOutSine</li>
<li>GLDEaseTypeInQuad</li>
<li>GLDEaseTypeOutQuad</li>
<li>GLDEaseTypeInOutQuad</li>
<li>GLDEaseTypeInCubic</li>
<li>GLDEaseTypeOutCubic</li>
<li>GLDEaseTypeInOutCubic</li>
</ul>


##プラグインの作成
GLDTweenでは以下の2種類のプラグインを作成可能です。
プラグインの作成方法は後述。

<dl>
<dt>アニメーション・カーブ</dt>
<dd>GLDEasingテンプレートクラスを継承することで、自身で定義したオリジナルのアニメーションカーブを登録できます。</dd>
<dt>独自プロパティ</dt>
<dd>GLDSpecialPropertyを継承したアダプタクラスを作ることで、GLDTweenプリセットの対応プロパティだけでない、様々なプロパティに対応可能です。</dd>
</l>


##対応予定機能

- オートリバース


##Todo

- コントリビュータを集めること
- サンプルコードを作ること
- TestCaseを書く事

##Known Issue

- SWIFTから使用する場合、GLDTweenSelectorによるコールバックが正常に作動しません。現段階ではGLDTweenBlockを使用してくだしあ。
