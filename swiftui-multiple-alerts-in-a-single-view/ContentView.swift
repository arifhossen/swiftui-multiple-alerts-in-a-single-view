//
//  ContentView.swift
//  swiftui-multiple-alert-dialog-in-sameview
//
//  Created by MAC on 23/5/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI

struct DeveloperBottomView:View {
    
    var body: some View{
        
        VStack(alignment:.center){
            Text("Developed by Arif Hossen").fontWeight(.bold).foregroundColor(.green)
            Text("Senior iOS Developer at Graaho").foregroundColor(.blue)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
    }
}

//Custom Button Modifer
struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 12)
            .foregroundColor(.black)
            .background(Color.yellow)
            .cornerRadius(12)
        
    }
}

//Alert Dialog Enum Value
enum CustomActiveAlert {
    case first, second, third
}


struct ContentView: View {
    
    @State private var showAlert = false
    @State private var activeAlert: CustomActiveAlert = .first
    
    
    var body: some View {
        
        VStack{
            
            Image("swiftui-logo")
            
            Text("Multiple alerts in a single view")
                .foregroundColor(.green)
                .font(.system(size: 20))
            
            Spacer().frame(height:30)
            
            //Button 1
            Button(action: {
                print("Press Alert Dialog Button One")
                self.showAlert = true
                self.activeAlert = .first
                
            }) {
                Text("Alert Dialog One")
                    .modifier(ButtonModifier())
            }
            Spacer().frame(height:30)
            
            //Button 2
            Button(action: {
                print("Press Alert Dialog Button Two")
                self.showAlert = true
                self.activeAlert = .second
                
            }) {
                Text("Alert Dialog Two")
                    .modifier(ButtonModifier())
            }
            Spacer().frame(height:30)
            
            //Button 3
            Button(action: {
                print("Press Alert Dialog Button Three")
                self.showAlert = true
                self.activeAlert = .third
                
            }) {
                Text("Alert Dialog Three")
                    .modifier(ButtonModifier())
            }
            
            
            Spacer()
            DeveloperBottomView()
            
        }
        .alert(isPresented: $showAlert) {
            switch activeAlert {
            case .first:
                return Alert(title: Text("Alert Dialog One"), message: Text("Welcome to alert dialog one"), dismissButton: .default(Text("Ok")))
            case .second:
                return  Alert(title: Text("Alert Dialog Two"), message: Text("Welcome to alert dialog two"), dismissButton: .default(Text("Ok")))
            case .third:
                return Alert(title: Text("Alert Dialog Three"), message: Text("Welcome to alert dialog two"), dismissButton: .default(Text("Ok")))
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
