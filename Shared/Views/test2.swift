import SwiftUI

struct test2: View {
    @State private var showModal = true
    
    var body: some View {
        VStack{
        Text("Hello, World!")
            Button(action: {
             print("hello button!!")
            self.showModal = true
            }){
                Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
            }
            .sheet(isPresented: self.$showModal) {
                ModalView()
            }
        }
    }
}

struct ModalView: View {

  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

  var body: some View {
    Group {
      Text("Modal view")
      Button(action: {
         self.presentationMode.wrappedValue.dismiss()
      }) {
        Text("Dismiss")
      }
    }
  }
}

struct test2_Previews: PreviewProvider {
    static var previews: some View {
        test2()
    }
}
