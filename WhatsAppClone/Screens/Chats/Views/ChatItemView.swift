HStack{
                    Circle()
                        .frame(width: 55,height: 55)
                    VStack(alignment: .leading){
                        HStack {
                            Text("Qatester1")
                                .bold()
                                .lineLimit(1)
                            
                            Spacer()
                            
                            Text("5.50 PM")
                                .foregroundStyle(.gray)
                        }
                        
                      HStack {
                          Image(systemName: "microphone.fill")
                           Text("Voice message")
                               
                       }
                      .font(.callout)
                      .foregroundStyle(.gray)
                        
                        
                        
                    }
                    
                }