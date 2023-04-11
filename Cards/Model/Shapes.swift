//
//  Shapes.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 11.04.23.
//

import SwiftUI

extension Shapes {
    static let shapes: [AnyShape] = [
        AnyShape(Circle()), AnyShape(Rectangle()),
        AnyShape(RoundedRectangle(cornerRadius: 20)),
        AnyShape(Heart()), AnyShape(Lens()), AnyShape(Chevron()),
        AnyShape(Diamond()), AnyShape(Cone()), AnyShape(Cloud()),
        AnyShape(Polygon(sides: 6)), AnyShape(Polygon(sides: 8))
    ]
}

struct Shapes: View {
    let currentShape = Lens()
    
    var body: some View {
        currentShape
            .stroke(Color.primary,
                    style: StrokeStyle(lineWidth: 10, lineJoin: .round))
            .padding()
            .aspectRatio(1, contentMode: .fit)
            .background(Color.yellow)
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        var path = Path()
        
        path.addLines([
            CGPoint(x: width * 0.13, y: height * 0.2),
            CGPoint(x: width * 0.87, y: height * 0.47),
            CGPoint(x: width * 0.4, y: height * 0.93),
        ])
        path.closeSubpath()
        
        return path
    }
}

struct Cone: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let radius = min(rect.midX, rect.midY)
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                    radius: radius,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 180),
                    clockwise: true)
        path.addLine(to: CGPoint(x: rect.midX, y: rect.height))
        path.addLine(to: CGPoint(x: rect.midX + radius, y: rect.midY))
        path.closeSubpath()
        
        return path
    }
}

struct Lens: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.midY))
        path.addQuadCurve(to: CGPoint(x: rect.width, y: rect.midY),
                          control: CGPoint(x: rect.midX, y: 0))
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.midY),
                          control: CGPoint(x: rect.midX, y: rect.height))
        path.closeSubpath()
        
        return path
    }
}

struct Heart: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addCurve(to: CGPoint(x: rect.minX, y: rect.height * 0.25),
                          control1: CGPoint(x: rect.midX * 0.7, y: rect.height * 0.9),
                          control2: CGPoint(x: rect.minX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.width * 0.25, y: rect.height * 0.25),
                radius: (rect.width * 0.25), startAngle: Angle(radians: .pi),
                endAngle: Angle(radians: 0), clockwise: false)
            path.addArc(
                center: CGPoint(x: rect.width * 0.75, y: rect.height * 0.25),
                radius: (rect.width * 0.25), startAngle: Angle(radians: .pi),
                endAngle: Angle(radians: 0), clockwise: false)
            path.addCurve(
                to: CGPoint(x: rect.midX, y: rect.height),
                control1: CGPoint(x: rect.width, y: rect.midY),
                control2: CGPoint(x: rect.midX * 1.3, y: rect.height * 0.9) )
            path.closeSubpath()
        }
    }
}

struct Chevron: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.height))
            path.addLines([
                CGPoint(x: rect.minX, y: rect.height),
                CGPoint(x: rect.midX * 0.5, y: rect.midY),
                CGPoint(x: rect.minX, y: rect.minY),
                CGPoint(x: rect.maxX * 0.75, y: rect.minY),
                CGPoint(x: rect.maxX, y: rect.midY),
                CGPoint(x: rect.maxX * 0.75, y: rect.maxY)
            ])
            path.closeSubpath()
        }
    }
}

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            
        }
    }
}

struct Cloud: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            
        }
    }
}

struct Polygon: Shape {
    let sides: Int
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            
        }
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
            .previewLayout(.sizeThatFits)
    }
}
