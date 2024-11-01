//
//  ContentView.swift
//  downloaderApp
//
//  Created by Abbas on 26/04/2024.
//
import SwiftUI
import UIKit
import AVKit
import Foundation
import Combine
 
//
//struct ContentView: View {
//  
//        @StateObject private var downloadManager = DownloadManager()
//        @State private var url: String = ""
//
//        var body: some View {
//            VStack {
//                TextField("Enter YouTube Video URL", text: $url)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//
//                Button("Download Video") {
//                    downloadManager.downloadVideo(from: url)
//                }
//                .padding()
//                .background(Color.blue)
//                .foregroundColor(.white)
//                .cornerRadius(10)
//
//                if downloadManager.downloadStarted {
//                    ProgressView(value: downloadManager.downloadProgress, total: 1.0)
//                        .progressViewStyle(LinearProgressViewStyle())
//                        .padding()
//                }
//            }
//            .padding()
//        }
//   
//
//   
//}






//import Foundation
//import Combine
//import UIKit

//class DownloadManager: NSObject, ObservableObject {
//    @Published var downloadProgress: Double = 0.0
//    @Published var downloadStarted: Bool = false
//    @Published var videoURL: URL?  // To hold the URL of the downloaded video
//
//    func downloadVideo(from urlString: String) {
//        guard let url = URL(string: urlString) else { return }
//
//        downloadStarted = true
//        downloadProgress = 0.0
//
//        let task = URLSession.shared.downloadTask(with: url) { localURL, response, error in
//            DispatchQueue.main.async {
//                self.downloadStarted = false
//                if let localURL = localURL {
//                    do {
//                        let tmpUrl = FileManager.default.temporaryDirectory.appendingPathComponent("video.mp4")
//                        // Check if file exists and remove it if it does
//                        if FileManager.default.fileExists(atPath: tmpUrl.path) {
//                            try FileManager.default.removeItem(at: tmpUrl)
//                        }
//                        try FileManager.default.moveItem(at: localURL, to: tmpUrl)
//                        self.videoURL = tmpUrl  // Save the URL of the downloaded video
//                        print("Download finished and saved")
//                    } catch {
//                        print("Error saving file: \(error.localizedDescription)")
//                    }
//                } else if let error = error {
//                    print("Download error: \(error.localizedDescription)")
//                }
//            }
//        }
//
//        task.resume()
//        task.progress.publisher(for: \.fractionCompleted)
//            .receive(on: DispatchQueue.main)
//            .assign(to: &$downloadProgress)
//    }
//}


//import Foundation
//import Combine
//import UIKit

//class DownloadManager: NSObject, ObservableObject {
//    @Published var downloadProgress: Double = 0.0
//    @Published var downloadStarted: Bool = false
//    @Published var videos: [URL] = [] // Store downloaded video URLs
//
//    func downloadVideo(from urlString: String) {
//        guard let url = URL(string: urlString) else { return }
//
//        downloadStarted = true
//        downloadProgress = 0.0
//
//        let task = URLSession.shared.downloadTask(with: url) { localURL, response, error in
//            if let localURL = localURL {
//                let tmpUrl = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString + ".mp4")
//                do {
//                    try FileManager.default.moveItem(at: localURL, to: tmpUrl)
//                    DispatchQueue.main.async {
//                        UISaveVideoAtPathToSavedPhotosAlbum(tmpUrl.path, nil, nil, nil)
//                        self.downloadStarted = false
//                        self.videos.append(tmpUrl) // Add video URL to list
//                        print("Download finished and saved at \(tmpUrl)")
//                    }
//                } catch {
//                    DispatchQueue.main.async {
//                        print("Error saving file: \(error.localizedDescription)")
//                        self.downloadStarted = false
//                    }
//                }
//            } else if let error = error {
//                DispatchQueue.main.async {
//                    print("Download error: \(error.localizedDescription)")
//                    self.downloadStarted = false
//                }
//            }
//        }
//
//        task.resume()
//        task.progress.publisher(for: \.fractionCompleted)
//            .receive(on: DispatchQueue.main)
//            .assign(to: &$downloadProgress)
//    }
//}


