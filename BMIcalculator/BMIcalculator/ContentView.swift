//
//  ContentView.swift
//  BMIcalculator
//
//  Created by Ljuba Podolszkaja on 03.08.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var BMIresult = ""
    @State private var BMItext = ""
    @State private var BMIDetails = ""
    @State private var weight = ""
    @State private var height = ""
    
    var result: Double {
        let Inputweight = Double(weight)
        let Inputheight = Double(height)
        let countheight = Inputheight! / 100
        
        let countBMI = (Inputweight!/(countheight * countheight)).rounded()
        
        return countBMI
    }
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()
            
            VStack (alignment: .center) {
                Text("BMI calculator")
                    .font(.largeTitle.bold())
                    .frame(width: 300, height: 100, alignment: .center)
                    .foregroundColor(.purple)
                    .shadow(radius: 7)
               
                
                VStack (alignment:.leading) {
                    Text("Enter your weight in kg: ")
                        .font(.headline)
                    TextField("Weight", text: $weight )
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .font(.system(size: 25))
                        .frame(width:100, height: 50, alignment: .center)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 50).fill(Color.white))
                        .padding()
                    
                    Text("Enter your height in cm: ")
                            .font(.headline)
                        TextField("Height", text: $height )
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .font(.system(size: 25))
                            .frame(width:100, height: 50, alignment: .center)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 50).fill(Color.white))
                            .padding()
                    
                }
                .shadow(color: .purple, radius: 8, x: 5, y: 2)
                
               
                VStack (spacing: 8) {
                    Text(BMItext)
                    .font(.system(size: 20).bold())
                    Text(BMIresult)
                        .font(.headline.bold())
                    Text(BMIDetails)
                        .font(.system(size: 20).bold())
                    
                }
                
                Spacer()
                
                Button(action: {
                    
                    self.BMIresult = "\(result)"
                    self.BMItext = "Your BMI is:"
                    if result > 30{
                        self.BMIDetails = "You are obese!"
                    }
                    else if result > 25{
                        self.BMIDetails = "You have overweight!"
                    }
                    else if result > 18{
                        self.BMIDetails = "You have normal weight!"
                    }
                    else{
                        self.BMIDetails = "You are underweight!"
                    }
                        
                    
                }) {
                    Text("Calculate")
                        .font(.title.bold())
                    
                }
                .frame(width: 150, height: 30)
                .tint(.green)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle)
                .shadow(color: .black, radius: 10, x: 2, y: 2)
                .padding()
                
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
