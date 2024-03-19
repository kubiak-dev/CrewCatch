//
//  TripListItem.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 10/03/2024.
//

import SwiftUI

struct TripCardView: View {
    @Binding var trip: Trip
    let radius: CGFloat = 7
    let dateSize: CGFloat = 14
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .frame(height: 180)
                .shadow(radius: 2, x: 1, y: 5)

            VStack {
                Image("ship1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .alignmentGuide(.bottom) { _ in 0 }
                    .frame(height: 150)
                    .mask(
                        LinearGradient(
                            gradient: Gradient(colors: [.white, .clear]), startPoint: .top, endPoint: .bottom)
                    )
                    .clipShape(TopRoundedShape(cornerRadius: radius))

                Spacer()
            }
            
            // Top layer
            VStack(alignment: .leading) {
                
                // Image overlay portion
                VStack(alignment: .leading) {
                    
                    //Title and trip type
                    Text("\"\(trip.name)\"")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.text)
                        .italic()

                    Text(trip.tripType.descr)
                        .font(.system(size: 16))

                    Spacer()
                    
                    // Locations and dates
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            HStack(spacing: 5) {
                                Image(systemName: "location.fill")
                                    .resizable()
                                    .foregroundColor(.text)
                                    .frame(width: dateSize - 2, height: dateSize - 2)
                                Text("Sieradz, Poland")
                                    .foregroundStyle(.text)
                                    .font(.system(size: dateSize))
                                    .bold()
                            }

                            HStack(spacing: 5) {
                                Image(systemName: "calendar")
                                    .resizable()
                                    .foregroundColor(.text)
                                    .frame(width: dateSize - 4, height: dateSize - 4)
                                Text(trip.startDate, style: .date)
                                    .foregroundStyle(.text)
                                    .font(.system(size: dateSize - 2))
                            }

                        }

                        Spacer()

                        VStack(alignment: .leading, spacing: 4) {
                            HStack(spacing: 5) {
                                Image(systemName: "location.fill")
                                    .resizable()
                                    .foregroundColor(.text)
                                    .frame(width: dateSize - 2, height: dateSize - 2)
                                Text("Sieradz, Poland")
                                    .foregroundStyle(.text)
                                    .font(.system(size: dateSize))
                                    .bold()
                            }

                            HStack(spacing: 5) {
                                Image(systemName: "calendar")
                                    .resizable()
                                    .foregroundColor(.text)
                                    .frame(width: dateSize - 4, height: dateSize - 4)
                                Text(trip.startDate, style: .date)
                                    .foregroundStyle(.text)
                                    .font(.system(size: dateSize - 2))
                            }
                        }
                    }
                }
                .frame(height: 120)

                Spacer()

                HStack(alignment: .bottom, spacing: 5) {
                    Image(systemName: "person.fill")
                        .resizable()
                        .foregroundColor(.text)
                        .frame(width: dateSize, height: dateSize)
                        .padding(.bottom, 3)
                    Text("\(trip.crew.count) / \(trip.maxCrewString)")
                        .foregroundStyle(.text)
                        .font(.system(size: dateSize))
                        .bold()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.vertical, 5)
            .padding(.horizontal, 8)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 180)
        .padding(10)
    }
}

struct TopRoundedShape: Shape {
    var cornerRadius: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()

        // Add rounded corners only to the top side
        path.move(to: CGPoint(x: rect.minX, y: rect.minY + cornerRadius))
        path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY))
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: -90), endAngle: .zero, clockwise: false)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()

        return path
    }
}

#Preview {
    TripCardView(trip: .constant(Trip.mockTrip))
//        .background(Color.black)
}
