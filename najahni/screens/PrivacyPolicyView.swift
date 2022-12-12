//
//  PrivacyPolicyView.swift
//  najahni
//
//  Created by bairem mohamed on 10/12/2022.
//

import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        ScrollView{
            VStack{
                Group{
                    HStack {
                        Text("1.Information we collect")
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .font(.title)
                            .padding(.top)
                        Spacer()
                    }
                    HStack {
                        Text("The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information.\n If you contact us directly, we may receive additional information about you such as your name, email address, the contents of the message and/or attachments you may send us, and any other information you may choose to provide. \nWhen you register for an Account, we may ask for your contact information, including items such as name, last name,and email address. ")
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                        .font(.headline)
                        Spacer()
                    }
                    .padding(.top)
                    HStack {
                        Text("2.How we use your information")
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                        .font(.title)
                        Spacer()
                    }
                    .padding(.top)
                    HStack {
                        Text("We use the information we collect in various ways, including to:\nProvide, operate, and maintain our website Improve, personalize, and expand our website \nUnderstand and analyze how you use our website\nDevelop new products, services, features, and functionality\nCommunicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website, and for marketing and promotional purposes\nSend you emails\nFind and prevent fraud\nLog Files\nnajahni.tn follows a standard procedure of using log files. These files log visitors when they visit websites. All hosting companies do this and a part of hosting services' analytics. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the site, tracking users' movement on the website, and gathering demographic information.")
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                        .font(.headline)
                        Spacer()
                    }
                    .padding(.top)
                    HStack {
                        Text("3.Advertising Partners Privacy Policies")
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                        .font(.title)
                        Spacer()
                    }
                    .padding(.top)
                    HStack {
                        Text("You may consult this list to find the Privacy Policy for each of the advertising partners of najahni.tn.\n\nThird-party ad servers or ad networks uses technologies like Sessions, Kotlin, or Web Tokens that are used in their respective advertisements and links that appear on najahni.tn, which are sent directly to users' browser. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and/or to personalize the advertising content that you see on websites that you visit.")
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                        .font(.headline)
                        Spacer()
                    }
                    .padding(.top)
                    HStack {
                        Text("4.Third Party Privacy Policies")
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                        .font(.title)
                        Spacer()
                    }
                    .padding(.top)
                    HStack {
                        Text("najahni.tn's Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options.\nYou can choose to disable cookies through your individual browser options. To know more detailed information about cookie management with specific web browsers, it can be found at the browsers' respective websites.")
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                        .font(.headline)
                        Spacer()
                    }
                    .padding(.top)
                    HStack{
                        Text("najahni.tn does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our website, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records.")
                            .fontWeight(.bold)
                    }
                    .padding(.top)
                    
                }
            }
        }.padding([.leading, .bottom, .trailing]).navigationTitle(Text("Privacy Policy"))
    }
}

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView()
    }
}
