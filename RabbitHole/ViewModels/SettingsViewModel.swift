//
//  SettingsViewModel.swift
//  RabbitHole
//
//  Created by Anthony Nasser on 2/19/23.
//

import SwiftUI
import CloudKit
import Foundation

struct TopicModel: Hashable {
    let topic: String
    let record: CKRecord
}

let userDefaults = UserDefaults.standard

class SettingsViewModel : ObservableObject {
    @Published var showInputField: Bool = false
    @Published var addRH: String = ""
    @Published var topicStarters: [String] = []
    
    @Published var isSignedInToiCloud: Bool = false
    @Published var userName: String = ""
    @Published var error: String = ""
    
    init() {
//        getiCloudStatus()
        topicStarters = userDefaults.object(forKey: "myTopics") as? [String] ?? []
    }
    
    func deleteItems(at offsets: IndexSet) {
        topicStarters.remove(atOffsets: offsets)
        userDefaults.set(topicStarters, forKey: "myTopics")
    }

    
//    func getiCloudStatus() {
//        CKContainer.default().accountStatus { returnedStatus, returnedError in
//            DispatchQueue.main.async {
//                switch returnedStatus {
//                case .available:
//                    self.isSignedInToiCloud = true
//                case .noAccount:
//                    self.error = CloudKitError.iCloudAccountNotFound.rawValue
//                case .couldNotDetermine:
//                    self.error = CloudKitError.iCloudAccountNotDetermined.rawValue
//                case .restricted:
//                    self.error = CloudKitError.iCloudAccountRestricted.rawValue
//                default:
//                    self.error = CloudKitError.iCloudAccountUnknown.rawValue
//                }
//            }
//        }
//    }
    
//    enum CloudKitError: String, LocalizedError {
//        case iCloudAccountNotFound
//        case iCloudAccountNotDetermined
//        case iCloudAccountRestricted
//        case iCloudAccountUnknown
//    }
    
//    func addTopicsToiCloud(topic: String) {
//        let topicsRecord = CKRecord(recordType: "Topics")
//        topicsRecord["topic"] = topic
//
//        DispatchQueue.main.async {
//            if (!self.topicStarters.contains(TopicModel(topic: topic, record: topicsRecord))) {
//                self.topicStarters.append(TopicModel(topic: topic, record: topicsRecord))
//            }
//        }
//
//        saveItem(record: topicsRecord)
//    }
    
//    private func saveItem(record: CKRecord) {
//        DispatchQueue.main.async {
//            self.addRH = ""
//        }
//        CKContainer.default().privateCloudDatabase.save(record) { returnedRecord, returnedError in
//            print("Record: \(String(describing: returnedRecord))")
//            print("Error: \(String(describing: returnedError))")
//        }
//    }
    
//    func fetchItems() {
//        let predicate = NSPredicate(value: true)
//        let query = CKQuery(recordType: "Topics", predicate: predicate)
//        query.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
//        let queryOperation = CKQueryOperation(query: query)
//
//        var returnedItems: [TopicModel] = []
//
//        queryOperation.recordMatchedBlock = { returnedRecordID, returnedResult in
//            switch returnedResult {
//            case .success(let record):
//                guard let topic = record["topic"] as? String else { return }
//                returnedItems.append(TopicModel(topic: topic, record: record))
//            case .failure(let error):
//                print("Error recordMatchedBlock: \(error)")
//            }
//
//        }
//        queryOperation.queryResultBlock = { returnedResult in
//            DispatchQueue.main.async {
//                topicStarters = returnedItems
//            }
//        }
//
//        addOperations(operation: queryOperation)
//    }
    
//    func updateItems(topic: TopicModel) {
//        let record = topic.record
//        record["topic"] = "Something new"
//        saveItem(record: record)
//    }
    
//    func deleteItem(indexSet: IndexSet) {
//        guard let index = indexSet.first else { return }
//        let topic = topicStarters[index]
//        let record = topic.record
//
//        CKContainer.default().privateCloudDatabase.delete(withRecordID: record.recordID) { returnedRecordID, returnedError in
//            DispatchQueue.main.async {
//                topicStarters.remove(at: index)
//            }
//        }
//    }
    
    func addOperations(operation: CKDatabaseOperation) {
        CKContainer.default().privateCloudDatabase.add(operation)
    }
}
