# Movies
Moview developed with SwiftUI

### ScreenShots
<img src="https://github.com/MojitoBar/Movies/blob/main/ScreenShot.gif" width="250"/>

### Skill
- Splash Screen
```Swift
var body: some View {
    if showMainView{
        // nextView
    }
    else{
        VStack{
            ...
        }
        .onAppear(){
            withAnimation(Animation.linear(duration: 0.75).delay(2)){
                showMainView = true
            }
        }
    }
}
```

- Use HalfModalView
```Swift
struct modalView: View {
    @State private var showModal = false
    
    var body: some View{
        
        Button(action: {
            showModal = true
        }){
            // HalfModalView Button
            }
        }
        
        HalfModalView(isShown: $showModal, modalHeight: 800) {
            VStack{
                // HalfModalView Context
            }
        }
    }
}
```
- HalfModalView는 화면 아래쪽에서 올라오는 매커니즘이기 때문에 Horizontal Scroll에서만 작동.
- HalfModalView.swift 파일은 소스코드 참조.
