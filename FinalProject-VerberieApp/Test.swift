import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack() {
      ZStack() {
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 343, height: 57)
          .background(.white)
          .cornerRadius(15)
          .overlay(
            RoundedRectangle(cornerRadius: 15)
              .inset(by: 0.50)
              .stroke(Color(red: 0, green: 0.33, blue: 0.64), lineWidth: 0.50)
          )
          .offset(x: 1, y: 0)
        Text("Password")
          .font(Font.custom("Poppins", size: 16).weight(.bold))
          .tracking(1.60)
          .foregroundColor(Color(red: 0, green: 0.33, blue: 0.64))
          .offset(x: 31, y: 0.50)
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 64, height: 57)
          .background(Color(red: 0, green: 0.33, blue: 0.64))
          .cornerRadius(15)
          .overlay(
            RoundedRectangle(cornerRadius: 15)
              .inset(by: 0.50)
              .stroke(Color(red: 0, green: 0.33, blue: 0.64), lineWidth: 0.50)
          )
          .offset(x: -140.50, y: 0)
      }
      .frame(width: 345, height: 57)
      .offset(x: 1, y: 65.50)
      ZStack() {
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 343, height: 57)
          .background(.white)
          .cornerRadius(15)
          .overlay(
            RoundedRectangle(cornerRadius: 15)
              .inset(by: 0.50)
              .stroke(Color(red: 0, green: 0.33, blue: 0.64), lineWidth: 0.50)
          )
          .offset(x: 0, y: 0)
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 64, height: 57)
          .background(Color(red: 0, green: 0.33, blue: 0.64))
          .cornerRadius(15)
          .overlay(
            RoundedRectangle(cornerRadius: 15)
              .inset(by: 0.50)
              .stroke(Color(red: 0, green: 0.33, blue: 0.64), lineWidth: 0.50)
          )
          .offset(x: -139.50, y: 0)
        Text("Email Address")
          .font(Font.custom("Poppins", size: 16).weight(.bold))
          .tracking(1.60)
          .foregroundColor(Color(red: 0, green: 0.33, blue: 0.64))
          .offset(x: 32, y: -0.50)
      }
      .frame(width: 343, height: 57)
      .offset(x: 0, y: -20.50)
      ZStack() {
        ZStack() {
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 268.35, height: 66.50)
            .background(Color(red: 0, green: 0.33, blue: 0.64))
            .cornerRadius(11.74)
            .offset(x: 0, y: 0)
          Text("Log in")
            .font(Font.custom("Poppins", size: 15.65).weight(.semibold))
            .foregroundColor(.white)
            .offset(x: 0, y: 0)
        }
        .frame(width: 268.35, height: 66.50)
        .offset(x: 0, y: 0)
      }
      .frame(width: 268.35, height: 66.50)
      .offset(x: -0.33, y: 173.25)
      ZStack() {
        ZStack() {
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 268.35, height: 66.50)
            .background(.white)
            .cornerRadius(11.74)
            .overlay(
              RoundedRectangle(cornerRadius: 11.74)
                .inset(by: 0.50)
                .stroke(Color(red: 0, green: 0.33, blue: 0.64), lineWidth: 0.50)
            )
            .offset(x: 0, y: 0)
          Text("Sign up")
            .font(Font.custom("Poppins", size: 15.65).weight(.semibold))
            .foregroundColor(Color(red: 0, green: 0.33, blue: 0.64))
            .offset(x: 0, y: 0)
        }
        .frame(width: 268.35, height: 66.50)
        .offset(x: 0, y: 0)
      }
      .frame(width: 268.35, height: 66.50)
      .offset(x: -0.33, y: 328.25)
      Text("OR")
        .font(Font.custom("Poppins", size: 15.65).weight(.semibold))
        .foregroundColor(Color(red: 0, green: 0.33, blue: 0.64))
        .offset(x: 0, y: 254.50)
      Rectangle()
        .foregroundColor(.clear)
        .frame(width: 136, height: 0)
        .overlay(
          Rectangle()
            .stroke(Color(red: 0, green: 0.33, blue: 0.64), lineWidth: 0.50)
        )
        .offset(x: -103.50, y: 255)
      Rectangle()
        .foregroundColor(.clear)
        .frame(width: 139, height: 0)
        .overlay(
          Rectangle()
            .stroke(Color(red: 0, green: 0.33, blue: 0.64), lineWidth: 0.50)
        )
        .offset(x: 102, y: 255)
      Text("Verberie")
        .font(Font.custom("Poppins", size: 32).weight(.semibold))
        .foregroundColor(Color(red: 0, green: 0.33, blue: 0.64))
        .offset(x: 1.50, y: -117)
      Rectangle()
        .foregroundColor(.clear)
        .frame(width: 254, height: 254)
        .background(
          AsyncImage(url: URL(string: "https://via.placeholder.com/254x254"))
        )
        .offset(x: -1.50, y: -244)
    }
    .frame(width: 393, height: 852)
    .background(.white);
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
