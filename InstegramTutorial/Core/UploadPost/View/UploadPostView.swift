//
//  UploadPostView.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 31/07/2023.
//

import SwiftUI
import PhotosUI


struct UploadPostView: View {
    @State private var imagePickerIsPresented = false
    @State private var caption: String = ""
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int // (Changing Binding properity here will change $selectedIndex in mainTabView because it's binding. ))
    // Binding properity needs to be linked with state (@Binding can't be exsit without @State)
 //   @State private var photoItem: PhotosPickerItem?

    var body: some View {
        VStack {
            //action tool bar
            HStack {
                Button {
clearPostDataAndReturnToFeed()
                    
                } label: {
                    Text("Cancel")
                    
                }

                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                Button {
                    Task {
                        try await viewModel.uploadPost(caption:caption)
                     clearPostDataAndReturnToFeed()

                        
                    }
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }.padding(.horizontal)
            //post Image and caption
            HStack(spacing: 8){
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                    //the sequence here is important (fill the image in the frame we obtain then clipped ())
                }
               
            
                TextField("Enter your caption", text: $caption, axis: .vertical)
            }
            .padding()
            
            Spacer()
            
        }
        .onAppear {
            imagePickerIsPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerIsPresented, selection: $viewModel.selectedImage )
        //selection
    }
    
    func clearPostDataAndReturnToFeed() {
        caption = ""
          viewModel.selectedImage = nil
          viewModel.postImage = nil
          tabIndex = 0
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(tabIndex: .constant(1))
    }
}
