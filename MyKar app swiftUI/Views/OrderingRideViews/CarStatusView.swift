//
//  carstatusApp.swift
//  carstatus
//
import SwiftUI

struct carstatusView: View {
	var body: some View {
			TrackingView()
				.onAppear{permissions()}
				.onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
					getCarStatusB()
					if newStatusFlag{
						let content = UNMutableNotificationContent()
						content.title = "Mykar"
						content.subtitle = statusString(s: statusValue)
						content.sound = UNNotificationSound.default
						
						let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
						
						let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
						
						UNUserNotificationCenter.current().add(request)
					}                }
	}
}
