//
//  Data.swift
//  Outfit Recorder
//
//  Created by Hansol Yang on 2023/05/15.
//

import Foundation;
import RealmSwift;
import Record;

@MainActor
func openSyncedRealm(record: Record) async {
    do {
        let realm = try await Realm();
    }
}