//class DownloadManager: NSObject, ObservableObject {
//    @Published var downloadProgress: Double = 0.0
//    @Published var downloadStarted: Bool = false
//    @Published var videoURL: URL?  // To hold the URL of the downloaded video
//
//    func downloadVideo(from urlString: String) {
//        guard let url = URL(string: urlString) else { return }
//
//        downloadStarted = true
//        downloadProgress = 0.0
//
//        let task = URLSession.shared.downloadTask(with: url) { localURL, response, error in
//            DispatchQueue.main.async {
//                if let localURL = localURL {
//                    do {
//                        let tmpUrl = FileManager.default.temporaryDirectory.appendingPathComponent("video.mp4")
//                        try FileManager.default.moveItem(at: localURL, to: tmpUrl)
//                        self.videoURL = tmpUrl  // Save the URL of the downloaded video
//                        print("Download finished and saved")
//                    } catch {
//                        print("Error saving file: \(error.localizedDescription)")
//                    }
//                } else if let error = error {
//                    print("Download error: \(error.localizedDescription)")
//                }
//                self.downloadStarted = false
//            }
//        }
//
//        task.resume()
//        task.progress.publisher(for: \.fractionCompleted)
//            .receive(on: DispatchQueue.main)
//            .assign(to: &$downloadProgress)
//    }
//}

//struct ContentView: View {
//    @StateObject private var downloadManager = DownloadManager()
//    @State private var url: String = ""
//
//    var body: some View {
//        VStack {
//            TextField("Enter YouTube Video URL", text: $url)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//
//            Button("Download Video") {
//                downloadManager.downloadVideo(from: url)
//            }
//            .padding()
//            .background(Color.blue)
//            .foregroundColor(.white)
//            .cornerRadius(10)
//
//            if downloadManager.downloadStarted {
//                ProgressView(value: downloadManager.downloadProgress, total: 1.0)
//                    .progressViewStyle(LinearProgressViewStyle())
//                    .padding()
//            }
//
//            // Display the video player if the video is available
//            if let videoURL = downloadManager.videoURL {
//                VideoPlayerView(url: videoURL)
//                    .frame(height: 300) // Adjust size as needed
//            }
//        }
//        .padding()
//    }
    
//    
//    
//    @StateObject private var downloadManager = DownloadManager()
//       @State private var url: String = ""
//
//       var body: some View {
//           VStack {
//               TextField("Enter YouTube Video URL", text: $url)
//                   .textFieldStyle(RoundedBorderTextFieldStyle())
//                   .padding()
//
//               Button("Download Video") {
//                   downloadManager.downloadVideo(from: url)
//               }
//               .padding()
//               .background(Color.blue)
//               .foregroundColor(.white)
//               .cornerRadius(10)
//
//               if downloadManager.downloadStarted {
//                   ProgressView(value: downloadManager.downloadProgress, total: 1.0)
//                       .progressViewStyle(LinearProgressViewStyle())
//                       .padding()
//               }
//               
//               List(downloadManager.videos, id: \.self) { videoURL in
//                   Button(action: {
//                       // Play video
//                       if let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow }),
//                          let rootVC = keyWindow.rootViewController {
//                           let playerVC = AVPlayerViewController()
//                           playerVC.player = AVPlayer(url: videoURL)
//                           rootVC.present(playerVC, animated: true) {
//                               playerVC.player?.play()
//                           }
//                       }
//                   }) {
//                       Text(videoURL.lastPathComponent)
//                           .padding()
//                           .foregroundColor(.blue)
//                   }
//               }
//           }
//           .padding()
//       }
//}



//struct Video: Identifiable {
//    let id: UUID = UUID()  // Provides a unique identifier
//    let url: URL
//}

struct Video: Identifiable, Hashable {
    let id = UUID()  // Ensures uniqueness
    let url: URL

    static func == (lhs: Video, rhs: Video) -> Bool {
        return lhs.id == rhs.id  // Compare based on unique identifier
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)  // Use the unique identifier for hashing
    }
}



