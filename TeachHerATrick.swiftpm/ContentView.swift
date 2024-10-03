import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        
        
        
        NavigationStack{
            ScrollView{
                
                    VStack {
                        
                        Image("Title")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .edgesIgnoringSafeArea(.all)
                            .padding(64)
                        
                        Image("action0")
                            .padding(0)
                            .aspectRatio(contentMode: .fit)
                        
                            .edgesIgnoringSafeArea(.all)
                        
                        
                        
                        NavigationLink(destination: SecondView()){                  Image("Start")
                                .padding(32)
                        }
                        
                    
                }
               
            }.background(Color (red: 159/255, green: 55/255, blue: 176/255)).ignoresSafeArea(.all)
            
        }
    }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
