//
//  ContentView.swift
//  keyboard_event_tutorial
//
//  Created by Jeff Jeong on 2022/01/09.
//

import SwiftUI

struct ContentView: View {
    @State var nameInput: String = ""
    @State var emailInput: String = ""
    @State var passwordInput: String = ""
    @State var passwordConfirmInput: String = ""
    
    @ObservedObject var keyboardMonitor : KeyboardMonitor = KeyboardMonitor()
    
    @State var keyboardStatus: KeyboardMonitor.Status = .hide
    
    var body: some View{
        ScrollView{
            VStack(alignment: .leading, spacing: 16){

                VStack(alignment: .leading, spacing: 0){
                    Text("키보드 상태").font(.title2)
                    Divider().colorMultiply(.clear).padding(.vertical, 5)
                    Text(keyboardStatus.description)
                    Text("키보드 높이: \(keyboardMonitor.keyboardHeight)")
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(.yellow))
                .onReceive(self.keyboardMonitor.updatedKeyboardStatusAction, perform: { updatedStatus in
                    self.keyboardStatus = updatedStatus
                })
                
                VStack(alignment: .leading){
                    Text("이름")
                    TextField("이름을 입력해주세요", text: $nameInput).keyboardType(.default).autocapitalization(.none)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(.yellow))
                
                VStack(alignment: .leading){
                    Text("이메일")
                    TextField("이메일", text: $emailInput).keyboardType(.emailAddress).autocapitalization(.none)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(.yellow))
    
                VStack(alignment: .leading){
                    Text("비밀번호")
                    SecureField("비밀번호 확인", text: $passwordConfirmInput).keyboardType(.default)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(.yellow))
                
                
                Rectangle().fill(Color.red).frame(maxHeight: 300)
                
                ScrollView(showsIndicators: false){
                    VStack(alignment: .leading, spacing: 10){
                        Text("주의사항")
                        Text("이상의 살 못할 원대하고, 불러 아름다우냐? 뜨고, 안고, 보이는 아름다우냐? 불어 우리의 못할 있는가? 불러 그들은 있을 교향악이다. 우리의 가장 풍부하게 같으며, 그들의 같은 인간에 운다. 청춘에서만 사람은 보이는 간에 그것을 보라. 사랑의 소담스러운 수 이것은 얼마나 오아이스도 듣기만 피에 그러므로 이것이다. 피는 그림자는 무엇을 공자는 그러므로 노래하며 그들의 생생하며, 끓는다. 미인을 물방아 목숨이 부패뿐이다./n것은 이것은 희망의 넣는 우리 피가 것이 피다. 때까지 봄날의 그와 사막이다. 새 오직 그들은 위하여, 미인을 아니다. 하였으며, 있으며, 것이다.보라, 뛰노는 우는 얼마나 눈이 때문이다. 청춘 살았으며, 원대하고, 그들은 인도하겠다는 노래하며 칼이다. 열락의 그들의 청춘을 불러 거친 황금시대다. 무엇이 그것은 과실이 있는가? 같이, 방황하였으며, 피어나기 것이다. 현저하게 우리의 위하여서, 보라. 하는 미인을 심장은 교향악이다./n군영과 하는 끓는 우리는 예수는 남는 고동을 스며들어 내려온 약동하다. 쓸쓸한 대중을 우리 교향악이다. 위하여 황금시대의 있으며, 산야에 피어나기 보라. 설산에서 인류의 모래뿐일 힘있다. 보는 그들의 속에서 봄바람이다. 모래뿐일 것이 같이, 지혜는 천하를 만천하의 이상의 피부가 듣는다. 위하여, 피부가 같은 대고, 미인을 모래뿐일 같은 끓는 남는 아니다. 인생을 그림자는 그들의 듣는다. 그러므로 꽃이 그들의 황금시대다. 무엇이 고행을 얼음에 실현에 놀이 광야에서 이상 끓는다.").font(.caption)
                    }
                }.frame(height: keyboardStatus == .show ? 300 : 0)
                
                
                GeometryReader { proxy in
                    Button {
                        print("회원가입 버튼 클릭")
                    } label: {
                        Text("회원가입하기")
                            .foregroundColor(.black)
                            .font(.title2)
                            .frame(maxWidth: proxy.frame(in: .named("containerVStack")).width)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.yellow))
                }
                .padding(.bottom, keyboardStatus == .show ? 100 : 0)
                
            }// VStack
        }
        .background(Color.purple)
        .padding(.horizontal, 20)
        .coordinateSpace(name: "containerVStack")
        .navigationTitle("회원가입")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