//class DownloadManager: NSObject, ObservableObject {
//    @Published var downloadProgress: Double = 0.0
//    @Published var downloadStarted: Bool = false
//    @Published var videos: [Video] = []  // Store downloaded videos as `Video`
//
//    func downloadVideo(from urlString: String) {
//        guard let url = URL(string: urlString) else { return }
//
//        downloadStarted = true
//        downloadProgress = 0.0
//
//        let task = URLSession.shared.downloadTask(with: url) { localURL, response, error in
//            if let localURL = localURL {
//                let tmpUrl = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString + ".mp4")
//                do {
//                    try FileManager.default.moveItem(at: localURL, to: tmpUrl)
//                    DispatchQueue.main.async {
//                        UISaveVideoAtPathToSavedPhotosAlbum(tmpUrl.path, nil, nil, nil)
//                        self.downloadStarted = false
//                        self.videos.append(Video(url: tmpUrl))  // Create a `Video` instance
//                        print("Download finished and saved at \(tmpUrl)")
//                    }
//                } catch {
//                    DispatchQueue.main.async {
//                        print("Error saving file: \(error.localizedDescription)")
//                        self.downloadStarted = false
//                    }
//                }
//            } else if let error = error {
//                DispatchQueue.main.async {
//                    print("Download error: \(error.localizedDescription)")
//                    self.downloadStarted = false
//                    self.downloadProgress = 0.0
//                }
//                return
//            }
//        }
//
//        task.resume()
//        task.progress.publisher(for: \.fractionCompleted)
//            .receive(on: DispatchQueue.main)
//            .assign(to: &$downloadProgress)
//    }
//}
// 
//class DownloadManager: NSObject, ObservableObject {
//    @Published var downloadProgress: Double = 0.0
//    @Published var downloadStarted: Bool = false
//    @Published var videos: [Video] = []  // Store downloaded videos as `Video`
//
//    func downloadVideo(from urlString: String) {
//        guard let url = URL(string: urlString) else { return }
//
//        downloadStarted = true
//        downloadProgress = 0.0
//
//        let task = URLSession.shared.downloadTask(with: url) { [weak self] localURL, response, error in
//            guard let self = self else { return }
//            
//            if let localURL = localURL {
//                let tmpUrl = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString + ".mp4")
//                do {
//                    try FileManager.default.moveItem(at: localURL, to: tmpUrl)
//                    self.downloadStarted = false
//                    self.videos.append(Video(url: tmpUrl))  // Create a `Video` instance
//                    print("Download finished and saved at \(tmpUrl)")
//                } catch {
//                    print("Error saving file: \(error.localizedDescription)")
//                    self.downloadStarted = false
//                }
//            } else if let error = error {
//                print("Download error: \(error.localizedDescription)")
//                self.downloadStarted = false
//                self.downloadProgress = 0.0
//            }
//        }
//
//        task.resume()
//        task.progress.publisher(for: \.fractionCompleted)
//            .receive(on: DispatchQueue.main)
//            .assign(to: &$downloadProgress)
//    }
//}



//class DownloadManager: NSObject, ObservableObject {
//    @Published var downloadProgress: Double = 0.0
//    @Published var downloadStarted: Bool = false
//    @Published var videos: [Video] = []  // Store downloaded videos as `Video`
//
//    func downloadVideo(from urlString: String) {
//        guard let url = URL(string: urlString) else { return }
//
//        downloadStarted = true
//        downloadProgress = 0.0
//
//        let task = URLSession.shared.downloadTask(with: url) { [weak self] localURL, response, error in
//            guard let self = self else { return }
//            
//            if let localURL = localURL {
//                let tmpUrl = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString + ".mp4")
//                do {
//                    try FileManager.default.moveItem(at: localURL, to: tmpUrl)
//                    self.downloadStarted = false
//                    self.videos.append(Video(url: tmpUrl))  // Create a `Video` instance
//                    print("Download finished and saved at \(tmpUrl)")
//                } catch {
//                    print("Error saving file: \(error.localizedDescription)")
//                    self.downloadStarted = false
//                }
//            } else if let error = error {
//                print("Download error: \(error.localizedDescription)")
//                self.downloadStarted = false
//                self.downloadProgress = 0.0
//            }
//        }
//
//        task.resume()
//        task.progress.publisher(for: \.fractionCompleted)
//            .receive(on: DispatchQueue.main)
//            .assign(to: &$downloadProgress)
//    }
//}


