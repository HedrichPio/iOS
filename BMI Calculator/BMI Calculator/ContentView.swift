//
//  ContentView.swift
//  BMI Calculator
//
//  Created by Hedrich Fernando on 10/02/23.
//

import SwiftUI

struct ContentView: View {
    
//   use @State to update the textfield after every input character
    @State private var weightTextfield:String = ""
    @State private var heightTextfield:String = ""
    
    @State private var bmi:String = "0.0"
    
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMsg: String = ""
    @State private var alertButtonTitle: String = ""
    
    @State private var weightSlider :Double = 1
    @State private var heightSlider :Double = 1
    
    var body: some View {
//        ZStack {
//            Color.cyan
                //.ignoresSafeArea()
            VStack {
    //            Default Code
    //            Image(systemName: "globe")
    //                .imageScale(.large)
    //                .foregroundColor(.accentColor)
    //            Text("Hello, World!")
                
    //            Example Code
    //            RoundedRectangle(cornerRadius: 15)
    //                .frame(width: 200,height: 200)
    //                .foregroundColor(.red)
    //            RoundedRectangle(cornerRadius: 15)
    //                .frame(width: 150,height: 150)
    //                .foregroundColor(.green)
    //            RoundedRectangle(cornerRadius: 15)
    //                .frame(width: 100,height: 100)
    //                .foregroundColor(.blue)
                
    //            Tutorial
                Text("BMI Calculator")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                HStack(spacing: 25.0){
                    Text("Weight").frame(width: 100, height: 50, alignment: .leading)
                    TextField("Enter your Weight", text: $weightTextfield)
                    
                }
                
                Slider(value: $weightSlider, in:1...300){
                    _ in weightTextfield = String(format: "%.2f",weightSlider)
                    
                }
                
                HStack(spacing: 25.0){
                    Text("Height").frame(width: 100,height: 50,alignment: .leading)
                    TextField("Enter your Height", text: $heightTextfield)
                    
                }
                
                Slider(value: $heightSlider, in:1...2.5){
                    _ in heightTextfield = String(format: "%.2f",heightSlider)
                    
                }.accentColor(.green)
                
                Button {
                    guard let weight = Double(weightTextfield),
                          let height = Double(heightTextfield)
                    else {
                        alertTitle = "Error"
                        alertMsg="Invalid Inputs"
                        alertButtonTitle = "Ok"
                        showAlert = true
                        return
                    }
                
                    let bmi = weight / pow(height , 2)
                    
                    self.bmi = String(format: "%.2f",bmi)
                    
                    if(bmi>30){
                        alertMsg = "Your BMI value is \(self.bmi), You are considered to be Obese"
                    }
                    else if(bmi>25){
                        alertMsg = "Your BMI value is \(self.bmi), You are considered to be Overweight"
                    }
                    else{
                        alertMsg = "Your BMI value is \(self.bmi), You are considered to be Healthy"
                    }
                    
                    alertTitle = "Your Bmi"
                    alertButtonTitle = "Got it"
                    showAlert = true
                        
                }label: {
                    Text("Calculate BMI")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(20)
                        .font(.headline)
        
                }
//                .alert(isPresented: $showAlert) {
//                    Alert(title:Text(alertTitle),
//                          message:Text(alertMsg),
//                          dismissButton: .default(Text(alertButtonTitle)))
                    
                Text("Your BMI: \(bmi)")
                    .font(.body)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding()
        .background(Color.cyan)
        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
