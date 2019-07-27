//
//  NukeDataLoadingMock.swift
//  TheMovieDBTests
//
//  Created by Maxim Bazarov on 27.07.19.
//  Copyright © 2019 Maxim Bazarov. All rights reserved.
//

import Nuke

class MockDataLoading: DataLoading {

    let dataCollection: [String: File]
    let defaultFile: File

    struct File {
        let data: Data?
        let mimeType: MimeType
    }

    enum MimeType: String {
        case jpeg = "image/jpeg"
        case error = "error"
    }

    init(defaultFile: File, dataCollection: [String: File]? = nil) {
        self.dataCollection = dataCollection ?? [:]
        self.defaultFile = defaultFile
    }

    class FakeCancellable: Cancellable  {
        func cancel() {}
    }

    func loadData(with request: URLRequest, didReceiveData: @escaping (Data, URLResponse) -> Void, completion: @escaping (Error?) -> Void) -> Cancellable {
        guard let url = request.url  else {
            completion(nil)
            return FakeCancellable()
        }



        let file = dataCollection[url.absoluteString] ?? defaultFile

        guard let data = file.data else {
            completion(nil)
            return FakeCancellable()
        }

        let response = URLResponse(
            url: url,
            mimeType: file.mimeType.rawValue,
            expectedContentLength: data.count,
            textEncodingName: "MOCK"
        )

        didReceiveData(data, response)
        completion(nil)
        return FakeCancellable()
    }


}

class NoCaching : ImageCaching, DataCaching {
    func cachedData(for key: String) -> Data? {
        return nil
    }

    func storeData(_ data: Data, for key: String) {
    }

    func cachedResponse(for request: ImageRequest) -> ImageResponse? {
        return nil
    }

    func storeResponse(_ response: ImageResponse, for request: ImageRequest) {
    }

    func removeResponse(for request: ImageRequest) {
    }


}

extension ImagePipeline {
    
    convenience init(
        defaultFile: MockDataLoading.File,
        dataCollection: [String: MockDataLoading.File]? = nil
    )
    {
        self.init {
            $0.dataLoader = MockDataLoading(
                defaultFile: defaultFile,
                dataCollection: dataCollection
            )
            $0.imageCache = NoCaching()
        }
    }
}
