//
//  SignUpView.swift
//  TheBridge
//
//  Created by Devon Adams on 2/25/21.
//

import SwiftUI
import UIKit

struct SignUpView: View {
    @State var email: String = ""
    @State var  username: String = ""
    @State var password: String = ""
    @State var isShowingImagePicker = false
    @State var profileImage = UIImage()
    var body: some View {
        VStack{
            HStack{
                Text("Sign Up!")
                    .font(.custom("PatuaOne-Regular", size: 40))
                    .padding()
                Spacer()
            }
            Spacer()
            Image(uiImage: profileImage)
                .resizable()
                .scaledToFill()
                .frame(width:200, height: 200)
                .clipShape(Circle())
                .shadow(radius: 10)
            .overlay(Circle().stroke(Color.black, lineWidth: 1))
                
            Button(action: {
                self.isShowingImagePicker.toggle()
            }, label: {
                Text("Change Image")
            })
            .sheet(isPresented: $isShowingImagePicker, content: {
                ImagePickerView(isPresented: $isShowingImagePicker, image: $profileImage)
            })
            Spacer()
            TextField("Usermane", text: $username)
                .padding()
                .frame(width: 343, height: 35, alignment: .center)
                .background(Color.white)
                .cornerRadius(5.0)
                .border(Color.black)
                .padding(.bottom, 20)
            TextField("Email", text: $email)
                .padding()
                .frame(width: 343, height: 35, alignment: .center)
                .background(Color.white)
                .cornerRadius(5.0)
                .border(Color.black)
                .padding(.bottom, 20)
            TextField("Password", text: $password)
                .padding()
                .frame(width: 343, height: 35, alignment: .center)
                .background(Color.white)
                .cornerRadius(5.0)
                .border(Color.black)
                .padding(.bottom, 20)
            Button(action: {}, label: {
                Text("SignUp")
                    .foregroundColor(Color.white)
                    .padding()
                    .frame(width: 193, height: 23, alignment: .center)
                    .background(Color.black)
            })
            Spacer()
        }
    }
}

struct ImagePickerView: UIViewControllerRepresentable {
    
    @Binding var isPresented: Bool
    @Binding var image: UIImage
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = UIImagePickerController()
        controller.delegate = context.coordinator
        return controller
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePickerView
        init(parent: ImagePickerView){
            self.parent = parent
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage{
                print(selectedImage)
                self.parent.image = selectedImage
            }
            self.parent.isPresented = false
            
        }
    }
    
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct PickerView: UIViewRepresentable {
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> UIButton {
        let button = UIButton()
        button.setTitle("DUMMY", for: .normal)
        button.backgroundColor = .red
        return button
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
