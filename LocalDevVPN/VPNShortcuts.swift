//
//  VPNShortcuts.swift
//  LocalDevVPN
//
//  Created by se2crid on 7/12/2025.
//

import Foundation
import NetworkExtension

#if canImport(AppIntents)
import AppIntents

@available(iOS 16.0, *)
struct StartLocalDevVPNIntent: AppIntent {
    static var title: LocalizedStringResource = "Start LocalDevVPN"
    static var description = IntentDescription("Connects LocalDevVPN without launching the app.")

    static var openAppWhenRun = false

    @MainActor
    func perform() async throws -> some IntentResult {
        TunnelManager.shared.startVPN()
        return .result()
    }
}

@available(iOS 16.0, *)
struct LocalDevVPNActions: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: StartLocalDevVPNIntent(),
            phrases: [
                "Start \(.applicationName)",
                "Connect to \(.applicationName)",
                "Enable \(.applicationName)"
            ],
            shortTitle: "Start VPN",
            systemImageName: "lock.shield"
        )
    }
}
#endif