import Foundation
import SwiftUI

// class DownloadManager: NSObject, ObservableObject {
   
//     func downloadVideo(from urlString: String) {
//         guard let url = URL(string: urlString) else { return }

//         downloadStarted = true
//         downloadProgress = 0.0

//         let task = URLSession.shared.downloadTask(with: url) { [weak self] localURL, response, error in
//             guard let self = self else { return }

//             if let localURL = localURL {
//                 let tmpUrl = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString + ".mp4")
//                 do {
//                     try FileManager.default.moveItem(at: localURL, to: tmpUrl)
//                     DispatchQueue.main.async {
//                         self.downloadStarted = false
//                         self.videos.append(Video(url: tmpUrl))  // Create a `Video` instance
//                         print("Download finished and saved at \(tmpUrl)")
//                     }
//                 } catch {
//                     DispatchQueue.main.async {
//                         print("Error saving file: \(error.localizedDescription)")
//                         self.downloadStarted = false
//                     }
//                 }
//             } else if let error = error {
//                 DispatchQueue.main.async {
//                     print("Download error: \(error.localizedDescription)")
//                     self.downloadStarted = false
//                     self.downloadProgress = 0.0
//                 }
//             }
//         }

//         task.resume()
//         task.progress.publisher(for: \.fractionCompleted)
//             .receive(on: DispatchQueue.main)
//             .assign(to: &$downloadProgress)
//     }
// }


// class DownloadManager: NSObject, ObservableObject {
//     @Published var downloadProgress: Double = 0.0
//     @Published var downloadStarted: Bool = false
//     @Published var videos: [Video] = []  // Store downloaded videos as `Video`


//     func downloadVideo(from urlString: String) {
//        guard let url = URL(string: urlString) else { return }
//          guard let url = URL(string: "https://test-app.opencode.iq/download?url=\(urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"),
//                       !urlString.isEmpty else {
//                     return
//                 }

//      downloadStarted = true
//         downloadProgress = 0.0

//         let task = URLSession.shared.downloadTask(with: url) { [weak self] localURL, response, error in
//             guard let self = self else { return }

//             if let localURL = localURL {
//                 let tmpUrl = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString + ".mp4")
//                 do {
//                     try FileManager.default.moveItem(at: localURL, to: tmpUrl)
                    
//                     // Check file size
//                     let downloadedFileSize = try FileManager.default.attributesOfItem(atPath: tmpUrl.path)[.size] as! Int
//                     let expectedFileSize = Int((response as? HTTPURLResponse)?.allHeaderFields["Content-Length"] as? String ?? "0") ?? 0
                    
//                    if downloadedFileSize != expectedFileSize {
//                        DispatchQueue.main.async {
//                            print("Downloaded file is corrupted.")
//                            self.downloadStarted = false
//                            self.downloadProgress = 0.0
//                        }
//                        return
//                    }
                   
//                     DispatchQueue.main.async {
//                         self.downloadStarted = false
//                         self.videos.append(Video(url: tmpUrl))  // Create a `Video` instance
//                         print("Download finished and saved at \(tmpUrl)")
//                     }
//                 } catch {
//                     DispatchQueue.main.async {
//                         print("Error saving file: \(error.localizedDescription)")
//                         self.downloadStarted = false
//                     }
//                 }
//             } else if let error = error {
//                 DispatchQueue.main.async {
//                     print("Download error: \(error.localizedDescription)")
//                     self.downloadStarted = false
//                     self.downloadProgress = 0.0
//                 }
//             }
//         }

//         task.resume()
//         task.progress.publisher(for: \.fractionCompleted)
//             .receive(on: DispatchQueue.main)
//             .assign(to: &$downloadProgress)
//     }
// }



// struct ContentView: View {
//     @StateObject private var downloadManager = DownloadManager()
//     @State private var url: String = ""
//     @State private var selectedVideo: Video?

//     var body: some View {
//         NavigationView {
//             VStack {
//                 TextField("Enter YouTube Video URL", text: $url)
//                     .textFieldStyle(RoundedBorderTextFieldStyle())
//                     .padding()

