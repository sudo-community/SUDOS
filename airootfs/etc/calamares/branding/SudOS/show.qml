/* === This file is part of Calamares Extensions - <http://github.com/calamares-extensions> ===
 *
 * SPDX-FileCopyrightText: 2021 Adriaan de Groot <groot@kde.org>
 * SPDX-License-Identifier: BSD-2-Clause
 */

/* This is a simple slideshow for use during the *exec* phase of
 * installation, that displays a handful of slides. It uses
 * the *Presentation* QML components -- this allows, for instance,
 * notes to be added to slides, and for arrow navigation to be
 * used. But at its core it's just a bunch of images, repeating.
 *
 * For this kind of limited functionality, it may be better to
 * use the "plain images" slideshow format in Calamares, although
 * then you don't have any say in how things are animated.
 *
 * This slideshow is written for *slideshowAPI* version 1, so in
 * `branding.desc` set that appropriately.
 */


import QtQuick 2.0  // Basic QML
import calamares.slideshow 1.0  // Calamares slideshow: Presentation
import io.calamares.ui 1.0  // Calamares internals: Branding

/* *Presentation* comes from the pre-installed calamares.slideshow
 * that comes with Calamares itself. See `Presentation.qml` in the
 * Calamares repository for details and documentation.
 *
 * The important parts of presentation are:
 *  - it has a property *activatedInCalamares* which is set to *true*
 *    when the slideshow becomes visible, *false* afterwards.
 *  - it expects one or more children with a property *isSlide*
 *    set to *true*.
 *  - it has a function *goToNextSlide()* to do just that (where
 *    "slides" is the sequence of children that have property
 *    *isSlide* set to *true*.
 *
 */
Presentation
{
    id: presentation

    Timer {
        interval: 6000 // ⬅ 6 seconds between slides
        running: presentation.activatedInCalamares
        repeat: true
        onTriggered: presentation.goToNextSlide()
    }

    function onActivate() { }
    function onLeave() { }

    Rectangle {
        id: mybackground
        anchors.fill: parent
        color: Branding.styleString(Branding.SidebarBackground)
        z: -1
    }

    // Enlarged ImageSlide
    Image {
        src: "slide1.png"
        width: parent.width * 0.9
        height: parent.height * 0.9
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
        opacity: 1.0
        Behavior on opacity {
            NumberAnimation {
                duration: 600
            }
        }
    }

    Image {
        src: "slide2.png"
        width: parent.width * 0.9
        height: parent.height * 0.9
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
        opacity: 1.0
        Behavior on opacity {
            NumberAnimation {
                duration: 600
            }
        }
    }
}
