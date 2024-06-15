import QtQuick 2.12
import org.freedesktop.gstreamer.Qt6GLVideoItem

// NOTE: Deprecated, gstreamer and qmlglsink is not a valid solution for low latency video playback

GstGLQt6VideoItem {
    anchors.fill: parent
    id: mainVideoGStreamer
    objectName: "mainVideoGStreamer"

    Component.onCompleted: {
        console.log("mainVideoGStreamer (Qmlglsink) created")
        _secondary_video_gstreamer_qml.check_common_mistakes_then_init(mainVideoGStreamer)
    }
}
