//
//  TabStateScrollView.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 17/03/2024.
//

import SwiftUI

import SwiftUI

//Custom View
struct TabStateScrollView<Content: View>: View {
    var axis: Axis.Set
    var showsIndicator: Bool
    @Binding var tabState: Visibility
    var content: Content

    init(axis: Axis.Set, showsIndicator: Bool, tabState: Binding<Visibility>, @ViewBuilder content: @escaping () -> Content) {
        self.axis = axis
        self.showsIndicator = showsIndicator
        self._tabState = tabState
        self.content = content()
    }

    var body: some View {
        ScrollView(axis) {
            content
        }
        .scrollIndicators(showsIndicator ? .visible: .hidden)
        .background {
            CustomGesture {
                HandleTabState($0)
            }
        }
    }

    //Handle tab state on swipe
    func HandleTabState(_ gesture: UIPanGestureRecognizer) {
//        let offsetY = gesture.translation(in: gesture.view).y
        let velocityY = gesture.velocity(in: gesture.view).y

        if velocityY < 0 {
            if -(velocityY / 5) > 60 && tabState == .visible {
                tabState = .hidden
            }
        } else {
            if (velocityY / 5) > 0 && tabState == .hidden {
                tabState = .visible
            }
        }
    }
}


fileprivate struct CustomGesture: UIViewRepresentable {
    var onChange: (UIPanGestureRecognizer) -> ()

    private let gestureID = UUID().uuidString

    func makeCoordinator() -> Coordinator {
        return Coordinator(onChange: onChange)
    }

    func makeUIView(context: Context) -> some UIView {
        return UIView()
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        DispatchQueue.main.async {
            if let superView = uiView.superview?.superview , !(superView.gestureRecognizers?.contains(where: { $0.name == gestureID }) ?? false) {
                let gesture = UIPanGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.gestureChange(gesture:)))
                gesture.name = gestureID
                gesture.delegate = context.coordinator
                superView.addGestureRecognizer(gesture)
            }
        }
    }

    class Coordinator: NSObject, UIGestureRecognizerDelegate {
        var onChange: (UIPanGestureRecognizer) -> ()
        init(onChange: @escaping (UIPanGestureRecognizer) -> Void) {
            self.onChange = onChange
        }

        @objc
        func gestureChange(gesture: UIPanGestureRecognizer) {
            onChange(gesture)
        }

        //Enable simultaneous work with other gestures
        func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            return true
        }
    }
}

struct TabStateScrollView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
