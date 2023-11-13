# NavigationBarBackButtonDemoApp
## 環境
Language：Swift
- Version：5.9
- Xcode：15.0
## 概要
`NavigationBar`の戻るボタンを削除し、オリジナルの戻るボタンと画面左端をスワイプして戻る機能を実装したデモアプリになります。
実装内容について順を追って説明した記事を投稿しています。
[【SwiftUI】NavigationStackの戻るボタンをカスタマイズする](https://qiita.com/kaito-seita/items/5c847be63fd4748b58e3)
## 開発の背景
`NavigationBar`の戻るボタンがいまいちUIに馴染んでいなかったのでデザインを変更したところ、`.navigationBarBackButtonHidden(true)`を追加することで、スワイプによる画面遷移が機能しなくなるという弊害があるので、スワイプ機能を`Gesture`を使用して再現することにしました。
## コード
#### エッジスワイプ
エッジスワイプとは、画面の端をスワイプすることで画面遷移を実現する機能のことです。今回は`DragGesture`を活用して再現しました。    
まず、画面左端から30ポイントを「画面端」と定義し、まず初めに触れた部分がその「画面端」の中にあるかどうかを判定します。
そして、何ポイント動かしたら「スワイプ」として判定するかを定義し、その定義以上に動かしたかどうかを判定します。
```Swift
struct EdgeSwipe: ViewModifier {
    @Environment(\.dismiss) var dismiss

    private let edgeWidth: Double = 30
    private let baseDragWidth: Double = 30
        
    func body(content: Content) -> some View {
        content
            .gesture (
                DragGesture().onChanged { value in
                    if value.startLocation.x < edgeWidth && value.translation.width > baseDragWidth {
                        dismiss()
                    }
                }
            )
    }
}

extension View {
    
    func edgeSwipe() -> some View {
        self.modifier(EdgeSwipe())
    }
}
```
