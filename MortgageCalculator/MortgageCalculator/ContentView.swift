//
//  ContentView.swift
//  MortgageCalculator
//
//  Created by Hedrich Fernando on 23/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage ("payment") private var tfPayment : String = "300000"
    @AppStorage ("years") private var tfYears : String = "25"
    @AppStorage ("interest") private var tfInterest : String = "4"
    
    @State private var UIBorrowing : String = ""
    
    var body: some View {
        //ZStack{
            //Image("red_house").resizable().scaledToFit()
            
            VStack(alignment: .center) {
                
                Text("Mortgage Calculator").font(.largeTitle).bold()
                
                Label("Monthly Payment", systemImage: "sterlingsign.circle.fill").font(.system(size: 20))
                TextField("", text: $tfPayment).border(.blue).background(.white).multilineTextAlignment(.center).keyboardType(/*@START_MENU_TOKEN@*/.decimalPad/*@END_MENU_TOKEN@*/)
                
                Label("Loan period - years", systemImage: "clock.badge.questionmark").font(.system(size: 20))
                TextField("", text: $tfYears).border(.blue).background(.white).multilineTextAlignment(.center).keyboardType(.numberPad)
                
                Label("Interest rate", systemImage: "percent").font(.system(size: 20))
                TextField("", text: $tfInterest).border(.blue).background(.white).multilineTextAlignment(.center).keyboardType(.decimalPad)
                
                Button {
                    mortgageCalculator()
                } label: {
                    Text("Calculate")
                }.padding()
                
                Text("Amount that can be borrowed:£ \(UIBorrowing)")

                    
            }
            .frame(height: 500.0)
            .background(
                Image("red_house").resizable())
                //Color(hue: 1.0, saturation: 0.0, brightness: 1.0, opacity: 0.8)
        //}
        
    }
    func mortgageCalculator(){
        
        guard let payment = Double(tfPayment), let years = Int(tfYears), let interest = Double(tfInterest) else {return}
        
        let r = interest/100
        let a = (r/12)+1
        let n = Double(years*12)
        
        let p = payment*(((pow(a, n)-1)*pow(a, -n))/(r/12))
        
        UIBorrowing = String(format: "%.2f", p)
        print(p)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
