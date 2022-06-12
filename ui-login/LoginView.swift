//
//  LoginView.swift
//  TrackBird
//
//  Created by Mukul Jangir on 11/06/22.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    var body: some View {
        VStack {
            Text("TrackBird")
                .font(.title)
            Text("Track your expenses")
                .font(.body)
                .foregroundColor(.gray)
            Spacer()
            Image(uiImage: UIImage(named: "money_people_image")!)
                .resizable()
                .scaledToFit()
            Spacer()
            
            Button(action: {
                loginViewModel.signIn(root: getRootViewController())
            }){
                HStack{
                    Image(uiImage: UIImage(named: "google")!)
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                        .scaledToFit()
                    Text("Sign In with Google")
                }.padding(15)
                    
            }
            .buttonStyle(.automatic)
            .background(.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 35))
            
        }
        .padding(EdgeInsets(top: 30, leading: 15, bottom: 30, trailing: 15))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
