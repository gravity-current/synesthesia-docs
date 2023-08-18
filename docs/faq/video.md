# Video FAQ

### How can I save video output from Synesthesia?
**macOS**

The easiest way to save video output on a Mac is to use Syphon Recorder. [You can download it for free here](https://syphon.github.io/recorder).

1. Make sure the option "Syphon Output" is checked in the Settings panel in Synesthesia.
2. Open Syphon Recorder. You should see a drop down menu in the bottom left.
3. Select Synesthesia.
4. Set your recording preferences in the top bar menu of Syphon Recorder (make sure it is recording audio, too).
5. Hit the "Record" button.

**Windows**

There is no equivalent "Spout Recorder" for Windows. However, you can use OBS Studio ([free download here](https://obsproject.com/download)) to record a Spout stream. After installing OBS you'll also need to install the Spout to Source OBS Plugin that you can find here

1. Make sure "Spout Output" is enabled in the Settings panel in Synesthesia.
2. After installing spout2source, open up OBS and go to the "Sources" area.
3. Click the "+" Icon to add a Spout2 Capture source.
4. Right click on the Spout2 Capture source and select "Properties".
5. Under Spout Senders you should see Synesthesia as one of your options.
6. In OBS you can configure your video and audio recording settings under File→Settings.
7. Click "Start Recording" and then "Stop Recording" once you're done.

---

### What resolutions does Synesthesia support?
If you have a Standard license you can run Synesthesia up to 1080p.

If you have a Pro license you can run Synesthesia at any resolution or aspect ratio you'd like. In addition to a 4k option in the drop-down menu, you can click on "Custom Resolution" to input any width and height. You'll also have an additional option that governs how Synesthesia should treat multi-pass shaders. For most purposes you'll want to use "Scale Passes Relatively" when using a custom resolution, but certain simulation or shaders that use raw xy values in their math will look best with the other two options.

---

### How can I send visuals to a projector or second display?
You can open a full screen pop-out visualizer to view Synesthesia's output on any screen, including an external projector or second display. To output visuals to a second connected display, you'll need to have your computer's settings treating that display as an extended, or second desktop (AKA, ensure "Screen Mirroring" is off).

**macOS**

Press `Cmd + S` to show the pop-out visualizer, drag it over to the screen where you want to fullscreen it, and press `Cmd + Shift + F` to fullscreen it on that display. Alternately, you can access these same controls directly in the Settings tab. Simple click on "Show Window" and then "Toggle Fullscreen". You can use `Cmd + Shift + F`, or click on the green dot in the window's menu bar to exist fullscreen mode.

(NOTE: If you lose your main display, giving you a black screen and making you unable to access Synesthesia's GUI while the fullscreen output is open, you need to modify your OSX settings. Change "Mission Control" -> "Displays have separate Spaces" to ON, and then log out of macOS and back in).

**Windows**

Go to the Settings panel. From the "Displays" dropdown menu, you should see all connected displays. Select the one you'd like to send fullscreen output to. Then click the "toggle fullscreen" button. You can use the Esc key to exit fullscreen mode. If the desired display is not visible in the dropdown menu, click on the refresh button or restart Synesthesia, ensuring all displays/projectors are connected when it starts.

---


### Does Synesthesia support Syphon/Spout Input/Output?
Yes! Spout and Syphon are frameworks that allow you to send live video streams from one Syphon/Spout enabled application to another. Syphon runs on macOS, while Spout runs on Windows, but they are basically equivalent.

**Output**

1. Check the box labeled "Syphon/Spout Output" in the Settings tab. This will create a server that you can open as a source in other VJ softwares.
2. Rename the Sender Name to be whatever you'd like. This name should appear as an input in other Syphon/Spout compatible software.
3. If the "Constant Output Resolution" box is unchecked, Synesthesia will output to Syphon/Spout at the same resolution the scene is running at. If it is checked, Syphon/Spout will maintain a constant resolution regardless of the scene's resolution, which can help to maintain consistency when working with other software.  

**Input**

Syphon/Spout input can be used in the same way Synesthesia uses other videos or images. Only one Syphon/Spout input source may be active at one time.

1. To enable Syphon or Spout input, check the box labeled "Syphon/Spout Input" in the Settings tab. This will create a dropdown menu immediately below it with a list of all available Syphon/Spout servers.
2. Select which Syphon or Spout server you want to pull live video from. If no servers are detected, try restarting your other application or clicking the refresh button right next to the dropdown.
3. Once you've selected a server, go back to the media section in the main control panel. Now you should see your Syphon/Spout input source available to select near the top next to other live video sources.

---

### Does Synesthesia support NDI?
Yes, Synesthesia Pro supports both NDI Input and Output. It functions very similarly to Syphon/Spout input and output. Only one NDI Input source can be active at a time.
