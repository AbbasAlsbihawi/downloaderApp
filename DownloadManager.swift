////
////  DownloadManager.swift
////  downloaderApp
////
////  Created by Abbas on 26/04/2024.
////
//
//import Foundation
//import Combine
//import UIKit
//
//class DownloadManager: NSObject, ObservableObject {
//    @Published var downloadProgress: Double = 0.0
//    @Published var downloadStarted: Bool = false
//
//    func downloadVideo(from urlString: String) {
//        guard let url = URL(string: urlString) else { return }
//
//        downloadStarted = true
//        downloadProgress = 0.0
//
//        let task = URLSession.shared.downloadTask(with: url) { localURL, response, error in
//            if let localURL = localURL {
//                do {
//                    let tmpUrl = FileManager.default.temporaryDirectory.appendingPathComponent("video.mp4")
//                    try FileManager.default.moveItem(at: localURL, to: tmpUrl)
//                    DispatchQueue.main.async {
//                        UISaveVideoAtPathToSavedPhotosAlbum(tmpUrl.path, nil, nil, nil)
//                        self.downloadStarted = false
//                        print("Download finished and saved")
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
//
//        // Attach progress observer using Combine
//        task.progress.publisher(for: \.fractionCompleted)
//            .receive(on: DispatchQueue.main)
//            .assign(to: &$downloadProgress)
//    }
//}
//
