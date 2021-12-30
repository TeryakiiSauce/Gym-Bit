//
//  TestSwiftUIView.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 29/12/2021.
//

import SwiftUI

struct TestSwiftUIView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Hello, SwiftUI!")
                .font(.title)
                .foregroundColor(Color.black)
            HStack {
                Text("This is a test for the SwiftUI")
                    .font(.subheadline)
                    .foregroundColor(Color.blue)
                Spacer()
                Text("Great!!")
                    .font(.subheadline)
                    .foregroundColor(Color.blue)
            }
        }.padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
    }
}

struct TestSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TestSwiftUIView()
    }
}
