//
//  ContentView.swift
//  TheBridge
//
//  Created by Devon Adams on 12/15/20.
//

import SwiftUI
import UIKit
import Firebase

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)
struct LoginSignupView: View {
    @State var password: String = ""
    @State var username: String = ""
    @State var visible: Bool = false
    @State var errorMessage: String = ""
    @State var animate = true
    @State var spin = false
    @State var isActive = false
    @State var selection: Int?
    
    var body: some View {
        NavigationView{
            ZStack{
                if(spin){
                    Loader()
                }
                VStack{
                    HStack(alignment: .top){
                        ForgotLoginButton()
                        Spacer()
                        MaybeLaterButton()
                    }
                    .frame(maxWidth: .infinity)
                    Spacer()
                    UserImage()
                    Spacer()
                    TextField("Username or Email", text: $username)
                        .padding()
                        .frame(width: 343, height: 35, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(5.0)
                        .border(Color.black)
                        .padding(.bottom, 20)
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 343, height: 35, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(5.0)
                        .border(Color.black)
                        .padding(.bottom, 20)
                    NavigationLink(
                        destination: MainTabBar()
                            .hiddenNavigationBarStyle(),
                        tag: 1,
                        selection: self.$selection){
                        Text("")
                    }
                    //Login Button
                    Group{
                        Button(action: {
                            self.spin = true
                            Auth.auth().signIn(withEmail: username, password: password) { (result, error) in
                                
                                if(error != nil){
                                    self.visible = true
                                    errorMessage = error?.localizedDescription ?? ""
                                }
                                else{
                                    self.visible = false
                                    print("success")
                                    self.selection = 1
                                    
                                }
                                self.spin = false
                            }
                            
                        }, label: {
                            Text("Login")
                                .foregroundColor(Color.white)
                                .padding()
                                .frame(width: 193, height: 23, alignment: .center)
                                .background(Color.black)
                        })
                        SignUpButton()
                        if self.visible{
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .font(.caption)
                        }
                    }
                    AppTitle()
                        .padding()
                }
            }
            .hiddenNavigationBarStyle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginSignupView()
    }
}

struct AppTitle: View {
    var body: some View {
        Text("Bridging the Masses")
            .font(.custom("PatuaOne-Regular", fixedSize: 30))
            .padding()
            .font(.title)
    }
}
struct SignUpButton: View {
    var body: some View {
        Button(action: {}, label: {
            Text("SignUp")
                .foregroundColor(.black)
                .underline()
                .padding()
        })
    }
}

struct LoginButton: View {
    var body: some View {
        Button(action: { }, label: {
            Text("Login")
                .foregroundColor(Color.white)
                .padding()
                .frame(width: 193, height: 23, alignment: .center)
                .background(Color.black)
        })
    }
}

struct UserImage: View{
    var body: some View {
        Image("loginPhoto")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 325, height: 274)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 20)
    }
}

struct ForgotLoginButton: View {
    var body: some View{
        Button(action: {}, label: {
            Text("Forgot Login")
                .foregroundColor(Color.black)
                .font(.system(size: 12))
                .underline()
                
                
        })
    }
}

struct MaybeLaterButton: View {
    var body: some View{
        Button(action: {}, label: {
            Text("Maybe Later")
                .foregroundColor(Color.black)
                .font(.system(size: 12))
                .underline()
        })
    }
}

struct Loader: View {
    @State var animate = false
    var body: some View{
        VStack{
        Circle().trim(from: 0, to: 0.8 ).stroke(AngularGradient(gradient: .init(colors: [.black,.gray]), center: .center), style: StrokeStyle(lineWidth: 8, lineCap: .round)).frame(width: 45, height: 45)
            .rotationEffect(.init(degrees: self.animate ? 360: 0))
            .animation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false))
        }
        .onAppear(perform: {
            self.animate.toggle()
        })
    }
}
