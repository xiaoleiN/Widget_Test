//
//  eggWidget.swift
//  eggWidget
//
//  Created by 任晓磊 on 2024/11/19.
//

import WidgetKit
import SwiftUI

// Entry model，表示 Widget 中的数据
struct EggWidgetEntry: TimelineEntry {
    let date: Date
     let imageName: String
}

struct EggWidgetTimelineProvider: TimelineProvider {
    let imageName: String

    func placeholder(in context: Context) -> EggWidgetEntry {
        EggWidgetEntry(date: Date(), imageName: imageName)
    }

    func getSnapshot(in context: Context, completion: @escaping (EggWidgetEntry) -> Void) {
        let entry = EggWidgetEntry(date: Date(), imageName: imageName)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<EggWidgetEntry>) -> Void) {
        let entries: [EggWidgetEntry] = [
            EggWidgetEntry(date: Date(), imageName: imageName)
        ]
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

// Widget 内容视图
struct EggWidgetEntryView: View {
    var entry: EggWidgetEntry

    var body: some View {
        Image(entry.imageName)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
            .clipped()
    }
}
struct EggWidget1: Widget {
    let kind: String = "EggWidget1"
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: EggWidgetTimelineProvider(imageName: "img1")) { entry in
            EggWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Egg 1")
        .description("\n I'm Egg 1.")
    }
}
struct EggWidget2: Widget {
    let kind: String = "EggWidget2"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: EggWidgetTimelineProvider(imageName: "img2")) { entry in
            EggWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Egg 2")
        .description("\n I'm Egg 2.")
    }
}
struct EggWidget3: Widget {
    let kind: String = "EggWidget3"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: EggWidgetTimelineProvider(imageName: "img3")) { entry in
            EggWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Egg 3")
        .description("\n I'm Egg 3.")
    }
}
struct EggWidget4: Widget {
    let kind: String = "EggWidget4"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: EggWidgetTimelineProvider(imageName: "img4")) { entry in
            EggWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Egg 4")
        .description("\n I'm Egg 4.")
    }
}
