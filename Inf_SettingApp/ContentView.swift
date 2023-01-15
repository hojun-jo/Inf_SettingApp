//
//  ContentView.swift
//  Inf_SettingApp
//
//  Created by 조호준 on 2023/01/13.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAirplainModeOn: Bool = false
    
    var body: some View {
        
        NavigationView {
            List {
                Section {
                    NavigationLink {
                        Text("프로필 화면")
                    } label: {
                        profileCell()
                    }
                }
                Section {
                    toggleCell(imageName: "airplane",
                               iconColor: .orange,
                               cellTitle: "에어플레인 모드",
                               isOn: $isAirplainModeOn)
                    navigationLinkCell(imageName: "wifi",
                                iconColor: .blue,
                                cellTitle: "Wi-Fi",
                                subtitle: "wifi_name") {
                        Text("Wi-Fi 화면")
                    }
                    navigationLinkCell(imageName: "arrow.up.to.line",
                                iconColor: .blue,
                                cellTitle: "Bluetooth",
                                subtitle: "켬") {
                        Text("Bluetooth 화면")
                    }
                    navigationLinkCell(imageName: "antenna.radiowaves.left.and.right",
                              iconColor: .green,
                              cellTitle: "셀룰러") {
                        Text("셀룰러 화면")
                    }
                    navigationLinkCell(imageName: "personalhotspot",
                              iconColor: .green,
                              cellTitle: "개인용 핫스팟") {
                        Text("개인용 핫스팟 화면")
                    }
                }
                Section {
                    navigationLinkCell(imageName: "bell.badge.fill",
                              iconColor: .red,
                              cellTitle: "알림") {
                        Text("알림 화면")
                    }
                    navigationLinkCell(imageName: "speaker.wave.3.fill",
                              iconColor: .pink,
                              cellTitle: "사운드 및 햅틱") {
                        Text("사운드 및 햅틱 화면")
                    }
                    navigationLinkCell(imageName: "moon.fill",
                              iconColor: .indigo,
                              cellTitle: "집중 모드") {
                        Text("집중 모드 화면")
                    }
                    navigationLinkCell(imageName: "hourglass",
                              iconColor: .indigo,
                              cellTitle: "스크린 타임") {
                        Text("스크린 타임 화면")
                    }
                }
                Section {
                    navigationLinkCell(imageName: "gear",
                              iconColor: .gray,
                              cellTitle: "일반") {
                        Text("일반 화면")
                    }
                }
            }
            .navigationTitle(Text("설정"))
        }
    }
    
    @ViewBuilder
    private func profileCell() -> some View {
        HStack {
            Image(systemName: "airplane")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .padding(10)
                .background(.green)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 3) {
                Text("User")
                    .font(.system(size: 24))
                    .fontWeight(.regular)
                Text("Apple ID, iCloud, 미디어 및 구입")
                    .font(.system(size: 14))
            }
            .padding(.leading, 6)
        }
        .padding(.vertical, 10)
    }
    
    @ViewBuilder
    private func iconImage(imageName: String, iconColor: Color) -> some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
            .padding(4)
            .background(iconColor)
            .foregroundColor(.white)
            .cornerRadius(6)
    }
    
    @ViewBuilder
    private func toggleCell(imageName: String, iconColor: Color, cellTitle: String, isOn: Binding<Bool>) -> some View {
        HStack {
            iconImage(imageName: imageName, iconColor: iconColor)
            Toggle(cellTitle, isOn: isOn)
        }
    }

    @ViewBuilder
    private func navigationLinkCell<V: View>(imageName: String, iconColor: Color, cellTitle: String, subtitle: String? = nil, destination: @escaping () -> V) -> some View {
        HStack {
            iconImage(imageName: imageName, iconColor: iconColor)
            
            if let subtitle = subtitle {
                NavigationLink {
                    destination()
                } label: {
                    HStack {
                        Text(cellTitle)
                        Spacer()
                        Text(subtitle)
                            .foregroundColor(.gray)
                    }
                }
            } else {
                NavigationLink(cellTitle) {
                    destination()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