//                 Button("Download Video") {
//                     downloadManager.downloadVideo(from: url)
//                 }
//                 .padding()
//                 .background(Color.blue)
//                 .foregroundColor(.white)
//                 .cornerRadius(10)

//                 if downloadManager.downloadStarted {
//                     ProgressView(value: downloadManager.downloadProgress, total: 1.0)
//                         .progressViewStyle(LinearProgressViewStyle())
//                         .padding()
//                 }
                
//                 List(downloadManager.videos) { video in
//                     Button(action: {
//                         selectedVideo = video
//                     }) {
//                         Text(video.url.lastPathComponent)
//                             .padding()
//                             .foregroundColor(.blue)
//                     }
//                 }
//             }
//             .padding()
//             .sheet(item: $selectedVideo) { video in
//                 return VideoPlayerView(url: video.url)
//                     .onAppear {
//                         print("Presenting video player for \(video.url)")
//                     }
//             }
//         }
//     }
// }




import SwiftUI
import Combine

//class DownloadManager: NSObject, ObservableObject {
//    @Published var downloadProgress: Double = 0.0
//    @Published var downloadStarted: Bool = false
//    @Published var downloadStatus: String = "Ready to download"
//    @Published var videos: [Video] = []  // Store downloaded videos as `Video`
//
//    func downloadVideo(from urlString: String) {
////        guard let url = URL(string: urlString) 
////        else {
////            DispatchQueue.main.async {
////                self.downloadStatus = "Invalid URL"
////            }
////            return
////        }
//        
//        guard let url = URL(string: "https://test-app.opencode.iq/download?url=\(urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"),
//              !urlString.isEmpty else {
//            DispatchQueue.main.async {
//                self.downloadStatus = "Invalid URL"
//            }
//            return
//        }
//        downloadStarted = true
//        downloadProgress = 0.0
//        downloadStatus = "Download Started"
//
//        let task = URLSession.shared.downloadTask(with: url) { [weak self] localURL, response, error in
//            guard let self = self else { return }
//
//            if let localURL = localURL {
//                let tmpUrl = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString + ".mp4")
//                do {
//                    try FileManager.default.moveItem(at: localURL, to: tmpUrl)
//                    let downloadedFileSize = try FileManager.default.attributesOfItem(atPath: tmpUrl.path)[.size] as! Int
//                    let expectedFileSize = Int((response as? HTTPURLResponse)?.allHeaderFields["Content-Length"] as? String ?? "0") ?? 0
//                    
////                    if downloadedFileSize != expectedFileSize {
////                        DispatchQueue.main.async {
////                            self.downloadStatus = "Downloaded file is corrupted"
////                            self.downloadStarted = false
////                            self.downloadProgress = 0.0
////                        }
////                        return
////                    }
//                   
//                    DispatchQueue.main.async {
//                        self.downloadStarted = false
//                        self.downloadProgress = 1.0
//                        self.downloadStatus = "Download Complete"
//                        self.videos.append(Video(url: tmpUrl))  // Create a `Video` instance
//                    }
//                } catch {
//                    DispatchQueue.main.async {
//                        self.downloadStatus = "Error saving file: \(error.localizedDescription)"
//                        self.downloadStarted = false
//                    }
//                }
//            } else if let error = error {
//                DispatchQueue.main.async {
//                    self.downloadStatus = "Download error: \(error.localizedDescription)"
//                    self.downloadStarted = false
//                    self.downloadProgress = 0.0
//                }
//            }
//        }
//
//        task.resume()
//        task.progress.publisher(for: \.fractionCompleted)
//            .receive(on: DispatchQueue.main)
//            .assign(to: &$downloadProgress)
//    }
//}


