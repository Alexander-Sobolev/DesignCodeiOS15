//
//  HomeView.swift
//  DesignCodeiOS15
//
//  Created by Alexander Sobolev on 11.5.23..
//

import SwiftUI

struct HomeView: View {
    @Namespace var namespace
    @State var hasScrolled   = false
    @State var show          = false
    @State var showStatusBar = true
    @State var selectedID = UUID()
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                scrollDetection
                
                featured
                Text("Courses".uppercased())
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                
                if !show {
                    cards
                } else {
                    ForEach(courses) { course in
                        Rectangle()
                            .fill(.white)
                            .frame(height: 300)
                            .cornerRadius(30)
                            .shadow(color: Color("Shadow"), radius: 20, x: 0, y: 10)
                            .opacity(0.3)
                        .padding(.horizontal, 30)
                    }
                }
            }
            .coordinateSpace(name: "scroll")
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(
                NavigationBar(hasScrolled: $hasScrolled, title: "Featured")
            )
            
            if show {
                detail
            }
        }
        .statusBarHidden(!showStatusBar)
        .onChange(of: show) { newValue in
            withAnimation(.closeCard) {
                if newValue {
                    showStatusBar = false
                } else {
                    showStatusBar = true
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView {
    var scrollDetection: some View {
        GeometryReader { proxy in
            Color.clear.preference(
                key: ScrollPreferenceKey.self,
                value: proxy.frame(in: .named("scroll")).minY
            )
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            withAnimation(.easeInOut) {
                if value < 0 {
                    hasScrolled = true
                } else {
                    hasScrolled = false
                }
            }
        })
    }
    
    var featured: some View {
        TabView {
            ForEach(featuredCourses) { course in
                GeometryReader { proxy in
                    FeaturedItem(course: course)
                        .padding(.vertical, 40)
                        .rotation3DEffect(
                            .degrees(proxy.frame(in: .global).minX / -10),
                             axis: (x: 0, y: 1, z: 0), perspective: 1
                        )
                        .shadow(color: Color("Shadow").opacity(0.3),
                                radius: 10, x: 0, y: 10)
                        .blur(radius: abs(proxy.frame(in: .global).minX) / 40)
                    
                        .overlay(
                            Image(course.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .offset(x: 32, y: -80)
                                .frame(height: 230)
                                .offset(x: proxy.frame(in: .global).minX / 40)
                                .rotation3DEffect(
                                    .degrees(proxy.frame(in: .global).minX / -10),
                                     axis: (x: 0, y: 1, z: 0), perspective: 1
                                )
                                .blur(radius: abs(proxy.frame(in: .global).minX) / 40)
                    )
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(
            Image("Blob 1")
                .offset(x: 250, y: -100)
        )
    }
    
    var cards: some View {
        ForEach(courses) { course in
            CourseItem(show: $show, namespace: namespace, course: course)
                .onTapGesture {
                    withAnimation(.openCard) {
                        show.toggle()
                        showStatusBar = false
                        selectedID = course.id
                }
            }
        }
    }
    
    var detail: some View {
        ForEach(courses) { course in
            if course.id == selectedID {
                CourseView(show: $show, course: course, namespace: namespace)
                    .zIndex(1)
                    .transition(.asymmetric(
                        insertion: .opacity.animation(.easeInOut(duration: 0.1)),
                    removal:   .opacity.animation(.easeInOut(duration: 0.3).delay(0.2))))
            }
        }
    }
}
