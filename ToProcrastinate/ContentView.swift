//
//  ContentView.swift
//  ToProcrastinate
//
//  Created by Zerone Consulting on 11/01/23.
//

import SwiftUI

struct ContentView: View {
	
	@State var results = [TaskEntry]()
	
	var body: some View {
		
		NavigationView{
			List(results, id: \.id) { item in
				VStack(alignment: .leading) {
					
					HStack {
						Text("\(item.id)")
						Text(item.title.capitalized)
						Spacer()
						Image(systemName: "pencil")
							.font(.system(size: 18))
							.foregroundColor(.yellow)
							.fontWeight(.medium)
						Image(systemName: "trash.fill")
							.font(.system(size: 18))
							.foregroundColor(.red)
							.fontWeight(.medium)
						// capitalize first letter of each word
					}
				}
			}.onAppear(perform: loadData)            .navigationBarTitle("Todo List")
		}
	}
	
	
	func loadData() {
		guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {
			print("Your API end point is Invalid")
			return
		}
		let request = URLRequest(url: url)
		
		URLSession.shared.dataTask(with: request) { data, response, error in
			if let data = data {
				if let response = try? JSONDecoder().decode([TaskEntry].self, from: data) {
					DispatchQueue.main.async {
						self.results = response
					}
					return
				}
			}
		}.resume()
	}
	
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