//class DownloadManager: NSObject, ObservableObject {
//    @Published var downloadProgress: Double = 0.0
//    @Published var downloadStarted: Bool = false
//    @Published var downloadStatus: String = "Ready to download"
//    @Published var videos: [Video] = []  // Store downloaded videos as `Video`
//    
//    private var cancellables = Set<AnyCancellable>()  // This line defines the cancellables set
//
//
//    func downloadVideo(from urlString: String) {
//        guard let url = URL(string: "https://test-app.opencode.iq/download?url=\(urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"),
//              !urlString.isEmpty else {
//            DispatchQueue.main.async {
//                self.downloadStatus = "Invalid URL"
//            }
//            return
//        }
//        
//        downloadStarted = true
//        downloadProgress = 0.0
//        downloadStatus = "Download Started"
//        
//        let task = URLSession.shared.downloadTask(with: url) { [weak self] localURL, response, error in
//            guard let self = self else { return }
//
//            if let error = error {
//                DispatchQueue.main.async {
//                    self.handleDownloadError(error)
//                }
//                return
//            }
//
//            guard let localURL = localURL, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//                DispatchQueue.main.async {
//                    self.downloadStatus = "Failed to download file"
//                    self.downloadStarted = false
//                }
//                return
//            }
//
//            let destinationURL = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString + ".mp4")
//            do {
//                try FileManager.default.moveItem(at: localURL, to: destinationURL)
//                let downloadedFileSize = try FileManager.default.attributesOfItem(atPath: destinationURL.path)[.size] as! Int64
//                let expectedFileSize = Int64(httpResponse.allHeaderFields["Content-Length"] as? String ?? "0") ?? 0
//                
//                if downloadedFileSize != expectedFileSize {
//                    DispatchQueue.main.async {
//                        self.downloadStatus = "Downloaded file is incomplete or corrupted"
//                        self.downloadStarted = false
//                        self.downloadProgress = 0.0
//                    }
//                    return
//                }
//                
//                DispatchQueue.main.async {
//                    self.downloadProgress = 1.0
//                    self.downloadStarted = false
//                    self.downloadStatus = "Download Complete"
//                    self.videos.append(Video(url: destinationURL))
//                }
//            } catch {
//                DispatchQueue.main.async {
//                    self.downloadStatus = "Error saving file: \(error.localizedDescription)"
//                    self.downloadStarted = false
//                }
//            }
//        }
//
//        task.resume()
//        task.progress.publisher(for: \.fractionCompleted)
//            .receive(on: DispatchQueue.main)
//            .sink { progress in
//                self.downloadProgress = progress
//                if progress < 1.0 {
//                    self.downloadStatus = "Downloading (\(Int(progress * 100))%)"
//                }
//            }
//            .store(in: &cancellables)  // Assuming you have defined a `Set<AnyCancellable>` to manage your subscriptions
//    }
//
//    private func handleDownloadError(_ error: Error) {
//        self.downloadStatus = "Download error: \(error.localizedDescription)"
//        self.downloadStarted = false
//        self.downloadProgress = 0.0
//    }
//}

import Combine
import Foundation

class DownloadManager: NSObject, ObservableObject {
    @Published var downloadProgress: Double = 0.0
    @Published var downloadStarted: Bool = false
    @Published var downloadStatus: String = "Ready to download"
    @Published var videos: [Video] = []

    private var cancellables = Set<AnyCancellable>()
    private let videosKey = "DownloadedVideos"

    override init() {
        super.init()
        loadVideoPaths()
    }

    func downloadVideo(from urlString: String) {
        guard let url = URL(string: "https://test-app.opencode.iq/download?url=\(urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"),
              !urlString.isEmpty else {
            DispatchQueue.main.async {
                self.downloadStatus = "Invalid URL"
            }
            return
        }
        
        downloadStarted = true
        downloadProgress = 0.0
        downloadStatus = "Download Started"

        let task = URLSession.shared.downloadTask(with: url) { [weak self] localURL, response, error in
            guard let self = self else { return }

            if let error = error {
                DispatchQueue.main.async {
                    self.downloadStatus = "Download error: \(error.localizedDescription)"
                    self.downloadStarted = false
                    self.downloadProgress = 0.0
                }
                return
            }

            guard let localURL = localURL else {
                DispatchQueue.main.async {
                    self.downloadStatus = "Failed to download file"
                    self.downloadStarted = false
                }
                return
            }

            let destinationURL = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString + ".mp4")
            do {
                try FileManager.default.moveItem(at: localURL, to: destinationURL)
                DispatchQueue.main.async {
                    self.videos.append(Video(url: destinationURL))
                    self.saveVideoPath(destinationURL.path)
                    self.downloadProgress = 1.0
                    self.downloadStarted = false
                    self.downloadStatus = "Download Complete"
                }
            } catch {
                DispatchQueue.main.async {
                    self.downloadStatus = "Error saving file: \(error.localizedDescription)"
                    self.downloadStarted = false
                }
            }
        }

