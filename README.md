GLDTween
========

GLDTweenはSwiftで書かれた、アニメーションエンジンです。

このエンジンはFlashのアニメーションエンジンTweenerの基礎設計に着想を得ています。

iOSではアニメーションが非常に重要視されながら、プログラミング的な資産はそれほど充実していません。

UIAnimationは機能が貧弱であり、逆にCoreAnimationは強力であるものの複雑かつ冗長なものになりがちでした。

GLDTweenはそれらの問題を解決し、複雑なアニメーションをシンプルに記述できます。


例えば、viewの移動をする場合、以下のように1行で書けます。

##サンプル

```
GLDTween.addTween(myView, {"duration":1.0, "delay":0.0, "transition":"easeInOutExpo", "center":CGPoint(x:100,y:400)})
```


## 豊富なアニメーション関数

