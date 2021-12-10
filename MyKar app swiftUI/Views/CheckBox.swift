//
//  CheckBox.swift
//  MyKar app swiftUI
//
//  Created by Akram Reshad on 5/13/21.
//  Copyright © 2021 A. Resh. All rights reserved.
//

import SwiftUI

struct CheckBox: View {
	@Binding var checked: Bool
	
    var body: some View {
		Image(systemName: checked ? "checkmark.square.fill" : "square")
			.foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
			.onTapGesture {
				self.checked.toggle()
			}
    }
}

struct CheckBox_Previews: PreviewProvider {
	struct CheckBoxViewHolder: View {
			@State var checked = false

			var body: some View {
				CheckBox(checked: $checked)
			}
		}

		static var previews: some View {
			CheckBoxViewHolder()
		}
}