        task.resume()

        task.progress.publisher(for: \.fractionCompleted)
            .receive(on: DispatchQueue.main)
            .sink { progress in
                self.downloadProgress = progress
                if progress < 1.0 {
                    self.downloadStatus = "Downloading (\(Int(progress * 100))%)"
                }
            }
            .store(in: &cancellables)
    }

    private func saveVideoPath(_ path: String) {
        var paths = UserDefaults.standard.stringArray(forKey: videosKey) ?? []
        paths.append(path)
        UserDefaults.standard.set(paths, forKey: videosKey)
    }

    private func loadVideoPaths() {
        let paths = UserDefaults.standard.stringArray(forKey: videosKey) ?? []
        videos = paths.map { Video(url: URL(fileURLWithPath: $0)) }
    }
    
    func removeVideo(_ video: Video) {
        // Remove the video from the videos array
        videos.removeAll { $0.id == video.id }
        
        // Remove the video path from UserDefaults
        var paths = UserDefaults.standard.stringArray(forKey: videosKey) ?? []
        if let index = paths.firstIndex(of: video.url.path) {
            paths.remove(at: index)
            UserDefaults.standard.set(paths, forKey: videosKey)
        }
        
        // Delete the video file from the file system
        do {
            try FileManager.default.removeItem(at: video.url)
        } catch {
            print("Failed to delete video file: \(error)")
        }
    }

}


struct ContentView: View {
    @StateObject private var downloadManager = DownloadManager()
    @State private var url: String = ""
    @State private var selectedVideo: Video?

    var body: some View {
        NavigationView {
            VStack {
//                if url=="" {
//                   
//                }else{
//                    WebView(url: URL(string: url)!)
//                }
               
                TextField("Enter YouTube Video URL", text: $url)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Download Video") {
                    downloadManager.downloadVideo(from: url)
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)

                Text(downloadManager.downloadStatus)
                    .padding()

                if downloadManager.downloadStarted {
                    ProgressView(value: downloadManager.downloadProgress, total: 1.0)
                        .progressViewStyle(LinearProgressViewStyle())
                        .padding()
                }

                List(downloadManager.videos) { video in
                    Button(action: {
                        selectedVideo = video
                    }) {
                        Text(video.url.lastPathComponent)
                            .padding()
                            .foregroundColor(.blue)
                    }.frame(width:200,height: .infinity)
                        .background(.green)
                    
//                    Spacer()
//                    Button(action: {
//                        downloadManager.removeVideo(video)
//                    }) {
//                        Image(systemName: "trash")
//                            .foregroundColor(.red)
//                    }
                }
//                List {
//                    ForEach(downloadManager.videos, id: \.self) { video in
//                        HStack {
//                            Button(action: {
//                                selectedVideo = video
//                            }) {
//                                Text(video.url.lastPathComponent)
//                                    .padding()
//                                    .foregroundColor(.blue)
//                            }
//                            Spacer()
//                            Button(action: {
//                                downloadManager.removeVideo(video)
//                            }) {
//                                Image(systemName: "trash")
//                                    .foregroundColor(.red)
//                            }
//                        }
//                    }
//                }
                
//                List(downloadManager.videos) { video in
//                    HStack {
//                        Button(action: {
//                            selectedVideo = video
//                        }) {
//                            Text(video.url.lastPathComponent)
//                                .padding()
//                                .foregroundColor(.blue)
//                        }
//                        Spacer()
//                        Button(action: {
//                            downloadManager.removeVideo(video)
//                        }) {
//                            Image(systemName: "trash")
//                                .foregroundColor(.red)
//                        }
//                    }
//                }

            }
            .padding()
            .sheet(item: $selectedVideo) { video in
                VideoPlayerView(url: video.url)
            }
        }
    }
}



import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}



#Preview {
    ContentView()
}
