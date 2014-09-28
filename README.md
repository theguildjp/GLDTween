GLDTween
========

GLDTweenはSwiftで書かれた、シンプルで柔軟なアニメーションエンジンです。
このエンジンはFlashのアニメーションエンジンTweenerの基礎設計に着想を得ています。

iOSではアニメーションが非常に重要視されながら、プログラミング的な資産はそれほど充実していません。

UIAnimationは機能が貧弱であり、逆にCoreAnimationは強力であるものの複雑かつ冗長なものになりがちでした。



例えば、viewの移動をする場合、以下のように1行で書けます。

```
GLDTween.addTween(myView, {"duration":1.0, "delay":0.0, "transition":"easeInOutExpo", "center":CGPoint(x:100,y:400)})
```
