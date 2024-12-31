//
//  OnboardingView.swift
//  MovieOn
//
//  Created by María Pérez  on 30/12/24.
//

import SwiftUI

struct OnboardingView: View {
    let pages = Page.pages
    let dotAppearence = UIPageControl.appearance()
    @AppStorage("isFirstLaunch") var isFirstLaunch = true
    @State private var pageIndex = 0
    
    var body: some View {
        TabView(selection: $pageIndex) {
            ForEach(pages) { page in
                VStack {
                    Button {
                        isFirstLaunch = false
                    } label: {
                        Text("Skip")
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 30)
                    Spacer()
                    PageView(page: page)
                    Spacer()
                    
                    if page.id == pages.last?.id {
                        Button {
                            isFirstLaunch = false
                        } label: {
                            Text("Continue to the app")
                        }
                        .buttonStyle(.bordered)
                    } else {
                        Button {
                            pageIndex += 1
                        } label: {
                            Text("Next")
                        }

                    }
                    Spacer()
                }
                .tag(page.tag)
            }
        }
        .tabViewStyle(.page)
        .animation(.easeInOut, value: pageIndex)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .onAppear {
            dotAppearence.currentPageIndicatorTintColor = .systemPink
            dotAppearence.pageIndicatorTintColor = .green
        }
    }
}

#Preview {
    OnboardingView()
}
